v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
T {Active Load} 1850 -1640 0 0 0.4 0.4 {}
T {NOTE on rhigh L values (R1,R2,R4,R5,R6,R13):
l here is set to match KLayout LVS EXTRACTED length. If you do circuit simulation, or Pcell netlist import in Klayout, use these Ls in the schem instead:
R1=16.24e-6 R2=6.865e-6 R4=2.22e-6 R5=2.22e-6 R6=16.24e-6 R13=18.925e-6} 60 -1720 0 0 0.25 0.25 {}
T {Bias Current Sources for active load} 650 -1620 0 0 0.4 0.4 {}
T {Amplifier} 660 -980 0 0 0.4 0.4 {}
N 870 -350 920 -350 {lab=VSS}
N 870 -660 920 -660 {lab=VSS}
N 580 -610 610 -610 {lab=#net1}
N 540 -760 610 -760 {lab=#net1}
N 470 -610 540 -610 {lab=VSS}
N 540 -500 540 -470 {lab=VSS}
N 710 -610 710 -560 {lab=#net1}
N 1980 -1370 2020 -1370 {lab=vout}
N 1850 -1540 1850 -1490 {lab=isource1}
N 1850 -1590 1850 -1540 {lab=isource1}
N 340 -1260 400 -1260 {lab=#net2}
N 240 -1410 340 -1410 {lab=#net2}
N 340 -1410 340 -1260 {lab=#net2}
N 280 -1260 340 -1260 {lab=#net2}
N 240 -1410 240 -1380 {lab=#net2}
N 240 -1440 240 -1410 {lab=#net2}
N 320 -1110 320 -1090 {lab=VSS}
N 240 -1110 320 -1110 {lab=VSS}
N 440 -1330 440 -1290 {lab=isink1}
N 240 -1550 240 -1500 {lab=VDD}
N 1290 -1400 1320 -1400 {lab=#net3}
N 1230 -1520 1360 -1520 {lab=VDD}
N 1230 -1240 1230 -1180 {lab=#net3}
N 1230 -1130 1230 -1100 {lab=VSS}
N 1230 -1240 1290 -1240 {lab=#net3}
N 1290 -1400 1290 -1240 {lab=#net3}
N 1270 -1400 1290 -1400 {lab=#net3}
N 850 -1350 880 -1350 {lab=#net4}
N 790 -1520 920 -1520 {lab=VDD}
N 790 -1130 790 -1100 {lab=VSS}
N 790 -1210 850 -1210 {lab=#net4}
N 850 -1350 850 -1210 {lab=#net4}
N 830 -1350 850 -1350 {lab=#net4}
N 540 -870 540 -850 {lab=VDD}
N 540 -870 740 -870 {lab=VDD}
N 740 -870 760 -870 {lab=VDD}
N 740 -660 830 -660 {lab=VDD}
N 710 -350 830 -350 {lab=vin}
N 870 -830 1190 -830 {lab=vout}
N 1230 -1550 1230 -1520 {lab=VDD}
N 790 -1550 790 -1520 {lab=VDD}
N 1600 -1540 1660 -1540 {lab=VSS}
N 1660 -1180 1660 -1110 {lab=isink1}
N 1780 -620 1780 -590 {lab=#net5}
N 1840 -560 1990 -560 {lab=#net5}
N 1780 -720 1840 -720 {lab=#net5}
N 1780 -750 1780 -720 {lab=#net5}
N 1820 -560 1840 -560 {lab=#net5}
N 1720 -560 1780 -560 {lab=VSS}
N 2030 -630 2030 -590 {lab=vout}
N 1780 -830 1780 -810 {lab=VDD}
N 2030 -560 2120 -560 {lab=VSS}
N 1980 -1370 1980 -1310 {lab=vout}
N 1890 -1370 1980 -1370 {lab=vout}
N 1980 -1180 2040 -1180 {lab=VDD}
N 1980 -1050 1980 -1030 {lab=VSS}
N 1980 -1080 2040 -1080 {lab=VDD}
N 1980 -1250 1980 -1210 {lab=vout}
N 1980 -1280 2040 -1280 {lab=VDD}
N 1940 -1250 1980 -1250 {lab=vout}
N 1940 -1310 1940 -1250 {lab=vout}
N 1940 -1310 1980 -1310 {lab=vout}
N 1940 -1050 1980 -1050 {lab=VSS}
N 1940 -1110 1940 -1050 {lab=VSS}
N 1940 -1110 1980 -1110 {lab=VSS}
N 1980 -1150 1980 -1110 {lab=VSS}
N 1820 -1370 1850 -1370 {lab=VSS}
N 1820 -1290 1850 -1290 {lab=VSS}
N 1850 -1340 1850 -1320 {lab=VSS}
N 1850 -1320 1890 -1320 {lab=VSS}
N 1890 -1320 1890 -1260 {lab=VSS}
N 1850 -1260 1890 -1260 {lab=VSS}
N 1840 -1230 1850 -1230 {lab=VSS}
N 1850 -1260 1850 -1230 {lab=VSS}
N 1820 -1460 1850 -1460 {lab=VSS}
N 1890 -1490 1890 -1430 {lab=isource1}
N 1850 -1430 1890 -1430 {lab=isource1}
N 1850 -1430 1850 -1400 {lab=isource1}
N 1850 -1490 1890 -1490 {lab=isource1}
N 1700 -1540 1850 -1540 {lab=isource1}
N 1600 -1450 1660 -1450 {lab=VSS}
N 1660 -1420 1700 -1420 {lab=isink1}
N 1700 -1480 1700 -1420 {lab=isink1}
N 1660 -1480 1700 -1480 {lab=isink1}
N 1660 -1510 1660 -1480 {lab=isink1}
N 1600 -1620 1660 -1620 {lab=VSS}
N 1660 -1590 1700 -1590 {lab=VDD}
N 1700 -1650 1700 -1590 {lab=VDD}
N 1660 -1650 1700 -1650 {lab=VDD}
N 1660 -1590 1660 -1570 {lab=VDD}
N 1660 -1690 1660 -1650 {lab=VDD}
N 1360 -1310 1410 -1310 {lab=VDD}
N 1320 -1280 1360 -1280 {lab=isource1}
N 1320 -1340 1320 -1280 {lab=isource1}
N 1320 -1340 1360 -1340 {lab=isource1}
N 1360 -1400 1410 -1400 {lab=VDD}
N 1360 -1370 1360 -1340 {lab=isource1}
N 1360 -1280 1360 -1220 {lab=isource1}
N 1360 -1470 1410 -1470 {lab=VDD}
N 1320 -1440 1360 -1440 {lab=VDD}
N 1320 -1500 1320 -1440 {lab=VDD}
N 1320 -1500 1360 -1500 {lab=VDD}
N 1360 -1440 1360 -1430 {lab=VDD}
N 1360 -1520 1360 -1500 {lab=VDD}
N 1230 -1510 1270 -1510 {lab=VDD}
N 1270 -1510 1270 -1450 {lab=VDD}
N 1230 -1450 1270 -1450 {lab=VDD}
N 1230 -1520 1230 -1510 {lab=VDD}
N 1180 -1480 1230 -1480 {lab=VDD}
N 1180 -1400 1230 -1400 {lab=VDD}
N 1230 -1450 1230 -1430 {lab=VDD}
N 1230 -1340 1270 -1340 {lab=#net3}
N 1270 -1340 1270 -1280 {lab=#net3}
N 1230 -1280 1270 -1280 {lab=#net3}
N 1180 -1310 1230 -1310 {lab=VDD}
N 1230 -1370 1230 -1340 {lab=#net3}
N 1230 -1280 1230 -1240 {lab=#net3}
N 920 -1440 970 -1440 {lab=VDD}
N 880 -1410 920 -1410 {lab=VDD}
N 880 -1470 880 -1410 {lab=VDD}
N 880 -1470 920 -1470 {lab=VDD}
N 740 -1440 790 -1440 {lab=VDD}
N 790 -1410 830 -1410 {lab=VDD}
N 830 -1470 830 -1410 {lab=VDD}
N 790 -1470 830 -1470 {lab=VDD}
N 790 -1410 790 -1380 {lab=VDD}
N 920 -1410 920 -1380 {lab=VDD}
N 920 -1270 970 -1270 {lab=VDD}
N 880 -1240 920 -1240 {lab=vout}
N 880 -1300 880 -1240 {lab=vout}
N 880 -1300 920 -1300 {lab=vout}
N 920 -1240 920 -1170 {lab=vout}
N 920 -1320 920 -1300 {lab=vout}
N 740 -1270 790 -1270 {lab=VDD}
N 790 -1240 830 -1240 {lab=#net4}
N 830 -1300 830 -1240 {lab=#net4}
N 790 -1300 830 -1300 {lab=#net4}
N 790 -1240 790 -1210 {lab=#net4}
N 790 -1320 790 -1300 {lab=#net4}
N 790 -1520 790 -1470 {lab=VDD}
N 920 -1520 920 -1470 {lab=VDD}
N 320 -1110 440 -1110 {lab=VSS}
N 740 -1350 790 -1350 {lab=VDD}
N 920 -1350 970 -1350 {lab=VDD
spice_ignore=short}
N 400 -1330 440 -1330 {lab=isink1}
N 400 -1390 440 -1390 {lab=isink1}
N 440 -1360 500 -1360 {lab=VSS}
N 440 -1260 500 -1260 {lab=VSS}
N 440 -1540 440 -1390 {lab=isink1}
N 400 -1140 440 -1140 {lab=VSS}
N 400 -1200 400 -1140 {lab=VSS}
N 400 -1200 440 -1200 {lab=VSS}
N 440 -1170 500 -1170 {lab=VSS}
N 440 -1230 440 -1200 {lab=VSS}
N 240 -1320 280 -1320 {lab=#net2}
N 280 -1380 280 -1320 {lab=#net2}
N 240 -1380 280 -1380 {lab=#net2}
N 180 -1350 240 -1350 {lab=VSS}
N 240 -1320 240 -1290 {lab=#net2}
N 240 -1140 240 -1110 {lab=VSS}
N 240 -1140 280 -1140 {lab=VSS}
N 280 -1200 280 -1140 {lab=VSS}
N 240 -1200 280 -1200 {lab=VSS}
N 180 -1170 240 -1170 {lab=VSS}
N 240 -1230 240 -1200 {lab=VSS}
N 180 -1260 240 -1260 {lab=VSS}
N 400 -1390 400 -1330 {lab=isink1}
N 440 -1140 440 -1110 {lab=VSS}
N 2030 -730 2030 -690 {lab=vout}
N 1990 -630 2030 -630 {lab=vout}
N 1990 -690 1990 -630 {lab=vout}
N 1990 -690 2030 -690 {lab=vout}
N 1990 -430 2030 -430 {lab=VSS}
N 1990 -490 1990 -430 {lab=VSS}
N 1990 -490 2030 -490 {lab=VSS}
N 2030 -530 2030 -490 {lab=VSS}
N 2030 -430 2030 -380 {lab=VSS}
N 1720 -650 1780 -650 {lab=VSS}
N 1780 -620 1820 -620 {lab=#net5}
N 1780 -680 1820 -680 {lab=#net5}
N 1820 -680 1820 -620 {lab=#net5}
N 1780 -720 1780 -680 {lab=#net5}
N 1840 -720 1840 -560 {lab=#net5}
N 1720 -460 1780 -460 {lab=VSS}
N 1780 -430 1820 -430 {lab=VSS}
N 1780 -490 1820 -490 {lab=VSS}
N 1820 -490 1820 -430 {lab=VSS}
N 1780 -530 1780 -490 {lab=VSS}
N 1780 -430 1780 -380 {lab=VSS}
N 2030 -460 2120 -460 {lab=VSS}
N 2030 -660 2120 -660 {lab=VSS}
N 870 -710 870 -690 {lab=vout}
N 830 -710 870 -710 {lab=vout}
N 830 -770 830 -710 {lab=vout}
N 830 -770 870 -770 {lab=vout}
N 870 -830 870 -770 {lab=vout}
N 830 -550 870 -550 {lab=#net6}
N 830 -610 830 -550 {lab=#net6}
N 830 -610 870 -610 {lab=#net6}
N 870 -580 920 -580 {lab=VSS}
N 870 -630 870 -610 {lab=#net6}
N 870 -410 870 -380 {lab=#net6}
N 830 -410 870 -410 {lab=#net6}
N 830 -470 830 -410 {lab=#net6}
N 830 -470 870 -470 {lab=#net6}
N 870 -550 870 -470 {lab=#net6}
N 870 -440 920 -440 {lab=VSS}
N 830 -230 870 -230 {lab=VSS}
N 830 -290 830 -230 {lab=VSS}
N 830 -290 870 -290 {lab=VSS}
N 870 -260 920 -260 {lab=VSS}
N 870 -320 870 -290 {lab=VSS}
N 870 -230 870 -150 {lab=VSS}
N 710 -500 710 -350 {lab=vin}
N 540 -680 540 -640 {lab=#net1}
N 540 -680 580 -680 {lab=#net1}
N 580 -740 580 -680 {lab=#net1}
N 540 -740 580 -740 {lab=#net1}
N 870 -740 920 -740 {lab=VSS}
N 490 -710 540 -710 {lab=VSS}
N 540 -760 540 -740 {lab=#net1}
N 540 -790 540 -760 {lab=#net1}
N 610 -760 610 -610 {lab=#net1}
N 540 -500 580 -500 {lab=VSS}
N 580 -560 580 -500 {lab=VSS}
N 540 -560 580 -560 {lab=VSS}
N 490 -530 540 -530 {lab=VSS}
N 540 -580 540 -560 {lab=VSS}
N 540 -510 540 -500 {lab=VSS}
N 740 -870 740 -660 {lab=VDD}
N 1660 -1180 1940 -1180 {lab=isink1}
N 1660 -1420 1660 -1180 {lab=isink1}
N 790 -1210 790 -1190 {lab=#net4}
N 610 -610 710 -610 {lab=#net1}
N 410 -350 710 -350 {lab=vin}
C {title-3.sym} 0 0 0 0 {name=l1 author="Belal ELshinnawey" rev=1.0 lock=true}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 850 -660 0 0 {name=M14
l=0.5u
w=2.0u
ng=2
 m=1
  mm_ok=1
 model=sg13_hv_nmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 850 -350 0 0 {name=M15
l=0.5u
w=18.0u
ng=18
 m=1
  mm_ok=1
 model=sg13_hv_nmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 560 -610 0 1 {name=M16
l=0.5u
w=2.00u
ng=2
 m=1
  mm_ok=1
 model=sg13_hv_nmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 1870 -1370 0 1 {name=M17
l=0.5u
w=0.5u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_nmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 1680 -1540 0 1 {name=M18
l=0.5u
w=1.5u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_nmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 1960 -1180 0 0 {name=M19
l=0.5u
w=0.7u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 260 -1260 0 1 {name=M20
l=0.5u
w=10.0u
ng=5
 m=1
  mm_ok=1
 model=sg13_hv_nmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 420 -1260 0 0 {name=M21
l=0.5u
w=10.0u
ng=5
 m=1
  mm_ok=1
 model=sg13_hv_nmos
spiceprefix=X
}
C {devices/lab_pin.sym} 1660 -1110 0 0 {name=l14 sig_type=std_logic lab=isink1}
C {devices/lab_pin.sym} 440 -1540 0 0 {name=l20 sig_type=std_logic lab=isink1}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 1250 -1400 0 1 {name=M22
l=0.5u
w=14u
ng=7
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 1340 -1400 0 0 {name=M23
l=0.5u
w=14u
ng=7
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {devices/lab_pin.sym} 1360 -1220 0 1 {name=l23 sig_type=std_logic lab=isource1}
C {devices/lab_pin.sym} 1850 -1590 0 0 {name=l22 sig_type=std_logic lab=isource1}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 810 -1350 0 1 {name=M24
l=0.5u
w=14u
ng=7
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 900 -1350 0 0 {name=M25
l=0.5u
w=14u
ng=7
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {devices/lab_pin.sym} 2020 -1370 0 1 {name=l29 sig_type=std_logic lab=vout}
C {devices/lab_pin.sym} 920 -1170 0 1 {name=l30 sig_type=std_logic lab=vout}
C {devices/iopin.sym} 760 -870 0 0 {name=p11 lab=VDD}
C {devices/lab_pin.sym} 240 -1550 0 1 {name=l7 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 790 -1550 0 1 {name=l3 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 1230 -1550 0 1 {name=l5 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 1660 -1690 0 1 {name=l6 sig_type=std_logic lab=VDD}
C {devices/iopin.sym} 870 -150 1 0 {name=p1 lab=VSS}
C {devices/lab_pin.sym} 1230 -1100 0 0 {name=l8 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 790 -1100 0 0 {name=l9 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 320 -1090 0 0 {name=l12 sig_type=std_logic lab=VSS}
C {devices/ipin.sym} 410 -350 0 0 {name=p10 lab=vin}
C {devices/lab_pin.sym} 540 -470 0 0 {name=l13 sig_type=std_logic lab=VSS}
C {/home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/macros/ook_analog_system/schematic/xschem/rhigh_ps.sym} 710 -530 0 1 {name=R2
w=2.0e-6
l=9.96e-6
model=rhigh
body=VSS
spiceprefix=X
b=3
ps=0.18e-6
 m=1
  mm_ok=1
value="expr_eng(  ( 1.6e-4 / @w + 1360.0 * ( (@b + 1)* @l + ( 1.081*( @w - 0.04e-6 ) + 0.18e-6 )*@b ) / ( @w - 0.04e-6 ) ) / @m  )"
}
C {/home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/macros/ook_analog_system/schematic/xschem/rhigh_ps.sym} 790 -1160 0 1 {name=R5
w=2e-6
l=4.95e-6
model=rhigh
body=VSS
spiceprefix=X
b=2
ps=0.18e-6
 m=1
  mm_ok=1
value="expr_eng(  ( 1.6e-4 / @w + 1360.0 * ( (@b + 1)* @l + ( 1.081*( @w - 0.04e-6 ) + 0.18e-6 )*@b ) / ( @w - 0.04e-6 ) ) / @m  )"
}
C {/home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/macros/ook_analog_system/schematic/xschem/rhigh_ps.sym} 540 -820 0 0 {name=R1
w=2e-6
l=19.995e-6
model=rhigh
body=VSS
spiceprefix=X
b=9
ps=0.18e-6
 m=1
  mm_ok=1
value="expr_eng(  ( 1.6e-4 / @w + 1360.0 * ( (@b + 1)* @l + ( 1.081*( @w - 0.04e-6 ) + 0.18e-6 )*@b ) / ( @w - 0.04e-6 ) ) / @m  )"
}
C {/home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/macros/ook_analog_system/schematic/xschem/rhigh_ps.sym} 240 -1470 0 0 {name=R6
w=2.0e-6
l=19.995e-6
model=rhigh
body=VSS
spiceprefix=X
b=9
ps=0.18e-6
 m=1
  mm_ok=1
value="expr_eng(  ( 1.6e-4 / @w + 1360.0 * ( (@b + 1)* @l + ( 1.081*( @w - 0.04e-6 ) + 0.18e-6 )*@b ) / ( @w - 0.04e-6 ) ) / @m  )"
}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 1800 -560 0 1 {name=M2
l=0.5u
w=0.5u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_nmos
spiceprefix=X
spice_ignore=false}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 2010 -560 0 0 {name=M3
l=0.5u
w=0.5u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_nmos
spiceprefix=X
spice_ignore=false}
C {devices/lab_pin.sym} 2030 -730 0 1 {name=l17 sig_type=std_logic lab=vout
value=""expr_eng(  ( 1.6e-4 / @w + 1360.0 * ( (@b + 1)* @l + ( 1.081*( @w - 0.04e-6 ) + 0.18e-6 )*@b ) / ( @w - 0.04e-6 ) ) / @m  )"spice_ignore=true"
spice_ignore=false}
C {devices/lab_pin.sym} 920 -660 2 0 {name=l25 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1820 -1370 0 0 {name=l4 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1600 -1540 0 0 {name=l32 sig_type=std_logic lab=VSS}
C {devices/iopin.sym} 1190 -830 0 0 {name=p2 lab=vout}
C {/home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/macros/ook_analog_system/schematic/xschem/rhigh_ps.sym} 1230 -1160 0 1 {name=R4
w=2e-6
l=4.95e-6
model=rhigh
body=VSS
spiceprefix=X
b=2
ps=0.18e-6
 m=1
  mm_ok=1
value="expr_eng(  ( 1.6e-4 / @w + 1360.0 * ( (@b + 1)* @l + ( 1.081*( @w - 0.04e-6 ) + 0.18e-6 )*@b ) / ( @w - 0.04e-6 ) ) / @m  )"
}
C {devices/lab_pin.sym} 1780 -380 0 0 {name=l11 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1720 -560 0 0 {name=l15 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 2030 -380 0 0 {name=l16 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1780 -830 2 0 {name=l19 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 2120 -560 2 0 {name=l27 sig_type=std_logic lab=VSS}
C {/home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/macros/ook_analog_system/schematic/xschem/rhigh_ps.sym} 1780 -780 0 1 {name=R13
w=2e-6
l=22.72e-6
model=rhigh
body=VSS
spiceprefix=X
b=10
ps=0.18e-6
 m=1
  mm_ok=1
value="expr_eng(  ( 1.6e-4 / @w + 1360.0 * ( (@b + 1)* @l + ( 1.081*( @w - 0.04e-6 ) + 0.18e-6 )*@b ) / ( @w - 0.04e-6 ) ) / @m  )"
}
C {devices/lab_pin.sym} 2040 -1180 0 1 {name=l10 sig_type=std_logic lab=VDD}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 1960 -1080 0 0 {name=M1
l=0.5u
w=0.7u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {devices/lab_pin.sym} 1980 -1030 0 0 {name=l18 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 2040 -1080 0 1 {name=l21 sig_type=std_logic lab=VDD}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 1960 -1280 0 0 {name=M4
l=0.5u
w=0.7u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {devices/lab_pin.sym} 2040 -1280 0 1 {name=l26 sig_type=std_logic lab=VDD}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 1870 -1290 0 1 {name=M5
l=0.5u
w=0.5u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_nmos
spiceprefix=X
}
C {devices/lab_pin.sym} 1820 -1290 0 0 {name=l2 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1840 -1230 0 0 {name=l24 sig_type=std_logic lab=VSS}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 1870 -1460 0 1 {name=M6
l=0.5u
w=0.5u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_nmos
spiceprefix=X
}
C {devices/lab_pin.sym} 1820 -1460 0 0 {name=l28 sig_type=std_logic lab=VSS}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 1680 -1450 0 1 {name=M7
l=0.5u
w=1.5u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_nmos
spiceprefix=X
}
C {devices/lab_pin.sym} 1600 -1450 0 0 {name=l31 sig_type=std_logic lab=VSS}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 1680 -1620 0 1 {name=M8
l=0.5u
w=1.5u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_nmos
spiceprefix=X
}
C {devices/lab_pin.sym} 1600 -1620 0 0 {name=l33 sig_type=std_logic lab=VSS}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 1340 -1310 0 0 {name=M9
l=0.5u
w=2u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {devices/lab_pin.sym} 1410 -1310 0 1 {name=l34 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 1410 -1400 0 1 {name=l35 sig_type=std_logic lab=VDD}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 1340 -1470 0 0 {name=M10
l=0.5u
w=2u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {devices/lab_pin.sym} 1410 -1470 0 1 {name=l36 sig_type=std_logic lab=VDD}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 1250 -1480 0 1 {name=M11
l=0.5u
w=2u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {devices/lab_pin.sym} 1180 -1480 2 1 {name=l37 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 1180 -1400 2 1 {name=l38 sig_type=std_logic lab=VDD}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 1250 -1310 0 1 {name=M12
l=0.5u
w=2u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {devices/lab_pin.sym} 1180 -1310 2 1 {name=l39 sig_type=std_logic lab=VDD}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 900 -1440 0 0 {name=M13
l=0.5u
w=2u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {devices/lab_pin.sym} 970 -1440 0 1 {name=l40 sig_type=std_logic lab=VDD}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 810 -1440 0 1 {name=M26
l=0.5u
w=2u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {devices/lab_pin.sym} 740 -1440 0 0 {name=l41 sig_type=std_logic lab=VDD}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 900 -1270 0 0 {name=M27
l=0.5u
w=2u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {devices/lab_pin.sym} 970 -1270 0 1 {name=l42 sig_type=std_logic lab=VDD}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 810 -1270 0 1 {name=M28
l=0.5u
w=2u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {devices/lab_pin.sym} 740 -1270 0 0 {name=l43 sig_type=std_logic lab=VDD}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 420 -1360 0 0 {name=M29
l=0.5u
w=2.0u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_nmos
spiceprefix=X
}
C {devices/lab_pin.sym} 740 -1350 0 0 {name=l44 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 970 -1350 0 1 {name=l45 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 500 -1360 0 1 {name=l46 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 500 -1260 2 0 {name=l47 sig_type=std_logic lab=VSS}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 420 -1170 0 0 {name=M30
l=0.5u
w=2.0u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_nmos
spiceprefix=X
}
C {devices/lab_pin.sym} 500 -1170 0 1 {name=l48 sig_type=std_logic lab=VSS}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 260 -1350 0 1 {name=M31
l=0.5u
w=2.0u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_nmos
spiceprefix=X
}
C {devices/lab_pin.sym} 180 -1350 0 0 {name=l49 sig_type=std_logic lab=VSS}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 260 -1170 0 1 {name=M32
l=0.5u
w=2.0u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_nmos
spiceprefix=X
}
C {devices/lab_pin.sym} 180 -1170 0 0 {name=l50 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 180 -1260 0 0 {name=l51 sig_type=std_logic lab=VSS}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 2010 -660 0 0 {name=M33
l=0.5u
w=0.5u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_nmos
spiceprefix=X
spice_ignore=false}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 2010 -460 0 0 {name=M34
l=0.5u
w=0.5u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_nmos
spiceprefix=X
spice_ignore=false}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 1800 -650 0 1 {name=M35
l=0.5u
w=0.5u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_nmos
spiceprefix=X
spice_ignore=false}
C {devices/lab_pin.sym} 1720 -650 0 0 {name=l52 sig_type=std_logic lab=VSS}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 1800 -460 0 1 {name=M36
l=0.5u
w=0.5u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_nmos
spiceprefix=X
spice_ignore=false}
C {devices/lab_pin.sym} 1720 -460 0 0 {name=l53 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 2120 -460 2 0 {name=l54 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 2120 -660 2 0 {name=l55 sig_type=std_logic lab=VSS}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 850 -740 0 0 {name=M37
l=0.5u
w=1.0u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_nmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 850 -580 0 0 {name=M38
l=0.5u
w=1.0u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_nmos
spiceprefix=X
}
C {devices/lab_pin.sym} 920 -580 2 0 {name=l57 sig_type=std_logic lab=VSS}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 850 -440 0 0 {name=M39
l=0.5u
w=1.0u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_nmos
spiceprefix=X
}
C {devices/lab_pin.sym} 920 -350 2 0 {name=l58 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 920 -440 2 0 {name=l59 sig_type=std_logic lab=VSS}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 850 -260 0 0 {name=M40
l=0.5u
w=1.0u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_nmos
spiceprefix=X
}
C {devices/lab_pin.sym} 920 -260 2 0 {name=l60 sig_type=std_logic lab=VSS}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 560 -710 0 1 {name=M41
l=0.5u
w=1.00u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_nmos
spiceprefix=X
}
C {devices/lab_pin.sym} 920 -740 2 0 {name=l56 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 490 -710 2 1 {name=l61 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 470 -610 2 1 {name=l62 sig_type=std_logic lab=VSS}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 560 -530 0 1 {name=M42
l=0.5u
w=1.00u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_nmos
spiceprefix=X
}
C {devices/lab_pin.sym} 490 -530 2 1 {name=l63 sig_type=std_logic lab=VSS}
