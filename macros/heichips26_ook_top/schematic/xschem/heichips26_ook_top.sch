v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 1840 -450 1840 -420 {lab=VGND}
N 1840 -880 1840 -840 {lab=VPWR}
N 1820 -860 1820 -840 {lab=VAPWR}
N 1990 -720 2060 -720 {lab=analog_1}
N 1990 -740 2060 -740 {lab=analog_2}
N 1580 -640 1670 -640 {lab=uo_out[0]}
N 1580 -660 1670 -660 {lab=uo_out[1]}
N 1580 -680 1670 -680 {lab=uo_out[2]}
N 1580 -700 1670 -700 {lab=uo_out[3]}
N 1990 -700 2060 -700 {lab=analog_0}
N 1600 -570 1670 -570 {lab=rst_n}
N 1600 -550 1670 -550 {lab=clk}
N 1600 -530 1670 -530 {lab=ui_in[0]}
N 200 -1690 230 -1690 {lab=uio_out[5]}
N 200 -1240 230 -1240 {lab=uio_out[2]}
N 200 -1390 230 -1390 {lab=uio_out[3]}
N 200 -1540 230 -1540 {lab=uio_out[4]}
N 290 -1690 330 -1690 {lab=tie_off}
N 290 -1540 330 -1540 {lab=tie_off}
N 290 -1390 330 -1390 {lab=tie_off}
N 290 -1240 330 -1240 {lab=tie_off}
N 200 -1080 230 -1080 {lab=uio_out[1]}
N 290 -1080 330 -1080 {lab=tie_off}
N 200 -940 230 -940 {lab=uio_out[0]}
N 290 -940 330 -940 {lab=tie_off}
N 210 -780 240 -780 {lab=uo_out[7]}
N 300 -780 340 -780 {lab=tie_off}
N 210 -610 240 -610 {lab=uo_out[6]}
N 300 -610 340 -610 {lab=tie_off}
N 210 -420 240 -420 {lab=uo_out[5]}
N 300 -420 340 -420 {lab=tie_off}
N 210 -240 240 -240 {lab=uo_out[4]}
N 300 -240 340 -240 {lab=tie_off}
N 1590 -510 1670 -510 {lab=tie_off}
N 560 -240 590 -240 {lab=uio_out[6]}
N 650 -240 690 -240 {lab=tie_off}
N 560 -420 590 -420 {lab=uio_out[7]}
N 650 -420 690 -420 {lab=tie_off}
N 560 -610 590 -610 {lab=uio_oe[0]}
N 650 -610 690 -610 {lab=tie_off}
N 560 -780 590 -780 {lab=uio_oe[1]}
N 650 -780 690 -780 {lab=tie_off}
N 560 -940 590 -940 {lab=uio_oe[2]}
N 650 -940 690 -940 {lab=tie_off}
N 560 -1080 590 -1080 {lab=uio_oe[3]}
N 650 -1080 690 -1080 {lab=tie_off}
N 560 -1240 590 -1240 {lab=uio_oe[4]}
N 650 -1240 690 -1240 {lab=tie_off}
N 560 -1390 590 -1390 {lab=uio_oe[5]}
N 650 -1390 690 -1390 {lab=tie_off}
N 560 -1540 590 -1540 {lab=uio_oe[6]}
N 650 -1540 690 -1540 {lab=tie_off}
N 560 -1690 590 -1690 {lab=uio_oe[7]}
N 650 -1690 690 -1690 {lab=tie_off}
C {title-3.sym} 0 0 0 0 {name=l1 author="Belal ELshinnawey" rev=1.0 lock=true}
C {devices/iopin.sym} 1840 -880 3 0 {name=p9 lab=VPWR}
C {devices/iopin.sym} 1840 -420 1 0 {name=p12 lab=VGND}
C {devices/iopin.sym} 1820 -860 3 0 {name=pvout8 lab=VAPWR}
C {devices/iopin.sym} 2060 -740 0 0 {name=pvout1 lab=analog_2}
C {devices/iopin.sym} 2060 -720 0 0 {name=pvout2 lab=analog_1}
C {devices/iopin.sym} 2060 -700 0 0 {name=pvout3 lab=analog_0}
C {opin.sym} 1580 -660 0 1 {name=p13 lab=uo_out[1]}
C {opin.sym} 1580 -680 0 1 {name=p10 lab=uo_out[2]}
C {opin.sym} 1580 -700 0 1 {name=p11 lab=uo_out[3]}
C {heichips26_ook_soc.sym} 1840 -730 0 0 {name=x1}
C {sg13cmos5l_pr/rsil.sym} 260 -1690 1 0 {name=R1
w=0.5e-6
l=0.5e-6
model=rsil
body=VGND
spiceprefix=X
 m=1
  mm_ok=1
value="expr_eng(  ( 9.0e-6 / @w + 7.0 * ( @l ) / ( @w + 1.0e-8 ) ) / @m  )"
}
C {ipin.sym} 1600 -570 0 0 {name=p1 lab=rst_n}
C {ipin.sym} 1600 -550 0 0 {name=p2 lab=clk}
C {ipin.sym} 1600 -530 0 0 {name=p3 lab=ui_in[0]}
C {opin.sym} 210 -240 2 0 {name=p4 lab=uo_out[4]}
C {opin.sym} 210 -420 2 0 {name=p5 lab=uo_out[5]}
C {opin.sym} 210 -610 2 0 {name=p6 lab=uo_out[6]}
C {opin.sym} 210 -780 2 0 {name=p7 lab=uo_out[7]}
C {sg13cmos5l_pr/rsil.sym} 260 -1540 1 0 {name=R2
w=0.5e-6
l=0.5e-6
model=rsil
body=VGND
spiceprefix=X
 m=1
  mm_ok=1
value="expr_eng(  ( 9.0e-6 / @w + 7.0 * ( @l ) / ( @w + 1.0e-8 ) ) / @m  )"
}
C {sg13cmos5l_pr/rsil.sym} 260 -1390 1 0 {name=R3
w=0.5e-6
l=0.5e-6
model=rsil
body=VGND
spiceprefix=X
 m=1
  mm_ok=1
value="expr_eng(  ( 9.0e-6 / @w + 7.0 * ( @l ) / ( @w + 1.0e-8 ) ) / @m  )"
}
C {sg13cmos5l_pr/rsil.sym} 260 -1240 1 0 {name=R4
w=0.5e-6
l=0.5e-6
model=rsil
body=VGND
spiceprefix=X
 m=1
  mm_ok=1
value="expr_eng(  ( 9.0e-6 / @w + 7.0 * ( @l ) / ( @w + 1.0e-8 ) ) / @m  )"
}
C {lab_pin.sym} 330 -1690 2 0 {name=p8 sig_type=std_logic lab=tie_off}
C {lab_pin.sym} 330 -1540 2 0 {name=p20 sig_type=std_logic lab=tie_off}
C {lab_pin.sym} 330 -1390 2 0 {name=p21 sig_type=std_logic lab=tie_off}
C {lab_pin.sym} 330 -1240 2 0 {name=p22 sig_type=std_logic lab=tie_off}
C {sg13cmos5l_pr/rsil.sym} 260 -1080 1 0 {name=R5
w=0.5e-6
l=0.5e-6
model=rsil
body=VGND
spiceprefix=X
 m=1
  mm_ok=1
value="expr_eng(  ( 9.0e-6 / @w + 7.0 * ( @l ) / ( @w + 1.0e-8 ) ) / @m  )"
}
C {opin.sym} 200 -940 2 0 {name=p23 lab=uio_out[0]}
C {lab_pin.sym} 330 -1080 2 0 {name=p24 sig_type=std_logic lab=tie_off}
C {sg13cmos5l_pr/rsil.sym} 260 -940 1 0 {name=R6
w=0.5e-6
l=0.5e-6
model=rsil
body=VGND
spiceprefix=X
 m=1
  mm_ok=1
value="expr_eng(  ( 9.0e-6 / @w + 7.0 * ( @l ) / ( @w + 1.0e-8 ) ) / @m  )"
}
C {opin.sym} 200 -1080 2 0 {name=p25 lab=uio_out[1]}
C {lab_pin.sym} 330 -940 2 0 {name=p26 sig_type=std_logic lab=tie_off}
C {sg13cmos5l_pr/rsil.sym} 270 -780 1 0 {name=R7
w=0.5e-6
l=0.5e-6
model=rsil
body=VGND
spiceprefix=X
 m=1
  mm_ok=1
value="expr_eng(  ( 9.0e-6 / @w + 7.0 * ( @l ) / ( @w + 1.0e-8 ) ) / @m  )"
}
C {opin.sym} 200 -1240 2 0 {name=p27 lab=uio_out[2]}
C {lab_pin.sym} 340 -780 2 0 {name=p28 sig_type=std_logic lab=tie_off}
C {sg13cmos5l_pr/rsil.sym} 270 -610 1 0 {name=R8
w=0.5e-6
l=0.5e-6
model=rsil
body=VGND
spiceprefix=X
 m=1
  mm_ok=1
value="expr_eng(  ( 9.0e-6 / @w + 7.0 * ( @l ) / ( @w + 1.0e-8 ) ) / @m  )"
}
C {opin.sym} 200 -1390 2 0 {name=p29 lab=uio_out[3]}
C {lab_pin.sym} 340 -610 2 0 {name=p30 sig_type=std_logic lab=tie_off}
C {sg13cmos5l_pr/rsil.sym} 270 -420 1 0 {name=R9
w=0.5e-6
l=0.5e-6
model=rsil
body=VGND
spiceprefix=X
 m=1
  mm_ok=1
value="expr_eng(  ( 9.0e-6 / @w + 7.0 * ( @l ) / ( @w + 1.0e-8 ) ) / @m  )"
}
C {opin.sym} 200 -1540 2 0 {name=p31 lab=uio_out[4]}
C {lab_pin.sym} 340 -420 2 0 {name=p32 sig_type=std_logic lab=tie_off}
C {sg13cmos5l_pr/rsil.sym} 270 -240 1 0 {name=R10
w=0.5e-6
l=0.5e-6
model=rsil
body=VGND
spiceprefix=X
 m=1
  mm_ok=1
value="expr_eng(  ( 9.0e-6 / @w + 7.0 * ( @l ) / ( @w + 1.0e-8 ) ) / @m  )"
}
C {opin.sym} 200 -1690 2 0 {name=p33 lab=uio_out[5]}
C {lab_pin.sym} 340 -240 2 0 {name=p34 sig_type=std_logic lab=tie_off}
C {lab_pin.sym} 1590 -510 0 0 {name=p35 sig_type=std_logic lab=tie_off}
C {sg13cmos5l_pr/rsil.sym} 620 -240 1 0 {name=R11
w=0.5e-6
l=0.5e-6
model=rsil
body=VGND
spiceprefix=X
 m=1
  mm_ok=1
value="expr_eng(  ( 9.0e-6 / @w + 7.0 * ( @l ) / ( @w + 1.0e-8 ) ) / @m  )"
}
C {opin.sym} 560 -240 2 0 {name=p15 lab=uio_out[6]}
C {lab_pin.sym} 690 -240 2 0 {name=p16 sig_type=std_logic lab=tie_off}
C {sg13cmos5l_pr/rsil.sym} 620 -420 1 0 {name=R12
w=0.5e-6
l=0.5e-6
model=rsil
body=VGND
spiceprefix=X
 m=1
  mm_ok=1
value="expr_eng(  ( 9.0e-6 / @w + 7.0 * ( @l ) / ( @w + 1.0e-8 ) ) / @m  )"
}
C {opin.sym} 560 -420 2 0 {name=p17 lab=uio_out[7]}
C {lab_pin.sym} 690 -420 2 0 {name=p18 sig_type=std_logic lab=tie_off}
C {sg13cmos5l_pr/rsil.sym} 620 -610 1 0 {name=R13
w=0.5e-6
l=0.5e-6
model=rsil
body=VGND
spiceprefix=X
 m=1
  mm_ok=1
value="expr_eng(  ( 9.0e-6 / @w + 7.0 * ( @l ) / ( @w + 1.0e-8 ) ) / @m  )"
}
C {opin.sym} 560 -610 2 0 {name=p36 lab=uio_oe[0]}
C {lab_pin.sym} 690 -610 2 0 {name=p44 sig_type=std_logic lab=tie_off}
C {sg13cmos5l_pr/rsil.sym} 620 -780 1 0 {name=R14
w=0.5e-6
l=0.5e-6
model=rsil
body=VGND
spiceprefix=X
 m=1
  mm_ok=1
value="expr_eng(  ( 9.0e-6 / @w + 7.0 * ( @l ) / ( @w + 1.0e-8 ) ) / @m  )"
}
C {opin.sym} 560 -780 2 0 {name=p37 lab=uio_oe[1]}
C {lab_pin.sym} 690 -780 2 0 {name=p45 sig_type=std_logic lab=tie_off}
C {sg13cmos5l_pr/rsil.sym} 620 -940 1 0 {name=R15
w=0.5e-6
l=0.5e-6
model=rsil
body=VGND
spiceprefix=X
 m=1
  mm_ok=1
value="expr_eng(  ( 9.0e-6 / @w + 7.0 * ( @l ) / ( @w + 1.0e-8 ) ) / @m  )"
}
C {opin.sym} 560 -940 2 0 {name=p38 lab=uio_oe[2]}
C {lab_pin.sym} 690 -940 2 0 {name=p46 sig_type=std_logic lab=tie_off}
C {sg13cmos5l_pr/rsil.sym} 620 -1080 1 0 {name=R16
w=0.5e-6
l=0.5e-6
model=rsil
body=VGND
spiceprefix=X
 m=1
  mm_ok=1
value="expr_eng(  ( 9.0e-6 / @w + 7.0 * ( @l ) / ( @w + 1.0e-8 ) ) / @m  )"
}
C {opin.sym} 560 -1080 2 0 {name=p39 lab=uio_oe[3]}
C {lab_pin.sym} 690 -1080 2 0 {name=p47 sig_type=std_logic lab=tie_off}
C {sg13cmos5l_pr/rsil.sym} 620 -1240 1 0 {name=R17
w=0.5e-6
l=0.5e-6
model=rsil
body=VGND
spiceprefix=X
 m=1
  mm_ok=1
value="expr_eng(  ( 9.0e-6 / @w + 7.0 * ( @l ) / ( @w + 1.0e-8 ) ) / @m  )"
}
C {opin.sym} 560 -1240 2 0 {name=p40 lab=uio_oe[4]}
C {lab_pin.sym} 690 -1240 2 0 {name=p48 sig_type=std_logic lab=tie_off}
C {sg13cmos5l_pr/rsil.sym} 620 -1390 1 0 {name=R18
w=0.5e-6
l=0.5e-6
model=rsil
body=VGND
spiceprefix=X
 m=1
  mm_ok=1
value="expr_eng(  ( 9.0e-6 / @w + 7.0 * ( @l ) / ( @w + 1.0e-8 ) ) / @m  )"
}
C {opin.sym} 560 -1390 2 0 {name=p41 lab=uio_oe[5]}
C {lab_pin.sym} 690 -1390 2 0 {name=p49 sig_type=std_logic lab=tie_off}
C {sg13cmos5l_pr/rsil.sym} 620 -1540 1 0 {name=R19
w=0.5e-6
l=0.5e-6
model=rsil
body=VGND
spiceprefix=X
 m=1
  mm_ok=1
value="expr_eng(  ( 9.0e-6 / @w + 7.0 * ( @l ) / ( @w + 1.0e-8 ) ) / @m  )"
}
C {opin.sym} 560 -1540 2 0 {name=p42 lab=uio_oe[6]}
C {lab_pin.sym} 690 -1540 2 0 {name=p50 sig_type=std_logic lab=tie_off}
C {sg13cmos5l_pr/rsil.sym} 620 -1690 1 0 {name=R20
w=0.5e-6
l=0.5e-6
model=rsil
body=VGND
spiceprefix=X
 m=1
  mm_ok=1
value="expr_eng(  ( 9.0e-6 / @w + 7.0 * ( @l ) / ( @w + 1.0e-8 ) ) / @m  )"
}
C {opin.sym} 560 -1690 2 0 {name=p43 lab=uio_oe[7]}
C {lab_pin.sym} 690 -1690 2 0 {name=p51 sig_type=std_logic lab=tie_off}
C {ipin.sym} 900 -640 0 0 {name=p52 lab=ui_in[1]}
C {ipin.sym} 900 -790 0 0 {name=p53 lab=ui_in[2]}
C {ipin.sym} 900 -940 0 0 {name=p54 lab=ui_in[3]}
C {ipin.sym} 900 -1090 0 0 {name=p55 lab=ui_in[4]}
C {ipin.sym} 900 -1240 0 0 {name=p56 lab=ui_in[5]}
C {ipin.sym} 900 -1390 0 0 {name=p57 lab=ui_in[6]}
C {ipin.sym} 900 -1540 0 0 {name=p58 lab=ui_in[7]}
C {opin.sym} 1580 -640 0 1 {name=p14 lab=uo_out[0]}
C {ipin.sym} 890 -1620 0 0 {name=p19 lab=ena}
C {ipin.sym} 1050 -640 0 0 {name=p59 lab=uio_in[0]}
C {ipin.sym} 1050 -790 0 0 {name=p60 lab=uio_in[1]}
C {ipin.sym} 1050 -940 0 0 {name=p61 lab=uio_in[2]}
C {ipin.sym} 1050 -1090 0 0 {name=p62 lab=uio_in[3]}
C {ipin.sym} 1050 -1240 0 0 {name=p63 lab=uio_in[4]}
C {ipin.sym} 1050 -1390 0 0 {name=p64 lab=uio_in[5]}
C {ipin.sym} 1050 -1540 0 0 {name=p65 lab=uio_in[6]}
C {ipin.sym} 1050 -1690 0 0 {name=p66 lab=uio_in[7]}
