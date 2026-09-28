import sys
import pya

path = globals().get("lvsdb", None)
if not path:
    print("usage: klayout -b -r dump_lvsdb_mismatch.py -rd lvsdb=<path>")
    sys.exit(1)

lvsdb = pya.LayoutVsSchematic()
lvsdb.read(path)
xref = lvsdb.xref()

print("=== circuit pairs (non-Match only) ===")
for cp in xref.each_circuit_pair():
    if str(cp.status()) == "Match":
        continue
    a = cp.first()
    b = cp.second()
    na = a.name if a else "(none)"
    nb = b.name if b else "(none)"

    net_bad = sum(1 for np in xref.each_net_pair(cp) if str(np.status()) != "Match")
    pin_bad = sum(1 for pp in xref.each_pin_pair(cp) if str(pp.status()) != "Match")
    dev_bad = sum(1 for dp in xref.each_device_pair(cp) if str(dp.status()) != "Match")
    sub_bad = sum(1 for sp in xref.each_subcircuit_pair(cp) if str(sp.status()) != "Match")

    print("%-25s | %-25s | status=%-10s nets=%d pins=%d devs=%d subckts=%d" % (
        na, nb, cp.status(), net_bad, pin_bad, dev_bad, sub_bad
    ))

    if pin_bad:
        for pp in xref.each_pin_pair(cp):
            if str(pp.status()) == "Match":
                continue
            pa = pp.first()
            pb = pp.second()
            print("    PIN layout=%-20s schematic=%-20s status=%s" % (
                pa.expanded_name() if pa else "(none)",
                pb.expanded_name() if pb else "(none)",
                pp.status(),
            ))
