v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 2240 -1600 2240 -1570 {lab=VDD}
N 2280 -1600 2280 -1550 {lab=VDDL}
N 2320 -1520 2380 -1520 {lab=q3}
N 2240 -880 2240 -870 {lab=VDD}
N 2280 -860 2280 -850 {lab=VDDL}
N 2240 -770 2240 -760 {lab=clk_h}
N 2320 -820 2340 -820 {lab=q0}
N 2280 -1030 2280 -1020 {lab=VSS}
N 2240 -1120 2240 -1110 {lab=VDD}
N 2280 -1100 2280 -1090 {lab=VDDL}
N 2320 -1060 2340 -1060 {lab=q1}
N 2280 -1260 2280 -1250 {lab=VSS}
N 2240 -1350 2240 -1340 {lab=VDD}
N 2280 -1330 2280 -1320 {lab=VDDL}
N 2240 -1240 2240 -1230 {lab=clk_h}
N 2320 -1290 2340 -1290 {lab=q2}
N 2250 -390 2300 -390 {lab=clk_h}
N 2090 -500 2090 -470 {lab=VDD}
N 2010 -500 2010 -470 {lab=VDDL}
N 2240 -1470 2240 -1460 {lab=clk_h}
N 2280 -1490 2280 -1470 {lab=VSS}
N 2240 -1010 2240 -1000 {lab=clk_h}
N 2280 -790 2280 -780 {lab=VSS}
N 2050 -310 2050 -280 {lab=VSS}
N 1890 -390 1970 -390 {lab=#net1}
N 130 -1110 130 -1080 {lab=VDD}
N 130 -410 130 -370 {lab=VSS}
N 130 -640 130 -610 {lab=vref_2}
N 130 -960 130 -890 {lab=vref_4}
N 130 -510 130 -470 {lab=vref_4}
N 2160 -1510 2200 -1510 {lab=vref_4}
N 2160 -1280 2200 -1280 {lab=vref_3}
N 2160 -1050 2200 -1050 {lab=vref_2}
N 2160 -810 2200 -810 {lab=vref_1}
N 130 -960 170 -960 {lab=vref_4}
N 130 -1020 130 -960 {lab=vref_4}
N 130 -790 170 -790 {lab=vref_3}
N 130 -830 130 -790 {lab=vref_3}
N 130 -640 170 -640 {lab=vref_2}
N 130 -690 130 -640 {lab=vref_2}
N 130 -510 170 -510 {lab=vref_4}
N 130 -550 130 -510 {lab=vref_4}
N 130 -790 130 -750 {lab=vref_3}
N 1940 -1530 2200 -1530 {lab=vin}
N 1940 -1300 2200 -1300 {lab=vin}
N 1940 -1070 2200 -1070 {lab=vin}
N 1940 -830 2200 -830 {lab=vin}
N 2130 -390 2190 -390 {lab=#net2}
N 830 -1340 880 -1340 {lab=vin}
N 1740 -390 1830 -390 {lab=clk}
C {title-3.sym} 0 0 0 0 {name=l1 author="Belal Elshinnawey" rev=1.0 lock=true}
C {devices/iopin.sym} 2240 -1600 3 0 {name=p11 lab=VDD}
C {devices/iopin.sym} 2280 -1600 1 1 {name=p7 lab=VDDL}
C {devices/iopin.sym} 2340 -820 0 0 {name=p6 lab=q0}
C {devices/iopin.sym} 2280 -1470 1 0 {name=p1 lab=VSS}
C {devices/ipin.sym} 1740 -390 0 0 {name=p2 lab=clk}
C {lab_pin.sym} 2010 -500 1 0 {name=p29 sig_type=std_logic lab=VDDL}
C {devices/lab_pin.sym} 2240 -1460 3 0 {name=p9 sig_type=std_logic lab=clk_h}
C {devices/lab_pin.sym} 2240 -1000 3 0 {name=p12 sig_type=std_logic lab=clk_h}
C {devices/lab_pin.sym} 2240 -1230 3 0 {name=p14 sig_type=std_logic lab=clk_h}
C {devices/lab_pin.sym} 2300 -390 2 0 {name=p20 sig_type=std_logic lab=clk_h}
C {devices/lab_pin.sym} 2240 -760 3 0 {name=p3 sig_type=std_logic lab=clk_h}
C {devices/lab_pin.sym} 2280 -780 3 0 {name=p19 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 2280 -1250 3 0 {name=p21 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 2280 -1020 3 0 {name=p22 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 2280 -860 1 0 {name=p23 sig_type=std_logic lab=VDDL}
C {lab_pin.sym} 2280 -1100 1 0 {name=p24 sig_type=std_logic lab=VDDL}
C {lab_pin.sym} 2280 -1330 1 0 {name=p25 sig_type=std_logic lab=VDDL}
C {lab_pin.sym} 2090 -500 1 0 {name=p26 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 2240 -880 1 0 {name=p27 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 2240 -1120 1 0 {name=p28 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 2240 -1350 1 0 {name=p30 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 2050 -280 3 0 {name=p31 sig_type=std_logic lab=VSS}
C {devices/iopin.sym} 2340 -1060 0 0 {name=p4 lab=q1}
C {devices/iopin.sym} 2340 -1290 0 0 {name=p5 lab=q2}
C {devices/iopin.sym} 2380 -1520 0 0 {name=p13 lab=q3}
C {devices/ipin.sym} 830 -1340 0 0 {name=p10 lab=vin}
C {sg13cmos5l_pr/rhigh.sym} 130 -1050 0 0 {name=R1
w=2e-6
l=4.2e-5
model=rhigh
body=VSS
spiceprefix=X
b=0
 m=1
  mm_ok=1
value="expr_eng(  ( 1.6e-4 / @w + 1360.0 * ( (@b + 1)* @l + ( 1.081*( @w - 0.04e-6 ) + 0.18e-6 )*@b ) / ( @w - 0.04e-6 ) ) / @m  )"
}
C {lab_pin.sym} 130 -1110 1 0 {name=p8 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 130 -370 3 0 {name=p32 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 2160 -1510 2 1 {name=l28 sig_type=std_logic lab=vref_4}
C {devices/lab_pin.sym} 2160 -1280 2 1 {name=l29 sig_type=std_logic lab=vref_3}
C {devices/lab_pin.sym} 2160 -1050 2 1 {name=l30 sig_type=std_logic lab=vref_2}
C {devices/lab_pin.sym} 2160 -810 2 1 {name=l31 sig_type=std_logic lab=vref_1}
C {sg13cmos5l_pr/rppd.sym} 130 -860 0 0 {name=R2
w=2e-6
l=2.0e-6
model=rppd
body=VSS
spiceprefix=X
b=0
 m=1
  mm_ok=1
value="expr_eng(  ( 70.0e-6 / @w + 260.0 * ( (@b + 1)* @l + ( 1.081*( @w + 6.0e-9 ) + 0.18e-6 )*@b ) / ( @w + 6.0e-9 ) ) / @m  )"
}
C {sg13cmos5l_pr/rppd.sym} 130 -580 0 0 {name=R4
w=2e-6
l=3.6e-6
model=rppd
body=VSS
spiceprefix=X
b=0
 m=1
  mm_ok=1
value="expr_eng(  ( 70.0e-6 / @w + 260.0 * ( (@b + 1)* @l + ( 1.081*( @w + 6.0e-9 ) + 0.18e-6 )*@b ) / ( @w + 6.0e-9 ) ) / @m  )"
}
C {sg13cmos5l_pr/rppd.sym} 130 -720 0 0 {name=R3
w=2e-6
l=1.28e-6
model=rppd
body=VSS
spiceprefix=X
b=0
 m=1
  mm_ok=1
value="expr_eng(  ( 70.0e-6 / @w + 260.0 * ( (@b + 1)* @l + ( 1.081*( @w + 6.0e-9 ) + 0.18e-6 )*@b ) / ( @w + 6.0e-9 ) ) / @m  )"
}
C {devices/lab_pin.sym} 1940 -1530 2 1 {name=l5 sig_type=std_logic lab=vin}
C {devices/lab_pin.sym} 1940 -1300 2 1 {name=l2 sig_type=std_logic lab=vin}
C {devices/lab_pin.sym} 1940 -1070 2 1 {name=l4 sig_type=std_logic lab=vin}
C {devices/lab_pin.sym} 1940 -830 2 1 {name=l6 sig_type=std_logic lab=vin}
C {sg13cmos5l_pr/rppd.sym} 2220 -390 1 0 {name=R10
w=2e-6
l=10e-6
model=rppd
body=VSS
spiceprefix=X
b=0
 m=1
  mm_ok=1
value="expr_eng(  ( 70.0e-6 / @w + 260.0 * ( (@b + 1)* @l + ( 1.081*( @w + 6.0e-9 ) + 0.18e-6 )*@b ) / ( @w + 6.0e-9 ) ) / @m  )"
}
C {sg13cmos5l_pr/rppd.sym} 1860 -390 1 0 {name=R6
w=2e-6
l=10e-6
model=rppd
body=VSS
spiceprefix=X
b=0
 m=1
  mm_ok=1
value="expr_eng(  ( 70.0e-6 / @w + 260.0 * ( (@b + 1)* @l + ( 1.081*( @w + 6.0e-9 ) + 0.18e-6 )*@b ) / ( @w + 6.0e-9 ) ) / @m  )"
}
C {sg13cmos5l_pr/rhigh.sym} 130 -440 0 0 {name=R5
w=2e-6
l=3.49e-6
model=rhigh
body=VSS
spiceprefix=X
b=0
 m=1
  mm_ok=1
value="expr_eng(  ( 1.6e-4 / @w + 1360.0 * ( (@b + 1)* @l + ( 1.081*( @w - 0.04e-6 ) + 0.18e-6 )*@b ) / ( @w - 0.04e-6 ) ) / @m  )"
}
C {clocked_comparator.sym} 2250 -820 0 0 {name=x1}
C {clocked_comparator.sym} 2250 -1060 0 0 {name=x2}
C {clocked_comparator.sym} 2250 -1290 0 0 {name=x3}
C {clocked_comparator.sym} 2250 -1520 0 0 {name=x4}
C {level_up_shifter.sym} 2050 -390 0 0 {name=x5 W_P_HV=3.0u L_P_HV=0.50u W_N_HV=10.0u L_N_HV=0.50u W_P_LV=1.0u L_P_LV=0.13u W_N_LV=1.0u L_N_LV=0.13u}
C {devices/iopin.sym} 170 -960 0 0 {name=p15 lab=vref_4}
C {devices/iopin.sym} 170 -790 0 0 {name=p16 lab=vref_3}
C {devices/iopin.sym} 170 -640 0 0 {name=p17 lab=vref_2}
C {devices/iopin.sym} 170 -510 0 0 {name=p18 lab=vref_1}
