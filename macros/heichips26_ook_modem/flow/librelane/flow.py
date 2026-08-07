# SPDX-FileCopyrightText: © 2026 HeiChips26 OOK Modem Authors
# SPDX-License-Identifier: Apache-2.0

import csv
import glob
import os
import subprocess
from typing import Tuple

from librelane.steps import Step
from librelane.steps.step import ViewsUpdate, MetricsUpdate
from librelane.flows import Flow
from librelane.flows.classic import Classic
from librelane.state.state import State
from librelane.logging import info

try:
    from librelane.steps.step import StepError
except ImportError:  # APIバージョン差の保険
    class StepError(Exception):
        pass



@Step.factory.register()
class RegressionGate(Step):
    """
    iverilogでTBを並列で回して、問題がなければ先に進む。
    """

    id = "HeiChips.RegressionGate"
    name = "RTL Regression Gate"

    inputs = []
    outputs = []

    def run(self, state_in: State, **kwargs) -> Tuple[ViewsUpdate, MetricsUpdate]:
        # DESIGN_DIR = flow/librelane
        macro = os.path.abspath(os.path.join(self.config["DESIGN_DIR"], "..", ".."))
        rtl = os.path.join(macro, "rtl")
        tb = os.path.join(macro, "testbenches", "verilog")

        rx_chain = [f"{rtl}/rx_sync.sv", f"{rtl}/rx_sampler.sv", f"{rtl}/rx_deframer.sv"]
        all_rtl = sorted(glob.glob(f"{rtl}/*.sv"))

        # (名前, RTLソース一覧)
        suites = [
            ("tx_framer", [f"{rtl}/tx_framer.sv"]),
            ("ook_gate", [f"{rtl}/ook_gate.sv"]),
            ("rx_sampler", [f"{rtl}/rx_sampler.sv"]),
            ("rx_chain", rx_chain),
            ("heichips26_ook_modem", all_rtl),
        ]

        passed = 0
        for name, srcs in suites:
            out = os.path.join(self.step_dir, f"sim_{name}")
            log = os.path.join(self.step_dir, f"{name}.log")
            cmd = ["iverilog", "-g2012", "-DSIM", "-o", out] + srcs + [f"{tb}/{name}_tb.sv"]
            with open(log, "w") as f:
                r = subprocess.run(cmd, stdout=f, stderr=subprocess.STDOUT)
                if r.returncode == 0:
                    r = subprocess.run(["vvp", out], stdout=f, stderr=subprocess.STDOUT,
                                       cwd=self.step_dir)
            if r.returncode != 0:
                raise StepError(
                    f"Testbench '{name}' failed — see {log}. "
                    "Fix the RTL before spending flow time."
                )
            passed += 1
            info(f"[RegressionGate] {name}_tb: PASS")

        info(f"[RegressionGate] All {passed} testbenches passed. Proceeding to synthesis.")
        return {}, {"heichips__regression__testbenches_passed": passed}


# 実行時間監視
@Step.factory.register()
class RuntimeReport(Step):
    """
    Aggregates every step's runtime.txt into runs/<RUN>/runtimes.csv
    and logs the top consumers (prototype of librelane#812).
    """

    id = "HeiChips.RuntimeReport"
    name = "Runtime Report"

    inputs = []
    outputs = []

    def run(self, state_in: State, **kwargs) -> Tuple[ViewsUpdate, MetricsUpdate]:
        run_dir = os.path.dirname(os.path.abspath(self.step_dir))
        rows = []
        for rt in sorted(glob.glob(os.path.join(run_dir, "*", "runtime.txt"))):
            h, m, s = open(rt).read().strip().split(":")
            secs = int(h) * 3600 + int(m) * 60 + float(s)
            rows.append((os.path.basename(os.path.dirname(rt)), secs))

        total = sum(s for _, s in rows)
        csv_path = os.path.join(run_dir, "runtimes.csv")
        with open(csv_path, "w", newline="") as f:
            w = csv.writer(f)
            w.writerow(["step_dir", "elapsed_seconds"])
            for n, s in rows:
                w.writerow([n, f"{s:.3f}"])
            w.writerow(["TOTAL", f"{total:.3f}"])

        info(f"[RuntimeReport] {len(rows)} steps, total {total:.1f}s -> {csv_path}")
        for n, s in sorted(rows, key=lambda x: -x[1])[:5]:
            info(f"[RuntimeReport]   {s:7.1f}s {100 * s / total:5.1f}%  {n}")
        return {}, {"heichips__flow__total_runtime_seconds": round(total, 3)}


# --- カスタムフロー: Classicの前後に自作ステップを挿入---
@Flow.factory.register()
class HeiChipsFlow(Classic):
    """
    Classic flow guarded by an RTL regression gate and finished
    with a runtime report.
    """

    Steps = [RegressionGate] + Classic.Steps + [RuntimeReport]


def main():
    here = os.path.dirname(os.path.abspath(__file__))
    pdk = os.environ.get("PDK", "ihp-sg13cmos5l")
    pdk_root = os.environ.get(
        "PDK_ROOT",
        os.path.abspath(os.path.join(here, "..", "..", "..", "..", "IHP-Open-PDK")),
    )

    flow = HeiChipsFlow(
        os.path.join(here, "config.yaml"),
        design_dir=here,
        pdk_root=pdk_root,
        pdk=pdk,
    )
    flow.start()


if __name__ == "__main__":
    main()
