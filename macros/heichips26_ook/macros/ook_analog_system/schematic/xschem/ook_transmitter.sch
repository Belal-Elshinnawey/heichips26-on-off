v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
T {System Clock is 80MHz.
To produce ref clock,
divide system clock by 2.95 in HDL.} 410 -1100 0 0 0.4 0.4 {}
T {Data in is 6us per symbol. 
a full on+off code is 12us.} 1670 -910 0 0 0.4 0.4 {}
N 1680 -950 1770 -950 {lab=vout}
N 1490 -980 1570 -980 {lab=#net1}
N 1000 -970 1050 -970 {lab=UP}
N 1000 -950 1050 -950 {lab=DN}
N 1170 -960 1250 -960 {lab=vosc}
N 810 -740 1250 -740 {lab=#net2}
N 810 -950 810 -740 {lab=#net2}
N 810 -950 860 -950 {lab=#net2}
N 1610 -900 1610 -740 {lab=#net3}
N 1370 -740 1610 -740 {lab=#net3}
N 1520 -880 1530 -880 {lab=data_in_n}
N 1530 -920 1530 -880 {lab=data_in_n}
N 1530 -920 1570 -920 {lab=data_in_n}
N 930 -900 930 -870 {lab=VSS}
N 930 -1090 930 -1020 {lab=VDD}
N 1080 -910 1080 -890 {lab=VSS}
N 810 -970 860 -970 {lab=clk_27_12MHz}
N 1110 -1040 1110 -1010 {lab=VDD}
N 1370 -1070 1370 -1040 {lab=VDD}
N 1370 -920 1370 -900 {lab=VSS}
N 1650 -920 1650 -900 {lab=VSS}
N 1620 -1030 1620 -1000 {lab=VDD}
N 1310 -820 1310 -790 {lab=VDD}
N 1310 -690 1310 -670 {lab=VSS}
N 1520 -950 1520 -900 {lab=data_in_p}
N 1520 -950 1570 -950 {lab=data_in_p}
N 1120 -910 1120 -870 {lab=cp_cap_p}
N 1140 -910 1140 -870 {lab=cp_cap_m}
C {title-3.sym} 0 0 0 0 {name=l1 author="Belal ELshinnawey" rev=1.0 lock=true}
C {devices/iopin.sym} 930 -1090 3 0 {name=p1 lab=VDD}
C {devices/iopin.sym} 930 -870 1 0 {name=p5 lab=VSS}
C {devices/lab_pin.sym} 1080 -890 3 0 {name=lp16 sig_type=std_logic lab=VSS}
C {ipin.sym} 1520 -880 0 0 {name=p4 lab=data_in_n}
C {pfd.sym} 930 -960 0 0 {name=x1}
C {charge_pump.sym} 1110 -960 0 0 {name=x2}
C {vco.sym} 1360 -980 0 0 {name=x3}
C {output_buffer.sym} 1620 -830 0 0 {name=x4}
C {ipin.sym} 810 -970 0 0 {name=p2 lab=clk_27_12MHz}
C {devices/lab_pin.sym} 1110 -1040 1 0 {name=lp1 sig_type=std_logic lab=VDD
}
C {devices/lab_pin.sym} 1370 -1070 1 0 {name=lp2 sig_type=std_logic lab=VDD
}
C {devices/lab_pin.sym} 1370 -900 3 0 {name=lp3 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1650 -900 3 0 {name=lp4 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1620 -1030 1 0 {name=lp5 sig_type=std_logic lab=VDD
}
C {devices/lab_pin.sym} 1310 -820 1 0 {name=lp6 sig_type=std_logic lab=VDD
}
C {devices/lab_pin.sym} 1310 -670 3 0 {name=lp7 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1020 -970 1 0 {name=lp8 sig_type=std_logic lab=UP
}
C {devices/lab_pin.sym} 1020 -950 3 0 {name=lp9 sig_type=std_logic lab=DN
}
C {devices/lab_pin.sym} 1210 -960 3 0 {name=lp10 sig_type=std_logic lab=vosc
}
C {devices/iopin.sym} 1770 -950 0 0 {name=p3 lab=vout}
C {clock_divider.sym} 1310 -740 0 1 {name=x5}
C {ipin.sym} 1520 -900 0 0 {name=p6 lab=data_in_p}
C {devices/iopin.sym} 1120 -870 1 0 {name=p7 lab=cp_cap_p}
C {devices/iopin.sym} 1140 -870 1 0 {name=p8 lab=cp_cap_m}
