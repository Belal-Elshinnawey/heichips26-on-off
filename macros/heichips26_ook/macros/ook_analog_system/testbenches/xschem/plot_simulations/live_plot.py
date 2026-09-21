import argparse
import os
import struct
import time

import matplotlib.pyplot as plt
import matplotlib.animation as animation


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


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("rawfile")
    ap.add_argument("signals", nargs="*", default=None)
    ap.add_argument("--group", action="append", default=None)
    ap.add_argument("--maxpoints", type=int, default=20000)
    ap.add_argument("--interval", type=float, default=1.0)
    args = ap.parse_args()

    if args.group:
        groups = [g.split(",") for g in args.group]
    elif args.signals:
        groups = [args.signals]
    else:
        groups = [["vin"], ["vout"]]
    flat = [s for g in groups for s in g]

    while not os.path.exists(args.rawfile):
        time.sleep(0.2)

    def find_idx(name):
        for candidate in (name, f"v({name})", f"i({name})"):
            if candidate in varnames:
                return varnames.index(candidate)
        raise SystemExit(f"signal '{name}' not found in {varnames[:20]}...")

    f = open(args.rawfile, "rb")
    f, varnames, mode = parse_header(f)
    idxs = [find_idx(s) for s in flat]
    time_idx = find_idx("time")
    leftover = [] if mode == "ascii" else b""

    dec = Decimator(args.maxpoints, len(flat))

    fig, axes = plt.subplots(len(groups), 1, sharex=True, squeeze=False)
    axes = [row[0] for row in axes]

    lines = []
    for gi, g in enumerate(groups):
        for s in g:
            line, = axes[gi].plot([], [], label=s)
            lines.append(line)
        axes[gi].legend()
    axes[-1].set_xlabel("time (s)")

    def update(frame):
        nonlocal leftover
        if mode == "ascii":
            points, leftover = read_new_points_ascii(f, len(varnames), leftover)
        else:
            points, leftover = read_new_points_binary(f, len(varnames), leftover)
        for p in points:
            dec.add(p[time_idx], [p[i] for i in idxs])
        if dec.tbuf:
            for i, line in enumerate(lines):
                line.set_data(dec.tbuf, dec.ybufs[i])
            for ax in axes:
                ax.relim()
                ax.autoscale_view()
        return lines

    ani = animation.FuncAnimation(fig, update, interval=args.interval * 1000)
    plt.show()


if __name__ == "__main__":
    main()
