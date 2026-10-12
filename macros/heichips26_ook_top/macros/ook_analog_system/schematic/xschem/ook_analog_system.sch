v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 1650 -740 1650 -700 {lab=VGND}
N 1810 -830 1880 -830 {lab=tx_out}
N 1650 -930 1650 -890 {lab=VPWR}
N 1750 -740 1750 -710 {lab=clk_ref}
N 1770 -740 1770 -710 {lab=rst_ni}
N 1490 -800 1520 -800 {lab=vctrl_in}
N 1490 -780 1520 -780 {lab=vctrl_b_in}
N 1810 -770 1850 -770 {lab=vctrl_out}
N 1810 -790 1850 -790 {lab=vctrl_b_out}
N 1560 -940 1560 -900 {lab=vcl}
N 1580 -740 1580 -710 {lab=dac_out}
N 1560 -740 1560 -710 {lab=clk_fb}
N 880 -640 880 -610 {lab=VGND}
N 890 -1050 890 -1030 {lab=VPWR}
N 1040 -860 1060 -860 {lab=q3}
N 1040 -840 1060 -840 {lab=q2}
N 1040 -820 1060 -820 {lab=q1}
N 1040 -800 1060 -800 {lab=q0}
N 1040 -770 1060 -770 {lab=ACC_CAP}
N 670 -830 750 -830 {lab=rx_in}
N 870 -1050 870 -1030 {lab=VAPWR}
N 700 -760 730 -760 {lab=Cap_M2}
N 700 -750 730 -750 {lab=Cap_M1}
N 700 -720 730 -720 {lab=vref0}
N 700 -710 730 -710 {lab=vref1}
N 700 -700 730 -700 {lab=vref2}
N 700 -690 730 -690 {lab=vref3}
N 700 -670 730 -670 {lab=lnaf}
C {title-3.sym} 0 0 0 0 {name=l1 author="Belal ELshinnawey" rev=1.0 lock=true}
C {devices/iopin.sym} 1880 -830 0 0 {name=pvout1 lab=tx_out}
C {devices/iopin.sym} 1650 -930 3 0 {name=p9 lab=VPWR}
C {devices/lab_pin.sym} 890 -1050 1 0 {name=lp12 sig_type=std_logic lab=VPWR
}
C {devices/iopin.sym} 1650 -700 1 0 {name=p12 lab=VGND}
C {devices/lab_pin.sym} 880 -610 3 0 {name=lp15 sig_type=std_logic lab=VGND}
C {devices/iopin.sym} 1560 -940 3 0 {name=p15 lab=vcl}
C {devices/iopin.sym} 1580 -710 1 0 {name=p1 lab=dac_out}
C {devices/iopin.sym} 1560 -710 1 0 {name=p4 lab=clk_fb}
C {devices/iopin.sym} 1750 -710 1 0 {name=p5 lab=clk_ref}
C {devices/iopin.sym} 1770 -710 1 0 {name=p6 lab=rst_ni}
C {devices/iopin.sym} 1490 -800 2 0 {name=p7 lab=vctrl_in}
C {devices/iopin.sym} 1490 -780 2 0 {name=p8 lab=vctrl_b_in}
C {devices/iopin.sym} 1850 -770 0 0 {name=p2 lab=vctrl_out}
C {devices/iopin.sym} 1850 -790 0 0 {name=p3 lab=vctrl_b_out}
C {devices/iopin.sym} 1060 -800 0 0 {name=pvout2 lab=q0}
C {devices/iopin.sym} 1060 -820 0 0 {name=pvout3 lab=q1}
C {devices/iopin.sym} 1060 -840 0 0 {name=pvout4 lab=q2}
C {devices/iopin.sym} 1060 -860 0 0 {name=pvout5 lab=q3}
C {devices/iopin.sym} 1060 -770 0 0 {name=pvout6 lab=ACC_CAP}
C {devices/iopin.sym} 670 -830 2 0 {name=pvout7 lab=rx_in}
C {devices/iopin.sym} 870 -1050 3 0 {name=pvout8 lab=VAPWR}
C {devices/iopin.sym} 700 -760 2 0 {name=pvout9 lab=Cap_M2}
C {devices/iopin.sym} 700 -750 2 0 {name=pvout10 lab=Cap_M1}
C {devices/iopin.sym} 700 -720 2 0 {name=pvout13 lab=vref0}
C {devices/iopin.sym} 700 -710 2 0 {name=pvout14 lab=vref1}
C {devices/iopin.sym} 700 -690 2 0 {name=pvout15 lab=vref3}
C {devices/iopin.sym} 700 -700 2 0 {name=pvout16 lab=vref2}
C {devices/iopin.sym} 700 -670 2 0 {name=pvout18 lab=lnaf}
C {ook_transmitter.sym} 1660 -830 0 0 {name=x1}
C {ook_receiver.sym} 880 -800 0 0 {name=x2}
