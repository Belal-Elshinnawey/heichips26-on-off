#!/usr/bin/env python3
"""Overlay all sweep_c4_<step>.txt files produced by amp_tb_tran.sch's C4 sweep
onto a single frequency-response plot."""
import argparse
import glob
import os
import re

import matplotlib.pyplot as plt


def load_sweep(path):
    freqs, vals = [], []
    with open(path) as f:
        for line in f:
            parts = line.split()
            if len(parts) < 2:
                continue
            try:
                freqs.append(float(parts[0]))
                vals.append(float(parts[1]))
            except ValueError:
                continue
    return freqs, vals


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("directory", nargs="?", default=".",
                     help="Directory containing sweep_c4_*.txt files "
                          "(default: current directory)")
    args = ap.parse_args()

    pattern = os.path.join(args.directory, "sweep_c4_*")
    files = [f for f in glob.glob(pattern) if re.search(r"sweep_c4_\d+$", f)]
    if not files:
        print(f"No files matching {pattern}")
        return

    def step_of(path):
        m = re.search(r"sweep_c4_(\d+)$", path)
        return int(m.group(1)) if m else -1

    files.sort(key=step_of)

    fig, ax = plt.subplots()
    cmap = plt.get_cmap("viridis")
    n = len(files)
    for i, path in enumerate(files):
        freqs, vals = load_sweep(path)
        if not freqs:
            continue
        step = step_of(path)
        c4_ff = 100 + step  # 100fF start, 1fF per step
        ax.plot(freqs, vals, color=cmap(i / max(n - 1, 1)),
                 label=f"{c4_ff}fF" if n <= 15 else None)

    ax.set_xlabel("Frequency (Hz)")
    ax.set_ylabel("vdb(vout)")
    ax.set_xscale("log")
    ax.set_title(f"Amp frequency response vs C4 ({n} sweep steps)")
    if n <= 15:
        ax.legend(fontsize="small")
    else:
        sm = plt.cm.ScalarMappable(cmap=cmap,
                                    norm=plt.Normalize(vmin=100, vmax=100 + n - 1))
        fig.colorbar(sm, ax=ax, label="C4 (fF)")
    ax.grid(True, which="both", alpha=0.3)
    plt.tight_layout()
    plt.show()


if __name__ == "__main__":
    main()
