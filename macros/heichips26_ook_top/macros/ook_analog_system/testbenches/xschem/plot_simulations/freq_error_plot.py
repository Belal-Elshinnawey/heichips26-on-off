import os
import struct
import sys

import numpy as np
import matplotlib
SHOW = "--show" in sys.argv
if not SHOW:
    matplotlib.use("Agg")
import matplotlib.pyplot as plt

RAW = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "simulations", "charge_pump_tb_tran.raw")
TARGET_HZ = 433.92e6
SIGNAL = "v(vout)"
OUT_PNG = os.path.join(os.path.dirname(os.path.abspath(__file__)), "freq_error_vout.png")


def read_raw(path):
    with open(path, "rb") as f:
        nvars = None
        npoints = None
        varnames = []
        while True:
            line = f.readline().decode("latin1")
            if not line:
                raise EOFError("hit EOF before Binary: marker")
            text = line.strip()
            if text.startswith("No. Variables:"):
                nvars = int(text.split(":")[1].strip())
            elif text.startswith("No. Points:"):
                npoints = int(text.split(":")[1].strip())
            elif text == "Variables:":
                for _ in range(nvars):
                    parts = f.readline().decode("latin1").split()
                    varnames.append(parts[1])
            elif text == "Binary:":
                break
        data = np.fromfile(f, dtype="<f8", count=nvars * npoints)
    data = data.reshape(npoints, nvars)
    return varnames, data


def main():
    varnames, data = read_raw(RAW)
    print("variables:", varnames)
    print("points:", data.shape[0])

    t_idx = varnames.index("time")
    v_idx = varnames.index(SIGNAL)
    t = data[:, t_idx]
    v = data[:, v_idx]

    vmin, vmax = v.min(), v.max()
    mid = (vmin + vmax) / 2.0
    print(f"{SIGNAL} range: {vmin:.4f} .. {vmax:.4f}, mid={mid:.4f}")

    above = v > mid
    rising = np.where((~above[:-1]) & above[1:])[0] + 1

    v0 = v[rising - 1]
    v1 = v[rising]
    t0 = t[rising - 1]
    t1 = t[rising]
    frac = (mid - v0) / (v1 - v0)
    t_cross = t0 + frac * (t1 - t0)

    # drop crossings closer together than half the nominal target period --
    # noise/ringing near the threshold can otherwise register as extra
    # spurious edges
    nominal_period = 1.0 / TARGET_HZ
    keep = np.ones(len(t_cross), dtype=bool)
    last_t = -np.inf
    for i in range(len(t_cross)):
        if t_cross[i] - last_t < 0.5 * nominal_period:
            keep[i] = False
        else:
            last_t = t_cross[i]
    t_cross = t_cross[keep]

    periods = np.diff(t_cross)
    freqs = 1.0 / periods
    t_mid = t_cross[1:]

    err_mhz = (freqs - TARGET_HZ) / 1e6

    print(f"edges detected: {len(t_cross)}")
    print(f"freq range: {freqs.min()/1e6:.3f} .. {freqs.max()/1e6:.3f} MHz")
    print(f"error range: {err_mhz.min():.4f} .. {err_mhz.max():.4f} MHz")

    fig, ax = plt.subplots(figsize=(12, 5))
    ax.plot(t_mid * 1e6, err_mhz, lw=0.8)
    ax.axhline(0.0, color="k", lw=0.6, ls="--")
    ax.set_xlabel("time (us)")
    ax.set_ylabel("frequency error, vout vs 433.92MHz (MHz)")
    ax.set_title(f"{SIGNAL} frequency error vs {TARGET_HZ/1e6:.2f}MHz target")
    ax.grid(True, alpha=0.3)
    fig.tight_layout()
    fig.savefig(OUT_PNG, dpi=150)
    print(f"saved {OUT_PNG}")
    if SHOW:
        plt.show()


if __name__ == "__main__":
    main()
