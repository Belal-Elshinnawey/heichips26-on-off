# -*- coding: utf-8 -*-
# SPDX-FileCopyrightText: 2026 The HeiChips Contributors
# SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1

import sys
import numpy as np
from ngspice2python import loadngspicecol


def count_edges(time, signal, threshold):
    above = signal >= threshold
    crossings = np.flatnonzero((~above[:-1]) & above[1:]) + 1
    return time[crossings]


def main():
    datafile = sys.argv[1]
    target_hz = float(sys.argv[2])
    tolerance_pct = float(sys.argv[3]) if len(sys.argv) > 3 else 1.0

    time = loadngspicecol(datafile, 'time')
    clk_out = loadngspicecol(datafile, 'clk_out')

    threshold = (clk_out.max() + clk_out.min()) / 2
    edges = count_edges(time, clk_out, threshold)

    if len(edges) < 2:
        print(f'FAIL: only {len(edges)} pulse(s) found, need at least 2')
        sys.exit(1)

    periods = np.diff(edges)
    avg_period = periods.mean()
    measured_hz = 1.0 / avg_period
    jitter = periods.std()
    error_pct = abs(measured_hz - target_hz) / target_hz * 100

    print(f'pulses counted: {len(edges)}')
    print(f'measured frequency: {measured_hz:.3f} Hz')
    print(f'target frequency: {target_hz:.3f} Hz')
    print(f'error: {error_pct:.4f}%')
    print(f'period jitter (std dev): {jitter:.3e} s')

    if error_pct <= tolerance_pct:
        print('PASS')
        sys.exit(0)
    else:
        print('FAIL')
        sys.exit(1)


if __name__ == '__main__':
    main()
