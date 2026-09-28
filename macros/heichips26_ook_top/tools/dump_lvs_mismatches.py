#!/usr/bin/env python3
# ========================================================================
# SPDX-FileCopyrightText: 2026 The HeiChips Contributors
# SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
#
# Print every non-matching circuit/net/device/pin/subcircuit pair from a
# KLayout LVS .lvsdb report, so a failing `compare` can be root-caused
# without opening the GUI netlist browser.
#
# Usage:
#   klayout -b -r tools/dump_lvs_mismatches.py -rd lvsdb=<path-to-.lvsdb> [-rd out=<report.txt>]
#
# Full detail is written to `out` (default: <lvsdb>.mismatches.txt) since a
# failing run on a large design can produce thousands of rows - only
# per-kind counts and a small sample print to stdout.
# ========================================================================

import os
import sys

import klayout.db as db

lvsdb_path = globals().get("lvsdb")
if not lvsdb_path:
    print("Pass -rd lvsdb=<path-to-.lvsdb>", file=sys.stderr)
    sys.exit(1)

out_path = globals().get("out") or f"{lvsdb_path}.mismatches.txt"

l2n = db.LayoutVsSchematic()
l2n.read(lvsdb_path)

xref = l2n.xref()
if xref is None:
    print("No cross-reference data in this lvsdb (was it a NET_ONLY run?)")
    sys.exit(1)


def name_of(obj):
    if obj is None:
        return "(none)"
    for attr in ("expanded_name", "name"):
        if hasattr(obj, attr):
            try:
                return getattr(obj, attr)()
            except TypeError:
                return getattr(obj, attr)
    return str(obj)


any_mismatch = False
counts = {}

with open(out_path, "w") as out:
    circuit_pairs = list(xref.each_circuit_pair())
    out.write(f"Total circuit pairs: {len(circuit_pairs)}\n\n")

    for cp in circuit_pairs:
        c1 = cp.first()
        c2 = cp.second()
        label = f"{name_of(c1)} / {name_of(c2)}"
        cp_status = str(cp.status())

        if cp_status != "Match":
            any_mismatch = True
            out.write(f"CIRCUIT {label}: {cp_status}\n")
            counts["circuit"] = counts.get("circuit", 0) + 1

        # Contents can only be walked when the circuit exists on both sides.
        if c1 is None or c2 is None:
            continue

        for kind, iterator in (
            ("net", xref.each_net_pair),
            ("device", xref.each_device_pair),
            ("pin", xref.each_pin_pair),
            ("subcircuit", xref.each_subcircuit_pair),
        ):
            rows = []
            for pair in iterator(cp):
                st = str(pair.status())
                if st != "Match":
                    rows.append(
                        f"  [{label}] {kind} layout={name_of(pair.first())} schematic={name_of(pair.second())}: {st}"
                    )
            if rows:
                any_mismatch = True
                counts[kind] = counts.get(kind, 0) + len(rows)
                out.write(f"=== {kind} mismatches in circuit {label} ({len(rows)}) ===\n")
                for r in rows:
                    out.write(r + "\n")
                out.write("\n")

if not any_mismatch:
    print("No non-matching pairs found (unexpected for a FAIL run).")
else:
    print(f"Full detail written to: {out_path}\n")
    print("Mismatch counts:")
    for kind, n in counts.items():
        print(f"  {kind}: {n}")
