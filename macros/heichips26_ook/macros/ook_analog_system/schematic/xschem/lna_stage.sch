v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 780 -870 820 -870 {lab=vin}
N 870 -820 870 -790 {lab=VSS}
N 870 -950 870 -920 {lab=VDD}
N 950 -870 970 -870 {lab=Cap_M1}
N 1120 -820 1120 -790 {lab=VSS}
N 1120 -950 1120 -920 {lab=VDD}
N 1040 -870 1070 -870 {lab=Cap_M2}
N 1040 -910 1040 -870 {lab=Cap_M2}
N 1030 -870 1040 -870 {lab=Cap_M2}
N 950 -910 950 -870 {lab=Cap_M1}
N 930 -870 950 -870 {lab=Cap_M1}
N 1180 -870 1340 -870 {lab=Cap_M11}
N 1340 -870 1360 -870 {lab=Cap_M11}
N 1510 -820 1510 -790 {lab=VSS}
N 1510 -950 1510 -920 {lab=VDD}
N 1430 -870 1460 -870 {lab=Cap_M21}
N 1430 -910 1430 -870 {lab=Cap_M21}
N 1420 -870 1430 -870 {lab=Cap_M21}
N 1340 -910 1340 -870 {lab=Cap_M11}
N 1570 -870 1620 -870 {lab=vout}
C {title-3.sym} 0 0 0 0 {name=l1 author="Belal ELshinnawey" rev=1.0 lock=true}
C {devices/ipin.sym} 780 -870 0 0 {name=p3 lab=vin}
C {devices/iopin.sym} 870 -790 1 0 {name=p4 lab=VSS}
C {devices/iopin.sym} 870 -950 3 0 {name=p5 lab=VDD}
C {devices/lab_pin.sym} 1120 -950 2 0 {name=l21 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 1120 -790 0 0 {name=l24 sig_type=std_logic lab=VSS}
C {lna.sym} 870 -870 0 0 {name=x2}
C {lna.sym} 1120 -870 0 0 {name=x1}
C {devices/iopin.sym} 1040 -910 3 0 {name=p1 lab=Cap_M2}
C {devices/iopin.sym} 950 -910 3 0 {name=p6 lab=Cap_M1}
C {sg13cmos5l_pr/cap_mfringe.sym} 1000 -870 1 0 {name=C1
model=cap_mfringe
w=16.5u
l=21u
mmin=3
mmax=4
spiceprefix=X
spice_ignore=true
}
C {devices/iopin.sym} 1620 -870 0 0 {name=p7 lab=vout}
C {lna.sym} 1510 -870 0 0 {name=x3
lab=Cap_M21}
C {devices/iopin.sym} 1430 -910 3 0 {name=p8 lab=Cap_M21}
C {devices/iopin.sym} 1340 -910 3 0 {name=p9 lab=Cap_M11}
C {devices/lab_pin.sym} 1510 -790 0 0 {name=l3 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1510 -950 2 0 {name=l2 sig_type=std_logic lab=VDD}
C {sg13cmos5l_pr/cap_mfringe.sym} 1390 -870 1 0 {name=C2
model=cap_mfringe
w=16.5u
l=21u
mmin=3
mmax=4
spiceprefix=X
spice_ignore=true
}
