v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 670 -930 720 -930 {lab=vin}
N 880 -1050 880 -1010 {lab=VDD3_3}
N 2080 -1430 2080 -1390 {lab=VDD3_3}
N 2060 -1430 2060 -1390 {lab=VDD1_5}
N 880 -850 880 -820 {lab=VSS}
N 2220 -1270 2270 -1270 {lab=q3}
N 2220 -1290 2270 -1290 {lab=q2}
N 2220 -1310 2270 -1310 {lab=q1}
N 2220 -1330 2270 -1330 {lab=q0}
N 1590 -1300 1590 -1250 {lab=ACC_CAP}
N 770 -1030 770 -1010 {lab=Cap_M2}
N 790 -1030 790 -1010 {lab=Cap_M1}
N 830 -1030 830 -1010 {lab=Cap_M21}
N 850 -1030 850 -1010 {lab=Cap_M11}
N 1960 -1210 1960 -1160 {lab=vref0}
N 1980 -1210 1980 -1160 {lab=vref1}
N 2000 -1210 2000 -1160 {lab=vref2}
N 2020 -1210 2020 -1160 {lab=vref3}
N 2070 -1210 2070 -1170 {lab=VSS}
N 1040 -930 1180 -930 {lab=lnaf}
N 940 -1450 970 -1450 {lab=#net1}
N 880 -1620 1010 -1620 {lab=VDD3_3}
N 880 -1230 880 -1170 {lab=VSS}
N 880 -1310 940 -1310 {lab=#net1}
N 940 -1450 940 -1310 {lab=#net1}
N 920 -1450 940 -1450 {lab=#net1}
N 880 -1650 880 -1620 {lab=VDD3_3}
N 1010 -1540 1060 -1540 {lab=VDD3_3}
N 970 -1510 1010 -1510 {lab=VDD3_3}
N 970 -1570 970 -1510 {lab=VDD3_3}
N 970 -1570 1010 -1570 {lab=VDD3_3}
N 830 -1540 880 -1540 {lab=VDD3_3}
N 880 -1510 920 -1510 {lab=VDD3_3}
N 920 -1570 920 -1510 {lab=VDD3_3}
N 880 -1570 920 -1570 {lab=VDD3_3}
N 880 -1510 880 -1480 {lab=VDD3_3}
N 1010 -1510 1010 -1480 {lab=VDD3_3}
N 1010 -1370 1060 -1370 {lab=VDD3_3}
N 970 -1340 1010 -1340 {lab=opm}
N 970 -1400 970 -1340 {lab=opm}
N 970 -1400 1010 -1400 {lab=opm}
N 1010 -1420 1010 -1400 {lab=opm}
N 830 -1370 880 -1370 {lab=VDD3_3}
N 880 -1340 920 -1340 {lab=#net1}
N 920 -1400 920 -1340 {lab=#net1}
N 880 -1400 920 -1400 {lab=#net1}
N 880 -1340 880 -1310 {lab=#net1}
N 880 -1420 880 -1400 {lab=#net1}
N 880 -1620 880 -1570 {lab=VDD3_3}
N 1010 -1620 1010 -1570 {lab=VDD3_3}
N 830 -1450 880 -1450 {lab=VDD3_3}
N 1010 -1450 1060 -1450 {lab=VDD3_3
spice_ignore=short}
N 880 -1310 880 -1290 {lab=#net1}
N 1010 -1210 1010 -1190 {lab=VSS}
N 1010 -1300 1010 -1270 {lab=opm}
N 1180 -1280 1180 -1250 {lab=opm}
N 1010 -1300 1180 -1300 {lab=opm}
N 1010 -1340 1010 -1300 {lab=opm}
N 1160 -1280 1180 -1280 {lab=opm}
N 1180 -1300 1180 -1280 {lab=opm}
N 1450 -1300 1460 -1300 {lab=opm}
N 1490 -1260 1530 -1260 {lab=ACC_CAP}
N 1530 -1300 1530 -1260 {lab=ACC_CAP}
N 1520 -1300 1530 -1300 {lab=ACC_CAP}
N 1180 -1300 1450 -1300 {lab=opm}
N 1180 -1060 1180 -930 {lab=lnaf}
N 1450 -1400 1450 -1300 {lab=opm}
N 1450 -1400 1490 -1400 {lab=opm}
N 1490 -1400 1490 -1300 {lab=opm}
N 1530 -1300 1590 -1300 {lab=ACC_CAP}
N 1160 -1060 1180 -1060 {lab=lnaf}
N 1180 -1190 1180 -1060 {lab=lnaf}
N 1590 -1300 1920 -1300 {lab=ACC_CAP}
C {title-3.sym} 0 0 0 0 {name=l1 author="Belal ELshinnawey" rev=1.0 lock=true}
C {devices/iopin.sym} 880 -820 1 0 {name=p3 lab=VSS}
C {devices/ipin.sym} 670 -930 0 0 {name=p4 lab=vin}
C {devices/iopin.sym} 2270 -1270 0 0 {name=p5 lab=q3}
C {devices/iopin.sym} 880 -1050 1 1 {name=p6 lab=VDD3_3}
C {devices/lab_pin.sym} 2080 -1430 1 0 {name=l4 sig_type=std_logic lab=VDD3_3}
C {devices/iopin.sym} 2060 -1430 1 1 {name=p1 lab=VDD1_5}
C {devices/lab_pin.sym} 2070 -1170 3 0 {name=l5 sig_type=std_logic lab=VSS}
C {devices/iopin.sym} 2270 -1290 0 0 {name=p2 lab=q2}
C {devices/iopin.sym} 2270 -1310 0 0 {name=p7 lab=q1}
C {devices/iopin.sym} 2270 -1330 0 0 {name=p8 lab=q0}
C {devices/iopin.sym} 1590 -1250 1 0 {name=p9 lab=ACC_CAP}
C {devices/iopin.sym} 770 -1030 1 1 {name=p10 lab=Cap_M2}
C {devices/iopin.sym} 790 -1030 1 1 {name=p11 lab=Cap_M1}
C {devices/iopin.sym} 830 -1030 1 1 {name=p12 lab=Cap_M21}
C {devices/iopin.sym} 850 -1030 1 1 {name=p13 lab=Cap_M11}
C {devices/iopin.sym} 2020 -1160 1 0 {name=p16 lab=vref3}
C {devices/iopin.sym} 2000 -1160 1 0 {name=p17 lab=vref2}
C {devices/iopin.sym} 1980 -1160 1 0 {name=p18 lab=vref1}
C {devices/iopin.sym} 1960 -1160 1 0 {name=p19 lab=vref0}
C {simple_comparator_stage.sym} 2070 -1300 0 0 {name=x2}
C {lna_stage.sym} 850 -930 0 0 {name=x1}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 900 -1450 0 1 {name=M24
l=0.5u
w=14u
ng=7
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 990 -1450 0 0 {name=M25
l=0.5u
w=14u
ng=7
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {rhigh_ps.sym} 880 -1260 0 1 {name=R5
w=2e-6
l=10e-6
model=rhigh
body=VSS
spiceprefix=X
b=0
ps=0
 m=1
  mm_ok=1
value="expr_eng(  ( 1.6e-4 / @w + 1360.0 * ( (@b + 1)* @l + ( 1.081*( @w - 0.04e-6 ) + 0.18e-6 )*@b ) / ( @w - 0.04e-6 ) ) / @m  )"
}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 990 -1540 0 0 {name=M13
l=0.5u
w=2u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 900 -1540 0 1 {name=M26
l=0.5u
w=2u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 990 -1370 0 0 {name=M27
l=0.5u
w=2u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 900 -1370 0 1 {name=M28
l=0.5u
w=2u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {rhigh_ps.sym} 1010 -1240 0 1 {name=R3
w=2e-6
l=8e-6
model=rhigh
body=VSS
spiceprefix=X
b=0
ps=0
 m=1
  mm_ok=1
value="expr_eng(  ( 1.6e-4 / @w + 1360.0 * ( (@b + 1)* @l + ( 1.081*( @w - 0.04e-6 ) + 0.18e-6 )*@b ) / ( @w - 0.04e-6 ) ) / @m  )"
}
C {devices/lab_pin.sym} 830 -1540 0 0 {name=p22 sig_type=std_logic lab=VDD3_3}
C {devices/lab_pin.sym} 840 -1450 0 0 {name=p24 sig_type=std_logic lab=VDD3_3}
C {devices/lab_pin.sym} 830 -1370 0 0 {name=p25 sig_type=std_logic lab=VDD3_3}
C {devices/lab_pin.sym} 1060 -1540 2 0 {name=p26 sig_type=std_logic lab=VDD3_3}
C {devices/lab_pin.sym} 1060 -1450 2 0 {name=p27 sig_type=std_logic lab=VDD3_3}
C {devices/lab_pin.sym} 1060 -1370 2 0 {name=p28 sig_type=std_logic lab=VDD3_3}
C {devices/lab_pin.sym} 880 -1170 0 0 {name=p29 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1010 -1190 0 0 {name=p30 sig_type=std_logic lab=VSS}
C {sg13cmos5l_pr/cap_mfringe.sym} 1180 -1220 2 0 {name=C2
model=cap_mfringe
w=8.0u
l=40.0u
mmin=3
mmax=4
spiceprefix=X
spice_ignore=true}
C {devices/iopin.sym} 1160 -1280 2 0 {name=p31 lab=opm}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 1490 -1280 3 0 {name=M2
l=0.5u
w=20u
 ng=10
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {devices/lab_pin.sym} 880 -1650 1 0 {name=l2 sig_type=std_logic lab=VDD3_3}
C {devices/iopin.sym} 1160 -1060 2 0 {name=p14 lab=lnaf}
