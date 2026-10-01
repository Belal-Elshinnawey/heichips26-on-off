v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 360 -770 360 -740 {lab=VGND}
N 360 -1170 360 -1130 {lab=VPWR}
N 1500 -530 1500 -500 {lab=VGND}
N 1530 -1170 1530 -1150 {lab=VPWR}
N 1460 -1170 1460 -1150 {lab=VAPWR}
N 1650 -910 1670 -910 {lab=analog_0}
N 1650 -1030 1670 -1030 {lab=analog_1}
N 1650 -1050 1670 -1050 {lab=analog_2}
N 690 -1190 690 -1130 {lab=VPWR}
N 690 -770 690 -750 {lab=VGND}
N 850 -1020 900 -1020 {lab=q3}
N 850 -1000 900 -1000 {lab=q2}
N 850 -980 900 -980 {lab=q1}
N 850 -960 900 -960 {lab=q0}
N 1300 -1010 1350 -1010 {lab=q3}
N 1300 -1030 1350 -1030 {lab=q2}
N 1300 -1050 1350 -1050 {lab=q1}
N 1300 -1070 1350 -1070 {lab=q0}
N 850 -940 900 -940 {lab=rst_n}
N 1320 -890 1350 -890 {lab=rst_n}
N 1320 -910 1350 -910 {lab=clk_ref}
N 850 -920 900 -920 {lab=clk_ref}
N 850 -900 900 -900 {lab=vctrl_in}
N 850 -880 900 -880 {lab=vctrl_b_in}
N 1320 -970 1350 -970 {lab=vctrl_b_in}
N 1320 -950 1350 -950 {lab=vctrl_in}
N 440 -1020 530 -1020 {lab=in_tieon}
N 440 -1000 530 -1000 {lab=q0_d}
N 440 -980 530 -980 {lab=q1_d}
N 440 -960 530 -960 {lab=q2_d}
N 440 -940 530 -940 {lab=q3_d}
N 440 -920 530 -920 {lab=in_tieoff}
N 440 -900 530 -900 {lab=data_in_tx}
N 440 -880 530 -880 {lab=clk}
N 440 -860 530 -860 {lab=rst_n_in}
C {title-3.sym} 0 0 0 0 {name=l1 author="Belal ELshinnawey" rev=1.0 lock=true}
C {devices/iopin.sym} 360 -1170 3 0 {name=p9 lab=VPWR}
C {devices/lab_pin.sym} 1530 -1170 1 0 {name=lp12 sig_type=std_logic lab=VPWR
}
C {devices/iopin.sym} 360 -740 1 0 {name=p12 lab=VGND}
C {devices/lab_pin.sym} 1500 -500 3 0 {name=lp15 sig_type=std_logic lab=VGND}
C {devices/iopin.sym} 1460 -1170 3 0 {name=pvout8 lab=VAPWR}
C {devices/iopin.sym} 1670 -1050 0 0 {name=pvout1 lab=analog_2}
C {devices/iopin.sym} 1670 -1030 0 0 {name=pvout2 lab=analog_1}
C {devices/iopin.sym} 1670 -910 0 0 {name=pvout3 lab=analog_0}
C {ook_analog_system.sym} 1500 -840 0 0 {name=x2}
C {devices/lab_pin.sym} 690 -1190 0 0 {name=lpx1vpwr sig_type=std_logic lab=VPWR}
C {devices/lab_pin.sym} 690 -750 0 0 {name=lpx1vgnd sig_type=std_logic lab=VGND}
C {devices/lab_pin.sym} 900 -1020 0 1 {name=lpx1 sig_type=std_logic lab=q3}
C {devices/lab_pin.sym} 900 -1000 0 1 {name=lpx2 sig_type=std_logic lab=q2}
C {devices/lab_pin.sym} 900 -980 0 1 {name=lpx3 sig_type=std_logic lab=q1}
C {devices/lab_pin.sym} 900 -960 0 1 {name=lpx4 sig_type=std_logic lab=q0}
C {devices/lab_pin.sym} 1300 -1010 2 1 {name=lpx5 sig_type=std_logic lab=q3}
C {devices/lab_pin.sym} 1300 -1030 2 1 {name=lpx6 sig_type=std_logic lab=q2}
C {devices/lab_pin.sym} 1300 -1050 2 1 {name=lpx7 sig_type=std_logic lab=q1}
C {devices/lab_pin.sym} 1300 -1070 2 1 {name=lpx8 sig_type=std_logic lab=q0}
C {devices/lab_pin.sym} 1320 -890 2 1 {name=lpx10 sig_type=std_logic lab=rst_n}
C {devices/lab_pin.sym} 1320 -910 2 1 {name=lpx11 sig_type=std_logic lab=clk_ref}
C {devices/lab_pin.sym} 1320 -950 0 0 {name=lpx15 sig_type=std_logic lab=vctrl_in}
C {devices/lab_pin.sym} 1320 -970 0 0 {name=lpx16 sig_type=std_logic lab=vctrl_b_in
}
C {devices/iopin.sym} 1180 -1220 1 0 {name=p1 lab=q0}
C {devices/iopin.sym} 1200 -1220 1 0 {name=p2 lab=q1}
C {devices/iopin.sym} 1220 -1220 1 0 {name=p3 lab=q2}
C {devices/iopin.sym} 1240 -1220 1 0 {name=p4 lab=q3}
C {devices/iopin.sym} 1260 -1220 1 0 {name=p5 lab=vctrl_in}
C {devices/iopin.sym} 1280 -1220 1 0 {name=p6 lab=vctrl_b_in}
C {devices/iopin.sym} 1160 -1220 1 0 {name=p7 lab=rst_n}
C {devices/iopin.sym} 1140 -1220 1 0 {name=p8 lab=clk_ref}
C {devices/lab_pin.sym} 900 -880 2 0 {name=lpx14 sig_type=std_logic lab=vctrl_b_in
}
C {devices/lab_pin.sym} 900 -900 2 0 {name=lpx17 sig_type=std_logic lab=vctrl_in}
C {devices/lab_pin.sym} 900 -920 0 1 {name=lpx13 sig_type=std_logic lab=clk_ref}
C {devices/lab_pin.sym} 900 -940 0 1 {name=lpx9 sig_type=std_logic lab=rst_n}
C {ook_digital_system.sym} 690 -950 0 0 {name=x1}
C {opin.sym} 440 -1020 2 0 {name=p19 lab=in_tieon}
C {opin.sym} 440 -1000 2 0 {name=p14 lab=q0_d}
C {opin.sym} 440 -980 2 0 {name=p13 lab=q1_d}
C {opin.sym} 440 -960 2 0 {name=p10 lab=q2_d}
C {opin.sym} 440 -940 2 0 {name=p11 lab=q3_d}
C {opin.sym} 440 -920 2 0 {name=p18 lab=in_tieoff}
C {ipin.sym} 440 -900 0 0 {name=p17 lab=data_in_tx}
C {ipin.sym} 440 -880 0 0 {name=p16 lab=clk}
C {ipin.sym} 440 -860 0 0 {name=p15 lab=rst_n_in}
