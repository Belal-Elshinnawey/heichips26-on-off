# -*- coding: utf-8 -*-
# SPDX-FileCopyrightText: 2026 The HeiChips Contributors
# SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1

import sys
import numpy as np
import matplotlib.pyplot as plt


def load_window(datafile, t_start, t_end):
    data = np.loadtxt(datafile, skiprows=1)
    time, sig = data[:, 0], data[:, 1]
    mask = (time >= t_start) & (time <= t_end)
    return time[mask], sig[mask]


def main():
    if len(sys.argv) < 3:
        print('usage: plot_waveforms.py file1 file2 [t_start] [t_end] [outfile]')
        sys.exit(1)

    file1, file2 = sys.argv[1], sys.argv[2]
    t_start = float(sys.argv[3]) if len(sys.argv) > 3 else 0.0
    t_end = float(sys.argv[4]) if len(sys.argv) > 4 else 1e-6
    outfile = sys.argv[5] if len(sys.argv) > 5 else 'figures/waveforms.png'

    t1, s1 = load_window(file1, t_start, t_end)
    t2, s2 = load_window(file2, t_start, t_end)

    fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(12, 6), sharex=True)

    ax1.plot(t1 * 1e9, s1, marker='.', markersize=2, linewidth=0.8)
    ax1.set_ylabel(f'{file1.split("/")[-1]} (V)')
    ax1.grid(True)

    ax2.plot(t2 * 1e9, s2, marker='.', markersize=2, linewidth=0.8, color='tab:orange')
    ax2.set_ylabel(f'{file2.split("/")[-1]} (V)')
    ax2.set_xlabel('time (ns)')
    ax2.grid(True)

    plt.tight_layout()
    plt.savefig(outfile, dpi=150)
    print(f'saved plot to {outfile}')
    print(f'file1: {len(t1)} points in window, file2: {len(t2)} points in window')
    plt.show()


if __name__ == '__main__':
    main()
