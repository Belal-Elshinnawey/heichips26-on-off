v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 1530 -840 1710 -840 {lab=#net1}
N 1410 -780 1410 -740 {lab=VGND}
N 1750 -760 1750 -590 {lab=clk_fb}
N 1820 -810 1890 -810 {lab=vout}
N 1760 -910 1760 -860 {lab=VPWR}
N 1790 -780 1790 -750 {lab=VGND}
N 1070 -820 1080 -820 {lab=dac_out}
N 930 -900 930 -890 {lab=VPWR}
N 1180 -820 1180 -790 {lab=vcl}
N 1180 -730 1180 -710 {lab=VGND}
N 1410 -940 1410 -900 {lab=VPWR}
N 630 -660 630 -590 {lab=clk_fb}
N 1180 -880 1180 -820 {lab=vcl}
N 1140 -820 1180 -820 {lab=vcl}
N 930 -680 930 -650 {lab=VGND}
N 630 -590 1750 -590 {lab=clk_fb}
N 1020 -780 1060 -780 {lab=vctrl_out}
N 1060 -780 1060 -660 {lab=vctrl_out}
N 1060 -660 1570 -660 {lab=vctrl_out}
N 1570 -810 1710 -810 {lab=vctrl_out}
N 1020 -740 1030 -740 {lab=vctrl_b_out}
N 1030 -740 1030 -630 {lab=vctrl_b_out}
N 1030 -630 1590 -630 {lab=vctrl_b_out}
N 1590 -780 1590 -630 {lab=vctrl_b_out}
N 1070 -880 1070 -820 {lab=dac_out}
N 1590 -780 1710 -780 {lab=vctrl_b_out}
N 1570 -810 1570 -660 {lab=vctrl_out}
N 590 -660 630 -660 {lab=clk_fb}
N 630 -820 630 -660 {lab=clk_fb}
N 1180 -820 1200 -820 {lab=vcl}
N 1260 -820 1290 -820 {lab=#net2}
N 810 -850 840 -850 {lab=clk_ref}
N 810 -790 840 -790 {lab=rst_ni}
N 810 -760 840 -760 {lab=vctrl_in}
N 810 -720 840 -720 {lab=vctrl_b_in}
N 1020 -820 1070 -820 {lab=dac_out}
N 630 -820 840 -820 {lab=clk_fb}
C {title-3.sym} 0 0 0 0 {name=l1 author="Belal ELshinnawey" rev=1.0 lock=true}
C {devices/iopin.sym} 1890 -810 0 0 {name=pvout1 lab=vout}
C {devices/iopin.sym} 1410 -940 3 0 {name=p9 lab=VPWR}
C {devices/lab_pin.sym} 930 -900 1 0 {name=lp11 sig_type=std_logic lab=VPWR
}
C {devices/lab_pin.sym} 1760 -900 1 0 {name=lp12 sig_type=std_logic lab=VPWR
}
C {devices/iopin.sym} 1410 -740 1 0 {name=p12 lab=VGND}
C {devices/lab_pin.sym} 930 -650 3 0 {name=lp13 sig_type=std_logic lab=VGND}
C {devices/lab_pin.sym} 1180 -710 3 0 {name=lp14 sig_type=std_logic lab=VGND}
C {devices/lab_pin.sym} 1790 -750 3 0 {name=lp15 sig_type=std_logic lab=VGND}
C {devices/iopin.sym} 1180 -880 3 0 {name=p15 lab=vcl}
C {sg13cmos5l_pr/cap_mfringe.sym} 1180 -760 0 0 {name=C1
model=cap_mfringe
w=128.0u
l=42.0u
mmin=1
mmax=4
spiceprefix=X
spice_ignore=true}
C {/home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/macros/ook_analog_system/schematic/xschem/rhigh_ps.sym} 1110 -820 1 0 {name=R1
w=1e-6
l=61.395e-6
model=rhigh
body=VGND
spiceprefix=X
b=2
 m=1
  mm_ok=1
value="expr_eng(  ( 1.6e-4 / @w + 1360.0 * ( (@b + 1)* @l + ( 1.081*( @w - 0.04e-6 ) + 0.18e-6 )*@b ) / ( @w - 0.04e-6 ) ) / @m  )"
}
C {devices/iopin.sym} 1070 -880 3 0 {name=p1 lab=dac_out}
C {devices/iopin.sym} 590 -660 2 0 {name=p4 lab=clk_fb}
C {/home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/macros/ook_analog_system/schematic/xschem/vco.sym} 1400 -840 0 0 {name=x1}
C {/home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/macros/ook_analog_system/schematic/xschem/output_buffer.sym} 1760 -690 0 0 {name=x2}
C {sg13cmos5l_pr/rsil.sym} 1230 -820 1 1 {name=R2
w=0.5e-6
l=0.5e-6
model=rsil
body=VGND
spiceprefix=X
 m=1
  mm_ok=1
value="expr_eng(  ( 9.0e-6 / @w + 7.0 * ( @l ) / ( @w + 1.0e-8 ) ) / @m  )"
}
C {/home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/macros/dac/schematic/xschem/dac.sym} 930 -770 0 0 {name=x7}
C {devices/iopin.sym} 810 -850 2 0 {name=p5 lab=clk_ref}
C {devices/iopin.sym} 810 -790 2 0 {name=p6 lab=rst_ni}
C {devices/iopin.sym} 810 -760 2 0 {name=p7 lab=vctrl_in}
C {devices/iopin.sym} 810 -720 2 0 {name=p8 lab=vctrl_b_in}
C {devices/iopin.sym} 1570 -720 2 0 {name=p2 lab=vctrl_out}
C {devices/iopin.sym} 1590 -720 0 0 {name=p3 lab=vctrl_b_out}
