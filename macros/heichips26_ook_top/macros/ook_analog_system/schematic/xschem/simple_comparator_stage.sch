v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 2090 -1510 2140 -1510 {lab=q0}
N 2040 -1620 2040 -1560 {lab=VDD1_5}
N 2050 -1470 2050 -1450 {lab=VSS}
N 1970 -1500 2000 -1500 {lab=vin}
N 1980 -1520 2000 -1520 {lab=vref0}
N 440 -1340 440 -1310 {lab=VDD3_3}
N 440 -640 440 -600 {lab=VSS}
N 440 -870 440 -840 {lab=vref1}
N 440 -1190 440 -1120 {lab=vref3}
N 440 -740 440 -700 {lab=vref0}
N 440 -1190 480 -1190 {lab=vref3}
N 440 -1250 440 -1190 {lab=vref3}
N 440 -1020 480 -1020 {lab=vref2}
N 440 -1060 440 -1020 {lab=vref2}
N 440 -870 480 -870 {lab=vref1}
N 440 -920 440 -870 {lab=vref1}
N 440 -740 480 -740 {lab=vref0}
N 440 -780 440 -740 {lab=vref0}
N 440 -1020 440 -980 {lab=vref2}
N 2060 -1600 2120 -1600 {lab=VDD3_3}
N 2060 -1600 2060 -1540 {lab=VDD3_3}
N 2040 -1450 2050 -1450 {lab=VSS}
N 2100 -1250 2150 -1250 {lab=q1}
N 2050 -1360 2050 -1300 {lab=VDD1_5}
N 2060 -1210 2060 -1190 {lab=VSS}
N 1980 -1240 2010 -1240 {lab=vin}
N 1990 -1260 2010 -1260 {lab=vref1}
N 2070 -1340 2130 -1340 {lab=VDD3_3}
N 2070 -1340 2070 -1280 {lab=VDD3_3}
N 2050 -1190 2060 -1190 {lab=VSS}
N 2110 -980 2160 -980 {lab=q2}
N 2060 -1090 2060 -1030 {lab=VDD1_5}
N 2070 -940 2070 -920 {lab=VSS}
N 1990 -970 2020 -970 {lab=vin}
N 2000 -990 2020 -990 {lab=vref2}
N 2080 -1070 2140 -1070 {lab=VDD3_3}
N 2080 -1070 2080 -1010 {lab=VDD3_3}
N 2060 -920 2070 -920 {lab=VSS}
N 2120 -720 2170 -720 {lab=q3}
N 2070 -830 2070 -770 {lab=VDD1_5}
N 2080 -680 2080 -660 {lab=VSS}
N 2000 -710 2030 -710 {lab=vin}
N 2010 -730 2030 -730 {lab=vref3}
N 2090 -810 2150 -810 {lab=VDD3_3}
N 2090 -810 2090 -750 {lab=VDD3_3}
N 2070 -660 2080 -660 {lab=VSS}
C {title-3.sym} 0 0 0 0 {name=l1 author="Belal Elshinnawey" rev=1.0 lock=true}
C {devices/iopin.sym} 1230 -1490 0 0 {name=p4 lab=VDD3_3}
C {devices/iopin.sym} 1230 -1470 0 0 {name=p5 lab=VSS}
C {devices/iopin.sym} 1230 -1510 0 0 {name=p3 lab=VDD1_5}
C {devices/ipin.sym} 1280 -1530 0 0 {name=p1 lab=vin}
C {devices/opin.sym} 2140 -1510 0 0 {name=p9 lab=q0}
C {/home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/macros/ook_analog_system/schematic/xschem/simple_comparator.sym} 1970 -1510 0 0 {name=x2}
C {devices/lab_pin.sym} 2040 -1450 0 0 {name=l2 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 2040 -1620 2 0 {name=l7 sig_type=std_logic lab=VDD1_5}
C {devices/lab_pin.sym} 1970 -1500 0 0 {name=l10 sig_type=std_logic lab=vin
}
C {sg13cmos5l_pr/rhigh.sym} 440 -1280 0 0 {name=R1
w=2e-6
l=28.8e-6
model=rhigh
body=VSS
spiceprefix=X
b=0
 m=1
  mm_ok=1
value="expr_eng(  ( 1.6e-4 / @w + 1360.0 * ( (@b + 1)* @l + ( 1.081*( @w - 0.04e-6 ) + 0.18e-6 )*@b ) / ( @w - 0.04e-6 ) ) / @m  )"
}
C {lab_pin.sym} 440 -1340 1 0 {name=p8 sig_type=std_logic lab=VDD3_3}
C {devices/lab_pin.sym} 440 -600 3 0 {name=p32 sig_type=std_logic lab=VSS}
C {sg13cmos5l_pr/rhigh.sym} 440 -670 0 0 {name=R5
w=2e-6
l=12.9e-6
model=rhigh
body=VSS
spiceprefix=X
b=0
 m=1
  mm_ok=1
value="expr_eng(  ( 1.6e-4 / @w + 1360.0 * ( (@b + 1)* @l + ( 1.081*( @w - 0.04e-6 ) + 0.18e-6 )*@b ) / ( @w - 0.04e-6 ) ) / @m  )"
}
C {devices/ipin.sym} 480 -1190 2 0 {name=p7 lab=vref3}
C {devices/ipin.sym} 480 -1020 2 0 {name=p16 lab=vref2}
C {devices/ipin.sym} 480 -870 2 0 {name=p17 lab=vref1}
C {devices/ipin.sym} 480 -740 2 0 {name=p10 lab=vref0}
C {devices/lab_pin.sym} 1980 -1520 0 0 {name=l14 sig_type=std_logic lab=vref0}
C {devices/lab_pin.sym} 2120 -1600 2 0 {name=l17 sig_type=std_logic lab=VDD3_3}
C {devices/opin.sym} 2150 -1250 0 0 {name=p2 lab=q1}
C {/home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/macros/ook_analog_system/schematic/xschem/simple_comparator.sym} 1980 -1250 0 0 {name=x1}
C {devices/lab_pin.sym} 2050 -1190 0 0 {name=l3 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 2050 -1360 2 0 {name=l4 sig_type=std_logic lab=VDD1_5}
C {devices/lab_pin.sym} 1980 -1240 0 0 {name=l5 sig_type=std_logic lab=vin
}
C {devices/lab_pin.sym} 1990 -1260 0 0 {name=l6 sig_type=std_logic lab=vref1}
C {devices/lab_pin.sym} 2130 -1340 2 0 {name=l8 sig_type=std_logic lab=VDD3_3}
C {devices/opin.sym} 2160 -980 0 0 {name=p6 lab=q2}
C {/home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/macros/ook_analog_system/schematic/xschem/simple_comparator.sym} 1990 -980 0 0 {name=x3}
C {devices/lab_pin.sym} 2060 -920 0 0 {name=l9 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 2060 -1090 2 0 {name=l11 sig_type=std_logic lab=VDD1_5}
C {devices/lab_pin.sym} 1990 -970 0 0 {name=l12 sig_type=std_logic lab=vin
}
C {devices/lab_pin.sym} 2000 -990 0 0 {name=l13 sig_type=std_logic lab=vref2}
C {devices/lab_pin.sym} 2140 -1070 2 0 {name=l15 sig_type=std_logic lab=VDD3_3}
C {devices/opin.sym} 2170 -720 0 0 {name=p11 lab=q3}
C {/home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/macros/ook_analog_system/schematic/xschem/simple_comparator.sym} 2000 -720 0 0 {name=x4}
C {devices/lab_pin.sym} 2070 -660 0 0 {name=l16 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 2070 -830 2 0 {name=l18 sig_type=std_logic lab=VDD1_5}
C {devices/lab_pin.sym} 2000 -710 0 0 {name=l19 sig_type=std_logic lab=vin
}
C {devices/lab_pin.sym} 2010 -730 0 0 {name=l20 sig_type=std_logic lab=vref3}
C {devices/lab_pin.sym} 2150 -810 2 0 {name=l21 sig_type=std_logic lab=VDD3_3}
C {sg13cmos5l_pr/rhigh.sym} 440 -810 0 0 {name=R4
w=2e-6
l=2.8e-6
model=rhigh
body=VSS
spiceprefix=X
b=0
 m=1
  mm_ok=1
value="expr_eng(  ( 1.6e-4 / @w + 1360.0 * ( (@b + 1)* @l + ( 1.081*( @w - 0.04e-6 ) + 0.18e-6 )*@b ) / ( @w - 0.04e-6 ) ) / @m  )"
}
C {sg13cmos5l_pr/rhigh.sym} 440 -950 0 0 {name=R3
w=2e-6
l=1.4e-6
model=rhigh
body=VSS
spiceprefix=X
b=0
 m=1
  mm_ok=1
value="expr_eng(  ( 1.6e-4 / @w + 1360.0 * ( (@b + 1)* @l + ( 1.081*( @w - 0.04e-6 ) + 0.18e-6 )*@b ) / ( @w - 0.04e-6 ) ) / @m  )"
}
C {sg13cmos5l_pr/rhigh.sym} 440 -1090 0 0 {name=R2
w=2e-6
l=1.4e-6
model=rhigh
body=VSS
spiceprefix=X
b=0
 m=1
  mm_ok=1
value="expr_eng(  ( 1.6e-4 / @w + 1360.0 * ( (@b + 1)* @l + ( 1.081*( @w - 0.04e-6 ) + 0.18e-6 )*@b ) / ( @w - 0.04e-6 ) ) / @m  )"
}
