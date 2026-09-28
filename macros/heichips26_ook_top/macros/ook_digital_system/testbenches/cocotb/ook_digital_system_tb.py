# SPDX-FileCopyrightText: 2026 The HeiChips Contributors
# SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1

import os
import logging
from pathlib import Path

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles, Timer
from cocotb_tools.runner import get_runner

sim      = os.getenv("SIM", "icarus")
pdk_root = os.getenv("PDK_ROOT", Path("~/.ciel").expanduser())
pdk      = os.getenv("PDK", "ihp-sg13cmos5l")
scl      = os.getenv("SCL", "sg13cmos5l_stdcell")
gl       = os.getenv("GL", "0").strip().lower() in ("1", "true", "yes", "on")

hdl_toplevel = "ook_digital_system"

# Must be kept in sync with rtl/ook_digital_system.sv's DEADTIME_CYCLES
# localparam. All scenarios here only touch top-level ports (never internal
# dut.* state), so they run identically in RTL and GL mode.
CLK_PERIOD_NS = 12.5  # matches flow/librelane/config.yaml's CLOCK_PERIOD
DEADTIME_CYCLES = 10


async def reset(dut, cycles=4):
    dut.rst_n_in.value = 0
    dut.data_in_tx.value = 0
    dut.q0.value = 0
    dut.q1.value = 0
    dut.q2.value = 0
    dut.q3.value = 0
    dut.in_tieoff.value = 0
    dut.in_tieon.value = 1
    await ClockCycles(dut.clk, cycles)
    dut.rst_n_in.value = 1
    await RisingEdge(dut.clk)


# ===========================================================================
# Scenarios
# ===========================================================================

async def scenario_east_side_responsive(dut):
    """clk_ref and rst are plain buffered feedthroughs of clk/rst_n_in (the
    rtl_buf_clk/rtl_buf_rst standard-cell instances) -- both must track
    combinationally, not on some clock-driven delay."""
    logger = logging.getLogger("ook_digital_system_tb")

    for _ in range(8):
        await RisingEdge(dut.clk)
        await Timer(1, units="ns")
        assert int(dut.clk_ref.value) == int(dut.clk.value), \
            f"clk_ref={int(dut.clk_ref.value)} did not track clk={int(dut.clk.value)} after rising edge"
        await FallingEdge(dut.clk)
        await Timer(1, units="ns")
        assert int(dut.clk_ref.value) == int(dut.clk.value), \
            f"clk_ref={int(dut.clk_ref.value)} did not track clk={int(dut.clk.value)} after falling edge"
    logger.info("clk_ref tracked clk across 8 rising/falling edges")

    for level in (0, 1, 0, 1):
        dut.rst_n_in.value = level
        await Timer(1, units="ns")
        assert int(dut.rst.value) == level, \
            f"rst={int(dut.rst.value)} did not track rst_n_in={level}"
    dut.rst_n_in.value = 1
    await Timer(1, units="ns")
    logger.info("rst tracked rst_n_in across 4 level changes")


async def scenario_q_d_two_cycle_latency(dut):
    """q0_d..q3_d must equal q0..q3 exactly two clk cycles later (the
    double-FF synchronizer into the west clock domain)."""
    logger = logging.getLogger("ook_digital_system_tb")

    pattern = [
        (0, 0, 0, 0),
        (1, 0, 0, 0),
        (0, 1, 0, 0),
        (1, 1, 0, 1),
        (0, 0, 1, 1),
        (1, 1, 1, 1),
        (0, 0, 0, 0),
        (1, 0, 1, 0),
    ]
    history = []

    for i, (q3, q2, q1, q0) in enumerate(pattern):
        dut.q3.value = q3
        dut.q2.value = q2
        dut.q1.value = q1
        dut.q0.value = q0
        history.append((q3, q2, q1, q0))

        await RisingEdge(dut.clk)
        await Timer(1, units="ns")

        if i >= 1:
            expected = history[i - 1]
            got = (int(dut.q3_d.value), int(dut.q2_d.value), int(dut.q1_d.value), int(dut.q0_d.value))
            assert got == expected, \
                f"cycle {i}: q*_d={got}, expected {expected} (q* from 2 cycles ago)"
            logger.info(f"cycle {i}: q*_d={got} matches q* from 2 cycles ago {expected}")


async def scenario_vctrl_deadtime_on_toggle(dut):
    """vctrl/vctrl_n must never be simultaneously asserted. Every data_in_tx
    transition must produce a >=DEADTIME_CYCLES-cycle window where both read
    0 (the dead-time safe state) before the new complementary state
    appears, and the two must be true complements everywhere else."""
    logger = logging.getLogger("ook_digital_system_tb")

    async def drive_and_trace(target_bit, max_cycles=64):
        dut.data_in_tx.value = target_bit
        trace = []
        for _ in range(max_cycles):
            await RisingEdge(dut.clk)
            await Timer(1, units="ns")
            v, vn = int(dut.vctrl.value), int(dut.vctrl_n.value)
            trace.append((v, vn))
            assert not (v == 1 and vn == 1), "vctrl and vctrl_n asserted simultaneously"
            if (v, vn) == (target_bit, 1 - target_bit):
                return trace
        raise AssertionError(f"vctrl/vctrl_n never settled to target={target_bit} within {max_cycles} cycles")

    def check_trace(trace):
        both_zero_run = 0
        max_both_zero_run = 0
        for v, vn in trace:
            if v == 0 and vn == 0:
                both_zero_run += 1
                max_both_zero_run = max(max_both_zero_run, both_zero_run)
            else:
                both_zero_run = 0
                assert v != vn, f"vctrl/vctrl_n not complementary outside dead time: ({v},{vn})"
        assert max_both_zero_run >= DEADTIME_CYCLES, \
            f"dead-time window too short: saw {max_both_zero_run} cycles of (0,0), expected >= {DEADTIME_CYCLES}"
        logger.info(f"dead-time window: {max_both_zero_run} cycles (expected >= {DEADTIME_CYCLES})")

    # post-reset: committed_state=0 -> (vctrl,vctrl_n)=(0,1) already.
    check_trace(await drive_and_trace(1))
    check_trace(await drive_and_trace(0))
    check_trace(await drive_and_trace(1))


SCENARIOS = [
    scenario_east_side_responsive,
    scenario_q_d_two_cycle_latency,
    scenario_vctrl_deadtime_on_toggle,
]


@cocotb.test()
async def test_ook_digital_system(dut):
    logger = logging.getLogger("ook_digital_system_tb")
    logger.setLevel(logging.INFO)

    cocotb.start_soon(Clock(dut.clk, CLK_PERIOD_NS, "ns").start())
    await reset(dut)

    results = []
    for scenario in SCENARIOS:
        name = scenario.__name__
        logger.info(f"--- running {name} ---")
        try:
            await scenario(dut)
        except AssertionError as e:
            results.append((name, False, str(e)))
            logger.error(f"{name}: FAILED: {e}")
        else:
            results.append((name, True, ""))
            logger.info(f"{name}: PASSED")
        await reset(dut)

    logger.info("=" * 70)
    for name, passed, msg in results:
        logger.info(f"{'PASS' if passed else 'FAIL'}  {name}" + (f"  ({msg})" if msg else ""))
    logger.info("=" * 70)

    failed = [name for name, passed, _ in results if not passed]
    assert not failed, f"{len(failed)}/{len(results)} scenarios failed: {', '.join(failed)}"


def ook_digital_system_runner():

    proj_path = Path(__file__).resolve().parent

    sources  = []
    defines  = {}
    includes = [proj_path / "../../rtl/"]

    if gl:
        sources.append(Path(pdk_root) / pdk / "libs.ref" / scl / "verilog" / f"{scl}.v")
        sources.append(Path(pdk_root) / pdk / "libs.ref" / scl / "verilog" / "sg13cmos5l_udp.v")
        sources.append(proj_path / f"../../final/nl/{hdl_toplevel}.nl.v")
    else:
        sources.append(proj_path / "../../rtl/ook_digital_system.sv")

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
    )

    plusargs = []

    runner.test(
        hdl_toplevel=hdl_toplevel,
        test_module="ook_digital_system_tb",
        plusargs=plusargs,
        waves=True,
    )


if __name__ == "__main__":
    ook_digital_system_runner()
