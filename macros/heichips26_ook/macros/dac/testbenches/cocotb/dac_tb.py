# SPDX-FileCopyrightText: 2026 The HeiChips Contributors
# SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1

import os
import logging
from pathlib import Path

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, ClockCycles, Timer
from cocotb_tools.runner import get_runner

sim      = os.getenv("SIM", "icarus")
pdk_root = os.getenv("PDK_ROOT", Path("~/.ciel").expanduser())
pdk      = os.getenv("PDK", "ihp-sg13cmos5l")
scl      = os.getenv("SCL", "sg13cmos5l_stdcell")
gl       = os.getenv("GL", "0").strip().lower() in ("1", "true", "yes", "on")

hdl_toplevel = "dac"

# ---------------------------------------------------------------------------
# Must be kept in sync with rtl/dac.sv's localparams and per-tap lookup
# functions. Synthesis erases internal signal names -- GL mode cannot see
# dut.tap_sel/dut.streak/dut.hold_low/etc at all, only synthesis-preserved
# ports survive with matching names. So scenarios here come in two tiers:
#
#   - Black-box (work in both RTL and GL mode): touch only clk_ref, clk_fb,
#     rst_ni, dac_out. Basic sanity only -- duty direction, not tap
#     transitions, since gearing dynamics aren't something you can infer
#     reliably from dac_out alone.
#   - White-box (RTL-only, skipped when gl): read dut.tap_sel,
#     dut.hold_low/high, dut.break_low/high, dut.streak, dut.settling,
#     dut.duty, dut.fb_edge directly. This is the real verification of the
#     gearing mechanism -- gear-up ladder correctness (exact threshold
#     reload per tap), the coarsest/finest-tap edge cases, the mandatory
#     gear-down cascade, and the exact 1,1,2,3,4,... streak sequence.
#
# All 9 scenarios run inside ONE @cocotb.test(), not 9 separate ones.
# cocotb 2.0 automatically cancels tasks forked via cocotb.start_soon()
# (the clk_ref/clk_fb clock drivers) at each test boundary, and cancelling
# a task that's suspended inside a Timer wait turns out to be the fragile
# operation in this cocotb+Icarus combo -- it either wedges the simulator
# outright or raises a stray CancelledError into whatever the next test
# happens to be doing. Splitting into 9 @cocotb.test()s means 8 boundaries
# for that to happen at; one test means it never happens at all. Each
# scenario's pass/fail is still tracked independently below so one failure
# doesn't black out the rest.
# ---------------------------------------------------------------------------
DUTY_BITS = 13
DUTY_INIT = 1 << (DUTY_BITS - 1)
STEP_SHIFT = 3   # non-TAP_MAX taps step 2**STEP_SHIFT duty LSBs per correction

TAP_MIN = 6    # stage_q[6]  -> FB_DIV=128  (coarsest, start tap)
TAP_MAX = 12   # stage_q[12] -> FB_DIV=8192 (finest tap)

# tap -> (hold_low, hold_high, break_low, break_high), mirroring the exact
# case-statement constants in rtl/dac.sv's tap_hold_low/high/break_low/high
# functions. tap 12's HOLD/BREAK are wider than the rest -- see dac.sv.
TAP_PARAMS = {
    6:  (23,   25,   15,   33),
    7:  (47,   49,   39,   57),
    8:  (94,   96,   86,   104),
    9:  (188,  190,  180,  198),
    10: (377,  379,  369,  387),
    11: (755,  757,  747,  765),
    12: (1509, 1513, 1472, 1544),
}

CLK_REF_PERIOD_NS = 12.5  # 80MHz

SNAPSHOT_CYCLES = 64    # short averaging window for a black-box "current duty" read
HOLD_SETTLE_CYCLES = 10000  # generous: comfortably longer than a full gear-up climb (~6000 cycles)

DUTY_INIT_PCT = DUTY_INIT / (1 << DUTY_BITS) * 100.0  # 50.0%


def clk_fb_period_ns(freq_mhz):
    """Period for a clk_fb frequency in MHz, rounded to the nearest 1fs
    (Clock()/manual toggling needs a period that splits evenly at the
    simulator's declared precision).

    Rounding to 1ps (not 1fs) was fine until FB_DIV=8192 made the finest
    tap's resolution ~0.287MHz/cycle: at 433.92MHz, 1ps rounding
    (2.3045723ns -> 2.304ns) silently shifts the simulated frequency by
    ~0.1MHz, large enough at that resolution to land every period just
    outside the hold zone (see dac_runner()'s matching 1fs timescale --
    the simulator re-rounds to its own declared precision regardless of
    what precision this function computes to, so both have to match)."""
    half_fs = round(1000.0 / freq_mhz * 1_000_000.0 / 2.0)
    return 2 * half_fs / 1_000_000.0


class FbClockDriver:
    """Drives clk_fb by hand (not via cocotb.clock.Clock) so the frequency
    can be changed live via set_freq() -- needed for the gear-down
    scenario (lock at a fine tap, then abruptly jump frequency)."""
    def __init__(self, dut, freq_mhz):
        self.dut = dut
        self.period_ns = clk_fb_period_ns(freq_mhz)
        dut.clk_fb.value = 0

    def set_freq(self, freq_mhz):
        self.period_ns = clk_fb_period_ns(freq_mhz)

    async def _run(self):
        while True:
            await Timer(self.period_ns / 2.0, units="ns")
            self.dut.clk_fb.value = not bool(self.dut.clk_fb.value)


async def settle(dut, cycles, chunk=2000):
    logger = logging.getLogger("dac_tb")
    done = 0
    while done < cycles:
        step = min(chunk, cycles - done)
        await ClockCycles(dut.clk_ref, step)
        done += step
        logger.info(f"settling: {done}/{cycles} clk_ref cycles")


async def reset(dut, cycles=4):
    dut.rst_ni.value = 0
    await ClockCycles(dut.clk_ref, cycles)
    dut.rst_ni.value = 1
    await RisingEdge(dut.clk_ref)


async def wait_for_fb_edge(dut, timeout_cycles=20000):
    """Advance clk_ref one cycle at a time until dut.fb_edge is high --
    the RTL's own per-period synchronization point. By the time this
    returns, all of that edge's NBA-scheduled register updates (tap_sel,
    duty, streak, ...) are already visible (standard cocotb post-edge
    read semantics), so callers can just read dut.* immediately after."""
    for _ in range(timeout_cycles):
        await RisingEdge(dut.clk_ref)
        if int(dut.fb_edge.value) == 1:
            return
    raise AssertionError("fb_edge did not arrive within timeout")


async def climb_to_tap_max(dut, edge_budget=40):
    """Run (at whatever frequency is already driving clk_fb -- call this
    with clk_fb at the 433.92MHz target) until tap_sel reaches TAP_MAX."""
    for _ in range(edge_budget):
        if int(dut.tap_sel.value) == TAP_MAX:
            return
        await wait_for_fb_edge(dut)
    raise AssertionError(
        f"did not reach TAP_MAX within {edge_budget} edges, stuck at tap {int(dut.tap_sel.value)}"
    )


async def measure_dac_duty(dut, cycles=1 << DUTY_BITS):
    """Black-box: measure dac_out's average (high-bit fraction) over
    `cycles` clk_ref edges."""
    high = 0
    for _ in range(cycles):
        await RisingEdge(dut.clk_ref)
        high += int(dut.dac_out.value)
    return high / cycles * 100.0


# ===========================================================================
# Black-box scenarios: RTL and GL both. Basic sanity only.
# ===========================================================================

async def scenario_reset_defaults_to_midpoint(dut, fb):
    """Right after reset, before even one full period has had a chance to
    complete at the (coarsest, ~23.6-cycle-period) starting tap, dac_out's
    average should still read the DUTY_INIT midpoint."""
    fb.set_freq(433.92)
    await reset(dut)
    measured = await measure_dac_duty(dut, cycles=SNAPSHOT_CYCLES)
    logging.getLogger("dac_tb").info(f"reset: dac_out duty={measured:.2f}% (expected~={DUTY_INIT_PCT:.2f}%)")
    assert abs(measured - DUTY_INIT_PCT) <= (100.0 / SNAPSHOT_CYCLES) + 2.0, \
        f"dac_out did not read the DUTY_INIT midpoint right after reset: {measured:.2f}%"


async def scenario_holds_near_target_through_full_gear_up(dut, fb):
    """At the 433.92MHz target from reset, the loop should climb the full
    gear ladder and settle at the finest tap -- duty should still read
    near DUTY_INIT throughout, since every period along the way is a hold
    or a gear change, never a bang-bang correction."""
    fb.set_freq(433.92)
    await reset(dut)
    await settle(dut, HOLD_SETTLE_CYCLES)
    measured = await measure_dac_duty(dut, cycles=SNAPSHOT_CYCLES)
    logging.getLogger("dac_tb").info(f"clk_fb=433.92MHz after {HOLD_SETTLE_CYCLES} cycles: dac_out duty={measured:.2f}%")
    assert abs(measured - DUTY_INIT_PCT) <= 3.0, \
        f"duty drifted too far at target frequency: {measured:.2f}% (expected near {DUTY_INIT_PCT:.2f}%)"


async def scenario_slow_vco_raises_duty(dut, fb):
    """Sustained too-slow clk_fb should raise duty, gearing-agnostic."""
    fb.set_freq(300.0)
    await reset(dut)
    await settle(dut, HOLD_SETTLE_CYCLES)
    slow_duty = await measure_dac_duty(dut, cycles=SNAPSHOT_CYCLES)
    logging.getLogger("dac_tb").info(f"clk_fb=300MHz after {HOLD_SETTLE_CYCLES} cycles: dac_out duty={slow_duty:.2f}%")
    assert slow_duty > DUTY_INIT_PCT + 5.0, "duty did not rise for a too-slow clk_fb"


async def scenario_fast_vco_lowers_duty(dut, fb):
    """Sustained too-fast clk_fb should lower duty, gearing-agnostic."""
    fb.set_freq(600.0)
    await reset(dut)
    await settle(dut, HOLD_SETTLE_CYCLES)
    fast_duty = await measure_dac_duty(dut, cycles=SNAPSHOT_CYCLES)
    logging.getLogger("dac_tb").info(f"clk_fb=600MHz after {HOLD_SETTLE_CYCLES} cycles: dac_out duty={fast_duty:.2f}%")
    assert fast_duty < DUTY_INIT_PCT - 1.5, "duty did not fall for a too-fast clk_fb"


# ===========================================================================
# White-box scenarios: RTL only. Real verification of the gearing mechanism.
# ===========================================================================

async def scenario_gear_up_ladder_reaches_finest_tap(dut, fb):
    """At the target frequency from reset, tap_sel should climb the full
    ladder 6->7->8->...->12, exactly one step at a time (never skipping),
    with hold_low/high and break_low/high reloading to the EXACT expected
    constants at every step, settling asserted right after each
    transition. Only the LAST period at a given tap is guaranteed to land
    in that tap's hold zone (the one that triggers the gear-up); earlier
    periods there can still be phase-drifting into alignment and land in
    the break-but-not-hold band, legitimately firing a bang-bang
    correction -- so duty is not asserted frozen here."""
    logger = logging.getLogger("dac_tb")
    fb.set_freq(433.92)
    await reset(dut)

    assert int(dut.tap_sel.value) == TAP_MIN, "did not start at TAP_MIN"
    assert int(dut.duty.value) == DUTY_INIT, "duty did not reset to DUTY_INIT"

    seen = [TAP_MIN]
    for _ in range(40):  # ~2 edges/transition x 6 transitions, generous margin
        if seen[-1] == TAP_MAX:
            break
        await wait_for_fb_edge(dut)
        tap_now = int(dut.tap_sel.value)
        if tap_now == seen[-1]:
            continue  # the discarded settling edge, or a plain hold at TAP_MAX
        assert tap_now == seen[-1] + 1, \
            f"tap_sel jumped from {seen[-1]} to {tap_now}, expected a single step up"
        hold_low, hold_high, break_low, break_high = TAP_PARAMS[tap_now]
        assert int(dut.hold_low.value)   == hold_low,   f"tap {tap_now}: hold_low mismatch"
        assert int(dut.hold_high.value)  == hold_high,  f"tap {tap_now}: hold_high mismatch"
        assert int(dut.break_low.value)  == break_low,  f"tap {tap_now}: break_low mismatch"
        assert int(dut.break_high.value) == break_high, f"tap {tap_now}: break_high mismatch"
        assert int(dut.settling.value) == 1, "settling should be asserted right after a gear change"
        seen.append(tap_now)
        logger.info(f"gear up -> tap {tap_now} (hold=[{hold_low},{hold_high}) break=[{break_low},{break_high}))")

    assert seen[-1] == TAP_MAX, f"never reached TAP_MAX, stalled at tap {seen[-1]}"


async def scenario_coarsest_tap_stays_parked_and_keeps_correcting(dut, fb):
    """clk_fb well below target with the loop still at TAP_MIN: a period
    there (~34 cycles at 300MHz) falls outside tap 128's own break band
    [15,33), but there's nowhere lower to gear down to -- tap_sel must
    stay pinned at TAP_MIN while plain escalating bang-bang keeps running."""
    logger = logging.getLogger("dac_tb")
    fb.set_freq(300.0)
    await reset(dut)
    assert int(dut.tap_sel.value) == TAP_MIN

    prev_duty = int(dut.duty.value)
    rises = 0
    for i in range(15):
        await wait_for_fb_edge(dut)
        assert int(dut.tap_sel.value) == TAP_MIN, f"period {i}: tap_sel moved despite being at TAP_MIN"
        now_duty = int(dut.duty.value)
        if now_duty > prev_duty:
            rises += 1
        prev_duty = now_duty

    assert rises >= 10, f"duty should climb almost every period while parked at TAP_MIN; only rose {rises}/15 times"
    logger.info(f"tap stayed pinned at TAP_MIN across 15 periods, duty reached {prev_duty}")


async def scenario_finest_tap_corrects_without_exceeding_max(dut, fb):
    """Once at TAP_MAX, a small off-target nudge (still inside tap 12's
    break band but outside its hold zone) should still bang-bang correct
    normally, and must never push tap_sel past TAP_MAX."""
    logger = logging.getLogger("dac_tb")
    fb.set_freq(433.92)
    await reset(dut)
    await climb_to_tap_max(dut)
    assert int(dut.tap_sel.value) == TAP_MAX

    # tap 12: hold=[1509,1513), break=[1472,1544). 435.45MHz gives a period
    # of ~1505 cycles -- comfortably below hold_low, inside break.
    fb.set_freq(435.45)
    duty_before = int(dut.duty.value)
    for _ in range(6):
        await wait_for_fb_edge(dut)
        assert int(dut.tap_sel.value) == TAP_MAX, "gear-up guard failed: tap_sel exceeded TAP_MAX"
    duty_after = int(dut.duty.value)
    assert duty_after != duty_before, "duty did not correct at the finest tap for a small off-target nudge"
    logger.info(f"tap_sel held at TAP_MAX, duty moved {duty_before} -> {duty_after}")


async def scenario_gear_down_cascade_on_large_excursion(dut, fb):
    """After locking at TAP_MAX, an abrupt large frequency jump must gear
    DOWN (cascading back toward TAP_MIN as needed), not just sit there
    unable to react."""
    logger = logging.getLogger("dac_tb")
    fb.set_freq(433.92)
    await reset(dut)
    await climb_to_tap_max(dut)
    assert int(dut.tap_sel.value) == TAP_MAX

    fb.set_freq(300.0)  # outside every tap's break band until back near TAP_MIN

    seen_min = False
    tap_trace = [TAP_MAX]
    for _ in range(80):
        await wait_for_fb_edge(dut)
        tap_now = int(dut.tap_sel.value)
        if tap_now != tap_trace[-1]:
            tap_trace.append(tap_now)
        if tap_now == TAP_MIN:
            seen_min = True
            break

    assert seen_min, f"never cascaded back down to TAP_MIN, stuck at tap {int(dut.tap_sel.value)} (trace: {tap_trace})"
    logger.info(f"cascaded back down to TAP_MIN after a large excursion from lock (trace: {tap_trace})")


async def scenario_streak_escalation_matches_1_1_2_3_4(dut, fb):
    """Once locked into a sustained same-direction run of corrections, the
    per-period duty bump should escalate by exactly the RTL's own streak
    register each time -- not just "duty goes up eventually".

    streak resets to 1 on rst_ni deassertion (dac.sv:253), not 0, and
    also reads 1 right after any single "new streak" edge -- so it can't
    be used alone to detect a clean run start; it's 1 in both the boring
    post-reset case and the interesting one. At TAP_MIN, stage_q[6] also
    needs on the order of 2^6 clk_fb periods to produce its first
    transition after reset, and since clk_fb free-runs continuously
    across scenarios (never resyncs), that first real period can
    legitimately read in the wrong bang-bang direction for one step.
    Waiting for streak>=2 instead filters that out: streak only grows
    past 1 after two GENUINE consecutive same-direction corrections, so a
    lone transient reading can't produce it."""
    logger = logging.getLogger("dac_tb")
    fb.set_freq(300.0)
    await reset(dut)

    for _ in range(30):
        await wait_for_fb_edge(dut)
        if int(dut.streak.value) >= 2:
            break
    else:
        raise AssertionError("streak never reached 2 within 30 periods")

    duty_prev = int(dut.duty.value)
    for i in range(6):
        expected_mag = int(dut.streak.value) << STEP_SHIFT  # TAP_MIN, not TAP_MAX -- steps are scaled
        await wait_for_fb_edge(dut)
        duty_now = int(dut.duty.value)
        bump = duty_now - duty_prev
        assert abs(bump) == expected_mag, f"period {i}: |bump|={abs(bump)}, expected {expected_mag} (streak-driven)"
        logger.info(f"period {i}: duty {duty_prev} -> {duty_now} ({bump:+d})")
        duty_prev = duty_now


async def scenario_vctrl_feedthrough_buffers_correctly(dut, fb):
    """vctrl_in/vctrl_b_in -> vctrl_out/vctrl_b_out is a plain buffered
    feedthrough, independent of the gearing FSM -- verify every
    combination tracks."""
    for a, b in [(0, 0), (1, 0), (0, 1), (1, 1)]:
        dut.vctrl_in.value = a
        dut.vctrl_b_in.value = b
        await RisingEdge(dut.clk_ref)
        assert int(dut.vctrl_out.value) == a, f"vctrl_out={int(dut.vctrl_out.value)}, expected {a}"
        assert int(dut.vctrl_b_out.value) == b, f"vctrl_b_out={int(dut.vctrl_b_out.value)}, expected {b}"


BLACK_BOX_SCENARIOS = [
    scenario_reset_defaults_to_midpoint,
    scenario_holds_near_target_through_full_gear_up,
    scenario_slow_vco_raises_duty,
    scenario_fast_vco_lowers_duty,
    scenario_vctrl_feedthrough_buffers_correctly,
]

WHITE_BOX_SCENARIOS = [
    scenario_gear_up_ladder_reaches_finest_tap,
    scenario_coarsest_tap_stays_parked_and_keeps_correcting,
    scenario_finest_tap_corrects_without_exceeding_max,
    scenario_gear_down_cascade_on_large_excursion,
    scenario_streak_escalation_matches_1_1_2_3_4,
]


@cocotb.test()
async def test_dac(dut):
    logger = logging.getLogger("dac_tb")
    logger.setLevel(logging.INFO)

    cocotb.start_soon(Clock(dut.clk_ref, CLK_REF_PERIOD_NS, "ns").start())
    fb = FbClockDriver(dut, 433.92)
    cocotb.start_soon(fb._run())

    scenarios = list(BLACK_BOX_SCENARIOS)
    if not gl:
        scenarios += WHITE_BOX_SCENARIOS

    results = []
    for scenario in scenarios:
        name = scenario.__name__
        logger.info(f"--- running {name} ---")
        try:
            await scenario(dut, fb)
        except AssertionError as e:
            results.append((name, False, str(e)))
            logger.error(f"{name}: FAILED: {e}")
        else:
            results.append((name, True, ""))
            logger.info(f"{name}: PASSED")

    logger.info("=" * 70)
    for name, passed, msg in results:
        logger.info(f"{'PASS' if passed else 'FAIL'}  {name}" + (f"  ({msg})" if msg else ""))
    logger.info("=" * 70)

    failed = [name for name, passed, _ in results if not passed]
    assert not failed, f"{len(failed)}/{len(results)} scenarios failed: {', '.join(failed)}"


def dac_runner():

    proj_path = Path(__file__).resolve().parent

    sources  = []
    defines  = {}
    includes = [proj_path / "../../rtl/"]

    if gl:
        sources.append(Path(pdk_root) / pdk / "libs.ref" / scl / "verilog" / f"{scl}.v")
        sources.append(Path(pdk_root) / pdk / "libs.ref" / scl / "verilog" / "sg13cmos5l_udp.v")
        sources.append(proj_path / f"../../final/nl/{hdl_toplevel}.nl.v")
    else:
        sources.append(proj_path / "../../rtl/dac.sv")

    build_args = []

    if sim == "icarus":
        build_args = ["-DSIM", "-gno-specify"]

    if sim == "verilator":
        build_args = ["--timing", "--trace", "--trace-fst", "--trace-structs"]

    runner = get_runner(sim)
    runner.build(
        sources=sources,
        hdl_toplevel=hdl_toplevel,
        defines=defines,
        always=True,
        includes=includes,
        build_args=build_args,
        waves=True,
        # 1fs precision, not 1ps -- see clk_fb_period_ns()'s docstring.
        # Icarus re-rounds any period to its own declared precision
        # regardless of what precision the Python side computed to, so
        # this has to match clk_fb_period_ns()'s fs-level rounding or the
        # same problem just reappears one level down.
        timescale=("1ns", "1fs")
    )

    plusargs = []

    runner.test(
        hdl_toplevel=hdl_toplevel,
        test_module="dac_tb",
        plusargs=plusargs,
        waves=True,
    )


if __name__ == "__main__":
    dac_runner()
