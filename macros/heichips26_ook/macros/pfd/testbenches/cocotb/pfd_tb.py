# SPDX-FileCopyrightText: 2026 The HeiChips Contributors
# SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1

import os
import logging
from pathlib import Path

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, ClockCycles
from cocotb.utils import get_sim_time
from cocotb_tools.runner import get_runner

sim      = os.getenv("SIM", "icarus")
pdk_root = os.getenv("PDK_ROOT", Path("~/.ciel").expanduser())
pdk      = os.getenv("PDK", "ihp-sg13cmos5l")
scl      = os.getenv("SCL", "sg13cmos5l_stdcell")
# GL=1 selects the gate-level netlist; anything else (unset, "0", "") stays in RTL mode.
gl       = os.getenv("GL", "0").strip().lower() in ("1", "true", "yes", "on")

hdl_toplevel = "pfd"

# clk_ref: raw 80MHz reference input
CLK_REF_PERIOD_NS = 12.5
# clk_fb: raw feedback/VCO input, nominally 433.92MHz
# Rounded to an even number of 1ps simulator steps; Clock() requires the
# period to split evenly into a high/low half at the simulator's precision.
_CLK_FB_HALF_PS   = round(1000.0 / 433.92 * 1000.0 / 2.0)
CLK_FB_PERIOD_NS  = 2 * _CLK_FB_HALF_PS / 1000.0

# Expected comparison frequency out of both dividers:
#   80MHz     / 125 = 640kHz
#   433.92MHz / 678 = 640kHz
EXPECTED_DIV_PERIOD_NS = 1.0e6 / 640.0

REF_TOL_PCT = 0.01
FB_TOL_PCT  = 0.05


async def start_clock(clock, period_ns):
    """Start a free-running clock with the given period."""
    c = Clock(clock, period_ns, "ns")
    cocotb.start_soon(c.start())


async def reset(dut, cycles=4):
    """Pulse the active-low reset for `cycles` clk_ref cycles."""
    cocotb.log.info("Reset asserted...")

    dut.rst_ni.value = 0
    await ClockCycles(dut.clk_ref, cycles)
    dut.rst_ni.value = 1
    await RisingEdge(dut.clk_ref)

    cocotb.log.info("Reset deasserted.")


async def start_up(dut):
    """Startup sequence: both clocks running, then release reset."""
    await start_clock(dut.clk_ref, CLK_REF_PERIOD_NS)
    await start_clock(dut.clk_fb, CLK_FB_PERIOD_NS)
    await reset(dut)


async def measure_period(signal):
    """Measure the period between two consecutive rising edges of `signal`."""
    await RisingEdge(signal)
    t0 = get_sim_time(units="ns")
    await RisingEdge(signal)
    t1 = get_sim_time(units="ns")
    return t1 - t0


def assert_period(name, got, exp, tol_pct):
    lo = exp * (1.0 - tol_pct / 100.0)
    hi = exp * (1.0 + tol_pct / 100.0)
    assert lo <= got <= hi, \
        f"{name}: period={got:.4f}ns expected={exp:.4f}ns (+/-{tol_pct}%)"


@cocotb.test()
async def test_pfd(dut):
    """Mirrors testbenches/verilog/pfd_tb.sv: measure both divider periods,
    then check up/dn once both have pulsed and settled.

    up_q/dn_q have no rst_ni-driven reset (only the internal self-clearing
    NAND feedback clears them), so they read X until each divided clock's
    first real edge. That first edge always comes from the divider
    measurements below, so up/dn must only be checked afterward.
    """
    logger = logging.getLogger("pfd_tb")

    logger.info("Startup sequence...")
    await start_up(dut)

    ref_period = await measure_period(dut.clk_ref_div)
    assert_period("clk_ref_div (80MHz/125)", ref_period, EXPECTED_DIV_PERIOD_NS, REF_TOL_PCT)
    logger.info(f"clk_ref_div period={ref_period:.4f}ns")

    fb_period = await measure_period(dut.clk_fb_div)
    assert_period("clk_fb_div (433.92MHz/678)", fb_period, EXPECTED_DIV_PERIOD_NS, FB_TOL_PCT)
    logger.info(f"clk_fb_div period={fb_period:.4f}ns")

    await ClockCycles(dut.clk_ref, 20)

    logger.info(f"up={int(dut.up.value)} dn={int(dut.dn.value)}")
    assert int(dut.up.value) == 0, "up unexpectedly held high"
    assert int(dut.dn.value) == 0, "dn unexpectedly held high"

    logger.info("Done!")


def pfd_runner():

    proj_path = Path(__file__).resolve().parent

    sources  = []
    defines  = {}
    includes = [proj_path / "../../rtl/"]

    if gl:
        # SCL models
        sources.append(Path(pdk_root) / pdk / "libs.ref" / scl / "verilog" / f"{scl}.v")
        sources.append(Path(pdk_root) / pdk / "libs.ref" / scl / "verilog" / "sg13cmos5l_udp.v")

        # Unpowered gate-level netlist of the macro
        sources.append(proj_path / f"../../final/nl/{hdl_toplevel}.nl.v")

        # Unpowered netlist: USE_POWER_PINS must NOT be defined at all
        # (passing USE_POWER_PINS=False would still define the macro).
    else:
        sources.append(proj_path / "../../rtl/pfd.sv")

    build_args = []

    if sim == "icarus":
        # -gno-specify: skip specify blocks; sg13cmos5l_stdcell.v uses
        # `ifnone with edge-sensitive paths`, which iverilog can't parse.
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
        timescale=("1ns", "1ps")
    )

    plusargs = []

    runner.test(
        hdl_toplevel=hdl_toplevel,
        test_module="pfd_tb",
        plusargs=plusargs,
        waves=True,
    )


if __name__ == "__main__":
    pfd_runner()
