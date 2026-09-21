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
N 2240 -1470 2240 -1460 {lab=clk_h}
N 2280 -1490 2280 -1470 {lab=VSS}
N 2240 -1010 2240 -1000 {lab=clk_h}
N 2280 -790 2280 -780 {lab=VSS}
N 130 -640 130 -610 {lab=vref_2}
N 130 -960 130 -890 {lab=vref_4}
N 130 -510 130 -470 {lab=vref_1}
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
N 130 -510 170 -510 {lab=vref_1}
N 130 -550 130 -510 {lab=vref_1}
N 130 -790 130 -750 {lab=vref_3}
N 1940 -1530 2200 -1530 {lab=vin}
N 1940 -1300 2200 -1300 {lab=vin}
N 1940 -1070 2200 -1070 {lab=vin}
N 1940 -830 2200 -830 {lab=vin}
N 830 -1340 880 -1340 {lab=vin}
N 1740 -390 1830 -390 {lab=clk_h}
C {title-3.sym} 0 0 0 0 {name=l1 author="Belal Elshinnawey" rev=1.0 lock=true}
C {devices/iopin.sym} 2240 -1600 3 0 {name=p11 lab=VDD}
C {devices/iopin.sym} 2280 -1600 1 1 {name=p7 lab=VDDL}
C {devices/iopin.sym} 2340 -820 0 0 {name=p6 lab=q0}
C {devices/iopin.sym} 2280 -1470 1 0 {name=p1 lab=VSS}
C {devices/ipin.sym} 1740 -390 0 0 {name=p2 lab=clk_h}
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
C {lab_pin.sym} 2240 -880 1 0 {name=p27 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 2240 -1120 1 0 {name=p28 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 2240 -1350 1 0 {name=p30 sig_type=std_logic lab=VDD}
C {devices/iopin.sym} 2340 -1060 0 0 {name=p4 lab=q1}
C {devices/iopin.sym} 2340 -1290 0 0 {name=p5 lab=q2}
C {devices/iopin.sym} 2380 -1520 0 0 {name=p13 lab=q3}
C {devices/ipin.sym} 830 -1340 0 0 {name=p10 lab=vin}
C {devices/lab_pin.sym} 2160 -1510 2 1 {name=l28 sig_type=std_logic lab=vref_4}
C {devices/lab_pin.sym} 2160 -1280 2 1 {name=l29 sig_type=std_logic lab=vref_3}
C {devices/lab_pin.sym} 2160 -1050 2 1 {name=l30 sig_type=std_logic lab=vref_2}
C {devices/lab_pin.sym} 2160 -810 2 1 {name=l31 sig_type=std_logic lab=vref_1}
C {devices/lab_pin.sym} 1940 -1530 2 1 {name=l5 sig_type=std_logic lab=vin}
C {devices/lab_pin.sym} 1940 -1300 2 1 {name=l2 sig_type=std_logic lab=vin}
C {devices/lab_pin.sym} 1940 -1070 2 1 {name=l4 sig_type=std_logic lab=vin}
C {devices/lab_pin.sym} 1940 -830 2 1 {name=l6 sig_type=std_logic lab=vin}
C {clocked_comparator.sym} 2250 -820 0 0 {name=x1}
C {clocked_comparator.sym} 2250 -1060 0 0 {name=x2}
C {clocked_comparator.sym} 2250 -1290 0 0 {name=x3}
C {clocked_comparator.sym} 2250 -1520 0 0 {name=x4}
C {devices/iopin.sym} 170 -960 0 0 {name=p15 lab=vref_4}
C {devices/iopin.sym} 170 -790 0 0 {name=p16 lab=vref_3}
C {devices/iopin.sym} 170 -640 0 0 {name=p17 lab=vref_2}
C {devices/iopin.sym} 170 -510 0 0 {name=p18 lab=vref_1}
