# -*- coding: utf-8 -*-
# SPDX-FileCopyrightText: 2026 The HeiChips Contributors
# SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1

import sys
import numpy as np
import matplotlib.pyplot as plt


def hysteresis_rising_crossings(time, signal, low_thresh, high_thresh):
    # candidate rising crossings: below high_thresh -> at/above high_thresh
    above_hi = signal >= high_thresh
    rise_idx = np.flatnonzero((~above_hi[:-1]) & above_hi[1:])
    # candidate falling crossings: above low_thresh -> at/below low_thresh
    below_lo = signal <= low_thresh
    fall_idx = np.flatnonzero((~below_lo[:-1]) & below_lo[1:])

    events = sorted([(i, 'r') for i in rise_idx] + [(i, 'f') for i in fall_idx])

    edges = []
    armed = True   # ready to accept the next rising edge
    for i, kind in events:
        if kind == 'r' and armed:
            t0, t1 = time[i], time[i + 1]
            s0, s1 = signal[i], signal[i + 1]
            frac = (high_thresh - s0) / (s1 - s0)
            edges.append(t0 + frac * (t1 - t0))
            armed = False
        elif kind == 'f' and not armed:
            armed = True
    return np.array(edges)


def main():
    datafile = sys.argv[1] if len(sys.argv) > 1 else '../simulations/vosc_freq_input.txt'
    outfile = sys.argv[2] if len(sys.argv) > 2 else 'figures/vosc_freq_vs_time.png'
    skip_frac = float(sys.argv[3]) if len(sys.argv) > 3 else 0.1   # fraction of total duration to skip (startup transient)

    data = np.loadtxt(datafile, skiprows=1)
    time, sig = data[:, 0], data[:, 1]

    t_skip = time[0] + skip_frac * (time[-1] - time[0])
    mask = time >= t_skip
    time, sig = time[mask], sig[mask]

    # true min/max within the post-skip window -- percentiles were tried here but
    # break for a low duty-cycle pulse train (a signal high <1% of the time never
    # reaches the 99th percentile, so high_thresh never lands near the real pulse
    # height). The startup-spike skew this was meant to avoid is already handled
    # by the time-skip above instead.
    lo_ref, hi_ref = sig.min(), sig.max()
    span = hi_ref - lo_ref
    high_thresh = lo_ref + 0.6 * span
    low_thresh = lo_ref + 0.4 * span

    edges = hysteresis_rising_crossings(time, sig, low_thresh, high_thresh)

    if len(edges) < 2:
        print(f'only {len(edges)} rising edge(s) found, need at least 2')
        sys.exit(1)

    periods = np.diff(edges)
    freq = 1.0 / periods
    t_mid = edges[1:]

    print(f'thresholds: low={low_thresh:.4f} V, high={high_thresh:.4f} V (from {t_skip*1e6:.3f}us onward)')
    print(f'edges found: {len(edges)}')
    print(f'freq range: {freq.min()/1e6:.3f} MHz - {freq.max()/1e6:.3f} MHz')
    print(f'freq at start: {freq[0]/1e6:.3f} MHz, freq at end: {freq[-1]/1e6:.3f} MHz')

    plt.figure(figsize=(10, 5))
    plt.plot(t_mid * 1e6, freq / 1e6)
    plt.xlabel('time (us)')
    plt.ylabel('instantaneous frequency (MHz)')
    plt.title('frequency vs time')
    plt.grid(True)
    plt.tight_layout()
    plt.savefig(outfile, dpi=150)
    print(f'saved plot to {outfile}')
    plt.show()


if __name__ == '__main__':
    main()
