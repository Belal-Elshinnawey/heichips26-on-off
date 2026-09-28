#!/usr/bin/env python3
# ========================================================================
# SPDX-FileCopyrightText: 2026 The HeiChips Contributors
# SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
#
# Refresh the injected LVS-reference netlist for a digital macro of this
# chip (heichips26_ook_top):
#
#   1. Copy the macro's own netlist/spice/<macro>.spice - the
#      magic-extracted SPICE that `make build-top` (in the macro's own
#      directory) populates via copy-netlist from the SAME LibreLane run
#      that copy-final populates final/gds/<macro>.gds from - into
#      netlist/schematic/<macro>_magic.spice. Using this build-top-owned
#      snapshot (instead of globbing flow/librelane/runs/RUN_* directly)
#      guarantees the injected netlist matches whatever GDS was last
#      promoted to the macro's final/, rather than whatever run happens
#      to be newest by mtime (which may be an experiment that was never
#      promoted, and so was never placed into the top-level layout).
#   2. Strip the empty "black-box abstract view" stub .subckts that
#      magic's ext2spice always prepends for referenced standard cells.
#      These stubs collide with the real standard-cell library that
#      gets appended later (Makefile's magic-lvs-netlist/
#      klayout-lvs-netlist targets), causing duplicate .subckt
#      definitions - a hard error in KLayout LVS, and a silent
#      wrong-binding (nets reading as "disconnected") in magic/netgen.
#   3. Compare the macro's .sym pin order against the real .subckt's
#      pin order and flag any mismatch. xschem instantiates a symbol
#      positionally (@pinlist, in .sym B-line order), so if the two
#      orders disagree, nets get silently cross-wired with no syntax
#      error - exactly the VPWR/VGND and q3/q3_d swap bug this script
#      exists to catch early.
#
# Usage (run from this macro's own directory, heichips26_ook_top/):
#   tools/refresh-digital-macro-netlist.py <macro_name>
#
# Exit status: 0 if the netlist was refreshed and pin orders match,
# 1 on a pin order/set mismatch (flagged, not auto-fixed) or a
# missing input file.
# ========================================================================

"""Refresh <macro>_magic.spice from the macro's build-top-populated spice
snapshot and flag pin-order mismatches against the macro's Xschem .sym.

Paths are fixed to this repo's layout (macros/<macro>/..., netlist/
schematic/...) since this tool is only ever run from heichips26_ook_top/.
"""

import os
import re
import shutil
import sys


def find_extracted_spice(macro_dir: str, macro: str) -> str:
    """Locate the build-top-populated spice netlist for macro.

    `make build-top` (run from macro_dir) populates this from the same
    LibreLane run that final/gds/<macro>.gds comes from, via its
    copy-netlist target - so this is guaranteed to match whatever GDS
    was last promoted to final/, unlike globbing flow/librelane/runs/
    directly (which would find whatever run is newest by mtime, even an
    experiment that was never promoted to final/).
    """
    path = os.path.join(macro_dir, "netlist", "spice", f"{macro}.spice")
    if not os.path.isfile(path):
        raise FileNotFoundError(
            f"No {path} found. Has `make build-top` been run in {macro_dir}?"
        )
    return path


BLACKBOX_BLOCK_RE = re.compile(
    r"^\* Black-box entry subcircuit for \S+ abstract view\n"
    r"\.subckt \S+[^\n]*\n"
    r"\.ends\n"
    r"\n?",
    re.MULTILINE,
)


def strip_blackbox_stubs(text: str) -> tuple[str, int]:
    """Remove magic's empty black-box abstract-view stub subckts.

    Returns (stripped_text, number_of_blocks_removed).
    """
    return BLACKBOX_BLOCK_RE.subn("", text)


def parse_sym_pin_order(sym_path: str) -> list[str]:
    """Return pin names from a .sym file in B-line (appearance) order.

    Digital macro symbols in this repo use plain scalar pins, so buses/
    sim_pinname/sim_pinnumber are intentionally not handled here.
    """
    pin_pattern = re.compile(r"^B\s+5\s+.*\{name=(\S+)\s+dir=\w+")
    pins = []
    with open(sym_path) as f:
        for line in f:
            m = pin_pattern.match(line.strip())
            if m:
                pins.append(m.group(1))
    return pins


def parse_subckt_pin_order(spice_path: str, macro: str) -> list[str]:
    """Return the pin list of `.subckt <macro> ...` (with continuations)."""
    subckt_re = re.compile(rf"^\.subckt\s+{re.escape(macro)}\b(.*)$", re.IGNORECASE)
    with open(spice_path) as f:
        lines = f.readlines()
    for i, line in enumerate(lines):
        m = subckt_re.match(line.strip())
        if not m:
            continue
        pins = m.group(1).split()
        for cont in lines[i + 1:]:
            cont = cont.strip()
            if cont.startswith("+"):
                pins.extend(cont[1:].split())
            else:
                break
        return pins
    raise ValueError(f"No '.subckt {macro} ...' found in {spice_path}")


def main() -> int:
    if len(sys.argv) != 2:
        print(f"Usage: {sys.argv[0]} <macro_name>", file=sys.stderr)
        return 1
    macro = sys.argv[1]

    macro_dir = os.path.join("macros", macro)
    sym_path = os.path.join(macro_dir, "schematic", "xschem", f"{macro}.sym")
    out_path = os.path.join("netlist", "schematic", f"{macro}_magic.spice")

    # 1. Find and copy the build-top-populated SPICE.
    try:
        src_path = find_extracted_spice(macro_dir, macro)
    except FileNotFoundError as e:
        print(f"[ERROR] {e}", file=sys.stderr)
        return 1
    print(f"Source netlist:  {src_path}")

    os.makedirs(os.path.dirname(out_path), exist_ok=True)
    shutil.copyfile(src_path, out_path)
    print(f"Copied to:       {out_path}")

    # 2. Strip black-box abstract-view stubs.
    with open(out_path) as f:
        text = f.read()
    stripped, n_removed = strip_blackbox_stubs(text)
    if n_removed:
        with open(out_path, "w") as f:
            f.write(stripped)
        print(f"Stripped {n_removed} black-box stub subckt(s).")
    else:
        print("No black-box stub subckts found (nothing to strip).")

    # 3. Compare pin order between .sym and the real .subckt.
    if not os.path.isfile(sym_path):
        print(f"[ERROR] Symbol file not found: {sym_path}", file=sys.stderr)
        return 1
    sym_pins = parse_sym_pin_order(sym_path)
    try:
        netlist_pins = parse_subckt_pin_order(out_path, macro)
    except ValueError as e:
        print(f"[ERROR] {e}", file=sys.stderr)
        return 1

    print(f"\nSymbol:   {sym_path}")
    print(f"  pins ({len(sym_pins)}): {sym_pins}")
    print(f"Netlist:  {out_path}")
    print(f"  pins ({len(netlist_pins)}): {netlist_pins}")

    if set(sym_pins) != set(netlist_pins):
        missing_in_sym = set(netlist_pins) - set(sym_pins)
        missing_in_netlist = set(sym_pins) - set(netlist_pins)
        print("\n[FLAGGED] Pin SET mismatch between .sym and .subckt:")
        if missing_in_sym:
            print(f"  In netlist but not in symbol: {sorted(missing_in_sym)}")
        if missing_in_netlist:
            print(f"  In symbol but not in netlist: {sorted(missing_in_netlist)}")
        return 1

    if sym_pins != netlist_pins:
        print("\n[FLAGGED] Pin ORDER mismatch between .sym and .subckt.")
        print("xschem instantiates positionally - this WILL cross-wire nets silently.")
        print(f"  {'slot':>4}  {'sym (as netlisted)':25s}  {'subckt (real)':25s}")
        for i, (sp, np) in enumerate(zip(sym_pins, netlist_pins)):
            marker = "" if sp == np else "  <-- MISMATCH"
            print(f"  {i:>4}  {sp:25s}  {np:25s}{marker}")
        print(
            "\nFix: reorder the B-lines in the .sym to match the netlist "
            "order above."
        )
        return 1

    print("\nOK: pin order matches.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
