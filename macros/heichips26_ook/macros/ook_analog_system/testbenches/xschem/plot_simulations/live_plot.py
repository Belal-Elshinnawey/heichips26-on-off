import argparse
import math
import os
import re
import struct
import time
from collections import deque

import matplotlib.pyplot as plt
import matplotlib.animation as animation
from matplotlib.ticker import FuncFormatter

FREQ_RE = re.compile(r"^freq\((.+)\)$")


def eng_notation(val, pos=None):
    if val == 0:
        return "0"
    exp = int(math.floor(math.log10(abs(val)) / 3) * 3)
    mantissa = val / (10 ** exp)
    return f"{mantissa:.3g}e{exp}"


ENG_FORMATTER = FuncFormatter(eng_notation)


def parse_header(f):
    varnames = []
    nvars = None
    while True:
        pos = f.tell()
        raw = f.readline()
        if not raw:
            f.seek(pos)
            time.sleep(0.2)
            continue
        text = raw.decode("latin1").rstrip("\r\n")
        if text.startswith("No. Variables:"):
            nvars = int(text.split(":")[1].strip())
        elif text.strip() == "Variables:":
            for _ in range(nvars):
                parts = f.readline().decode("latin1").split()
                varnames.append(parts[1])
        elif text.strip() == "Values:":
            return f, varnames, "ascii"
        elif text.strip() == "Binary:":
            return f, varnames, "binary"


def read_new_points_ascii(f, nvars, leftover):
    lines = leftover + f.readlines()
    n_complete = len(lines) // nvars
    used = n_complete * nvars
    points = []
    for i in range(n_complete):
        block = lines[i * nvars:(i + 1) * nvars]
        first = block[0].decode("latin1").split()
        vals = [float(first[-1])]
        vals.extend(float(l.decode("latin1").strip()) for l in block[1:])
        points.append(vals)
    return points, lines[used:]


def read_new_points_binary(f, nvars, leftover):
    record_size = nvars * 8
    data = leftover + f.read()
    n_complete = len(data) // record_size
    used = n_complete * record_size
    points = []
    for i in range(n_complete):
        chunk = data[i * record_size:(i + 1) * record_size]
        points.append(struct.unpack(f"<{nvars}d", chunk))
    return points, data[used:]


class Decimator:
    def __init__(self, maxpoints, nseries):
        self.maxpoints = maxpoints
        self.stride = 1
        self.counter = 0
        self.tbuf = []
        self.ybufs = [[] for _ in range(nseries)]

    def add(self, t, ys):
        self.counter += 1
        if self.counter % self.stride != 0:
            return
        self.tbuf.append(t)
        for i, y in enumerate(ys):
            self.ybufs[i].append(y)
        if len(self.tbuf) > self.maxpoints:
            self.tbuf = self.tbuf[::2]
            self.ybufs = [b[::2] for b in self.ybufs]
            self.stride *= 2


class RunningWindow:
    """Keeps only the last `window` seconds of data: a fixed, small
    sliding buffer, oldest points dropped as new ones arrive. No history
    retained, no stride-doubling/decimation logic -- there's never more
    than ~window/sample_period points held, so none is needed. Exposes
    the same .tbuf/.ybufs shape as Decimator so callers don't care which
    one they got."""
    def __init__(self, window, nseries):
        self.window = window
        self.tbuf = deque()
        self.ybufs = [deque() for _ in range(nseries)]

    def add(self, t, ys):
        self.tbuf.append(t)
        for i, y in enumerate(ys):
            self.ybufs[i].append(y)
        cutoff = t - self.window
        while self.tbuf and self.tbuf[0] < cutoff:
            self.tbuf.popleft()
            for buf in self.ybufs:
                buf.popleft()


RAIL_LOW = 0.0
RAIL_HIGH = 1.5
MID_RAIL = (RAIL_LOW + RAIL_HIGH) / 2


class FreqTracker:
    def __init__(self, buffer_factory):
        self.armed = True
        self.last_cross_t = None
        self.dec = buffer_factory(1)

    def update(self, t, val):
        if self.armed and val >= MID_RAIL:
            self.armed = False
            if self.last_cross_t is not None:
                period = t - self.last_cross_t
                if period > 0:
                    self.dec.add(t, [1.0 / period])
            self.last_cross_t = t
        elif not self.armed and val < MID_RAIL:
            self.armed = True


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("rawfile")
    ap.add_argument("signals", nargs="*", default=None)
    ap.add_argument("--group", action="append", default=None)
    ap.add_argument("--ymax", action="append", default=None,
                     help="Fixed upper y-limit for the Nth --group, in "
                          "order (e.g. 900e6). Use 'auto' to autoscale "
                          "that group; groups without a --ymax autoscale.")
    ap.add_argument("--ymin", action="append", default=None,
                     help="Fixed lower y-limit for the Nth --group, in "
                          "order (e.g. 0). Use 'auto' to autoscale that "
                          "group; groups without a --ymin autoscale.")
    ap.add_argument("--maxpoints", type=int, default=20000)
    ap.add_argument("--interval", type=float, default=1.0)
    ap.add_argument("--running", type=float, default=None,
                     help="Running/oscilloscope mode: show only the last "
                          "RUNNING seconds of data in a small fixed "
                          "buffer, dropping older points as new ones "
                          "arrive -- no history kept, no decimation. "
                          "E.g. --running 20e-6 for a 20us moving window. "
                          "Omit for the default: full history, "
                          "progressively downsampled to fit --maxpoints.")
    args = ap.parse_args()

    if args.group:
        groups = [g.split(",") for g in args.group]
    elif args.signals:
        groups = [args.signals]
    else:
        groups = [["vin"], ["vout"]]

    ymax_list = list(args.ymax) if args.ymax else []
    ymax_list += [None] * (len(groups) - len(ymax_list))
    ymax_vals = [None if v is None or v.lower() == "auto" else float(v)
                 for v in ymax_list]

    ymin_list = list(args.ymin) if args.ymin else []
    ymin_list += [None] * (len(groups) - len(ymin_list))
    ymin_vals = [None if v is None or v.lower() == "auto" else float(v)
                 for v in ymin_list]

    while not os.path.exists(args.rawfile):
        time.sleep(0.2)

    def find_idx(name):
        # ngspice raw files name a saved branch current "<device>#branch",
        # not "i(device)" -- strip a possible i(...)/I(...) wrapper so both
        # forms resolve to the same lookup.
        inner = name
        m = re.match(r'^[iI]\((.+)\)$', name)
        if m:
            inner = m.group(1)
        for candidate in (name, f"v({name})", f"i({name})",
                          f"{inner}#branch"):
            if candidate in varnames:
                return varnames.index(candidate)
        raise SystemExit(f"signal '{name}' not found in {varnames[:20]}...")

    f = open(args.rawfile, "rb")
    f, varnames, mode = parse_header(f)
    time_idx = find_idx("time")
    leftover = [] if mode == "ascii" else b""

    plain_signals = []
    freq_inner = []
    for g in groups:
        for s in g:
            m = FREQ_RE.match(s)
            if m:
                if m.group(1) not in freq_inner:
                    freq_inner.append(m.group(1))
            else:
                plain_signals.append(s)

    plain_idxs = [find_idx(s) for s in plain_signals]
    freq_idxs = {inner: find_idx(inner) for inner in freq_inner}

    if args.running is not None:
        def make_buffer(nseries):
            return RunningWindow(args.running, nseries)
    else:
        def make_buffer(nseries):
            return Decimator(args.maxpoints, nseries)

    trackers = {inner: FreqTracker(make_buffer) for inner in freq_inner}

    dec = make_buffer(len(plain_signals))

    fig, axes = plt.subplots(len(groups), 1, sharex=True, squeeze=False)
    axes = [row[0] for row in axes]
    for ax in axes:
        ax.yaxis.set_major_formatter(ENG_FORMATTER)
        ax.xaxis.set_major_formatter(ENG_FORMATTER)

    line_specs = []
    plain_pos = 0
    for gi, g in enumerate(groups):
        for si, s in enumerate(g):
            m = FREQ_RE.match(s)
            line, = axes[gi].plot([], [], label=s)
            cursor, = axes[gi].plot([], [], marker="o", markersize=6,
                                     color=line.get_color(), linestyle="None")
            # Fixed readout in the axes' top-right corner (axes-fraction
            # coords, not data coords) so it can never scroll off-plot as
            # the cursor tracks the latest, ever-advancing time sample --
            # only the text content is updated each frame, not its position.
            label = axes[gi].text(
                0.98, 0.95 - 0.08 * si, "", transform=axes[gi].transAxes,
                ha="right", va="top", color=line.get_color(),
                fontsize=9, fontweight="bold")
            if m:
                line_specs.append((line, cursor, label, s, "freq", m.group(1)))
            else:
                line_specs.append((line, cursor, label, s, "plain", plain_pos))
                plain_pos += 1
        axes[gi].legend()
    axes[-1].set_xlabel("time (s)")

    def update(frame):
        nonlocal leftover
        if mode == "ascii":
            points, leftover = read_new_points_ascii(f, len(varnames), leftover)
        else:
            points, leftover = read_new_points_binary(f, len(varnames), leftover)
        for p in points:
            t = p[time_idx]
            dec.add(t, [p[i] for i in plain_idxs])
            for inner, idx in freq_idxs.items():
                trackers[inner].update(t, p[idx])
        artists = [a for spec in line_specs for a in spec[:3]]
        if dec.tbuf:
            for line, cursor, label, name, kind, ref in line_specs:
                if kind == "plain":
                    tbuf, ybuf = dec.tbuf, dec.ybufs[ref]
                else:
                    tdec = trackers[ref].dec
                    tbuf, ybuf = tdec.tbuf, tdec.ybufs[0]
                if not tbuf:
                    continue
                line.set_data(tbuf, ybuf)
                t_last, y_last = tbuf[-1], ybuf[-1]
                cursor.set_data([t_last], [y_last])
                label.set_text(f"{name}={eng_notation(y_last)}")
            for gi, ax in enumerate(axes):
                ax.relim()
                ax.autoscale_view()
                if ymax_vals[gi] is not None or ymin_vals[gi] is not None:
                    # set_ylim() disables autoscale for this axis; whichever
                    # side isn't fixed must come fresh from autoscale_view()
                    # above, then autoscale is re-armed so next frame's free
                    # side still tracks the running data instead of freezing.
                    bottom, top = ax.get_ylim()
                    if ymin_vals[gi] is not None:
                        bottom = ymin_vals[gi]
                    if ymax_vals[gi] is not None:
                        top = ymax_vals[gi]
                    ax.set_ylim(bottom=bottom, top=top)
                    ax.set_autoscaley_on(True)
        return artists

    ani = animation.FuncAnimation(fig, update, interval=args.interval * 1000)
    plt.show()


if __name__ == "__main__":
    main()
