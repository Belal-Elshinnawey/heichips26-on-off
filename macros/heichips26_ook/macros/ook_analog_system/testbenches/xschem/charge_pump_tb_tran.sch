v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 1640 -1240 2440 -840 {flags=graph
y1=2.2119445
y2=4.1119445
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-3.1668311e-07
x2=-1.6683085e-08
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0
linewidth_mult=3
color=4
node="DIN
CLK
RSTN"}
B 2 1640 -820 2440 -420 {flags=graph
y1=9.1226139
y2=10.095413
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-3.1668311e-07
x2=-1.6683085e-08
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="Q
QN"
color="4 7"
dataset=-1
unitx=1
logx=0
logy=0
linewidth_mult=3
autoload=0}
N 110 -700 110 -660 {lab=VDD}
N 110 -600 110 -560 {lab=GND}
N 110 -420 110 -380 {lab=GND}
N 110 -520 110 -480 {lab=CLK_REF}
N 110 -220 110 -180 {lab=GND}
N 110 -320 110 -280 {lab=VCLK_FB}
N 720 -560 750 -560 {lab=DN}
N 720 -620 750 -620 {lab=UP}
N 850 -770 850 -720 {lab=VDD}
N 560 -800 560 -770 {lab=GND}
N 950 -650 1030 -650 {lab=CLK_R_BB}
N 850 -520 850 -490 {lab=GND}
N 710 -680 750 -680 {lab=VDD}
N 510 -860 530 -860 {lab=UP}
N 510 -840 530 -840 {lab=DN}
N 590 -930 590 -900 {lab=VDD}
N 650 -850 770 -850 {lab=vout}
N 950 -590 990 -590 {lab=clk_fb}
N 990 -590 990 -580 {lab=clk_fb}
N 1240 -830 1300 -830 {lab=vout_osc}
N 1290 -800 1300 -800 {lab=VDD}
N 1280 -770 1280 -750 {lab=GND}
N 1280 -770 1300 -770 {lab=GND}
N 1120 -770 1120 -750 {lab=GND}
N 1380 -770 1380 -760 {lab=GND}
N 1410 -800 1540 -800 {lab=vosc}
N 1110 -920 1120 -920 {lab=VDD}
N 1120 -920 1120 -890 {lab=VDD}
N 1280 -910 1350 -910 {lab=VDD}
N 1350 -910 1350 -850 {lab=VDD}
N 920 -830 940 -830 {lab=vout}
N 920 -830 920 -810 {lab=vout}
N 920 -810 1000 -810 {lab=vout}
N 1100 -590 1190 -590 {lab=clk_fb}
N 1480 -590 1550 -590 {lab=vfb}
N 1270 -720 1290 -720 {lab=VDD}
N 1290 -720 1290 -690 {lab=VDD}
N 1290 -490 1290 -460 {lab=GND}
N 1340 -750 1340 -710 {lab=vfb}
N 1340 -710 1480 -710 {lab=vfb}
N 1480 -710 1480 -590 {lab=vfb}
N 1390 -590 1480 -590 {lab=vfb}
N 1530 -830 1540 -830 {lab=vosc}
N 1540 -830 1540 -800 {lab=vosc}
N 1550 -590 1550 -550 {lab=vfb}
N 1070 -560 1100 -560 {lab=clk_fb}
N 1100 -590 1100 -560 {lab=clk_fb}
N 990 -590 1100 -590 {lab=clk_fb}
N 860 -400 880 -400 {lab=CLK_REF}
N 850 -280 880 -280 {lab=VDD}
N 1080 -340 1130 -340 {lab=CLK_R_BB}
N 980 -470 1010 -470 {lab=VDD}
N 980 -470 980 -440 {lab=VDD}
N 980 -240 980 -210 {lab=GND}
C {devices/code_shown.sym} 10 -1700 0 0 {name=NGSPICE
only_toplevel=true
value="
.param VDD=1.5
.param temp=27

.options klu method=gear trtol=25 reltol=1e-3 vntol=1e-6 gmin=1e-12 itl1=200 itl4=50
.control

save CLK_REF VCLK_FB UP DN vout vosc vfb clk_fb vout_osc CLK_R_BB

shell rm -f @schname\\\\.raw
set wr_vecnames
set wr_singlescale

tran 10e-12 100e-6 0 10e-12
write @schname\\\\.raw
wrdata ../plot_simulations/data/@schname\\\\.txt v(CLK_REF) v(VCLK_FB) v(UP) v(DN) vout

plot UP DN
plot vout
plot vosc vfb clk_fb vout_osc
plot clk_fb
plot vosc
plot CLK_R_BB
.endc
"}
C {devices/launcher.sym} 1700 -1410 0 0 {name=h2
descr="Simulate"
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {title-3.sym} 0 0 0 0 {name=l2 author="Belal Elshinnawey" rev=1.0 lock=true}
C {devices/launcher.sym} 1700 -1290 0 0 {name=h1
descr="Load waves"
tclcommand="xschem raw_read $netlist_dir/[file rootname [file tail [xschem get current_name]]].raw tran"
}
C {devices/launcher.sym} 1700 -1350 0 0 {name=h3
descr="Annotate OP"
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/code_shown.sym} 1960 -1490 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerDIO.lib dio_tt
.lib cornerCAP.lib cap_typ
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook/macros/ook_analog_system/netlist/pex/charge_pump_magic_pex_3.spice
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook/macros/ook_analog_system/netlist/pex/pfd_magic_pex_3.spice
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook/macros/pfd_digital/netlist/xspice/pfd_digital.xspice
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook/macros/fb_clk_gen/netlist/xspice/fb_clk_gen.xspice
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook/macros/ref_clk_gen/netlist/xspice/ref_clk_gen.xspice
.include /home/belal/HeiChips/heichips26-on-off/IHP-Open-PDK/ihp-sg13cmos5l/libs.tech/ngspice/models/cap_mfringe.lib
"}
C {devices/vsource.sym} 110 -630 0 0 {name=VDDSRC value=\{VDD\}}
C {devices/vsource.sym} 110 -450 0 0 {name=vclk_ref value="PULSE(\{VDD\} \{0\} 0 0.2n 0.2n 6.05n 12.5n)"}
C {devices/lab_pin.sym} 110 -520 0 0 {name=lp5 sig_type=std_logic lab=CLK_REF}
C {devices/gnd.sym} 110 -380 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 110 -560 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 110 -700 0 0 {name=lp3 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} 110 -250 0 0 {name=vclk_ref1 value="PULSE(\{VDD\} \{0\} 0 0.2n 0.2n 833.135n 1666.67n)"}
C {devices/gnd.sym} 110 -180 0 0 {name=l3 lab=GND
value="PULSE(\{VDD\} \{0\} 0 0.2n 0.2n 16.2376n 32.8751n)"}
C {devices/lab_pin.sym} 110 -320 0 0 {name=lp4 sig_type=std_logic lab=VCLK_FB}
C {devices/lab_pin.sym} 850 -770 0 0 {name=lp1 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 560 -770 0 0 {name=l5 lab=GND}
C {devices/lab_pin.sym} 860 -400 0 0 {name=lp6 sig_type=std_logic lab=CLK_REF}
C {charge_pump_pex.sym} 1340 -1210 0 0 {name=x3
spice_ignore=true}
C {pfd_pex.sym} 1160 -1200 0 0 {name=x1
spice_ignore=true
}
C {pfd_digital.sym} 850 -620 0 0 {name=x2}
C {devices/gnd.sym} 850 -490 0 0 {name=l9 lab=GND}
C {devices/lab_pin.sym} 720 -620 3 0 {name=lp8 sig_type=std_logic lab=UP}
C {devices/lab_pin.sym} 720 -560 3 0 {name=lp9 sig_type=std_logic lab=DN}
C {devices/lab_pin.sym} 710 -680 0 0 {name=lp7 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 510 -860 1 0 {name=lp10 sig_type=std_logic lab=UP}
C {devices/lab_pin.sym} 510 -840 3 0 {name=lp11 sig_type=std_logic lab=DN}
C {devices/lab_pin.sym} 590 -930 0 0 {name=lp12 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 690 -850 2 0 {name=lp13 sig_type=std_logic lab=vout}
C {charge_pump.sym} 590 -850 0 0 {name=x4}
C {vco.sym} 1110 -830 0 0 {name=x5}
C {output_buffer.sym} 1350 -680 0 0 {name=x6}
C {devices/lab_pin.sym} 1290 -800 0 0 {name=lp2 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 1280 -750 0 0 {name=l7 lab=GND}
C {devices/gnd.sym} 1120 -750 0 0 {name=l8 lab=GND}
C {devices/gnd.sym} 1380 -760 0 0 {name=l10 lab=GND}
C {devices/lab_pin.sym} 1110 -920 0 0 {name=lp14 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 1280 -910 0 0 {name=lp15 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 940 -830 2 0 {name=lp16 sig_type=std_logic lab=vout}
C {fb_clk_gen.sym} 1290 -590 0 1 {name=x7}
C {devices/lab_pin.sym} 1270 -720 0 0 {name=lp17 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 1290 -460 0 0 {name=l6 lab=GND}
C {devices/lab_pin.sym} 1530 -830 0 0 {name=lp18 sig_type=std_logic lab=vosc}
C {devices/lab_pin.sym} 1550 -550 0 0 {name=lp19 sig_type=std_logic lab=vfb}
C {devices/lab_pin.sym} 1070 -560 0 0 {name=lp20 sig_type=std_logic lab=clk_fb}
C {devices/lab_pin.sym} 1270 -830 1 0 {name=lp21 sig_type=std_logic lab=vout_osc}
C {ref_clk_gen.sym} 980 -340 0 0 {name=x8}
C {devices/lab_pin.sym} 850 -280 0 0 {name=lp22 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 1130 -340 2 0 {name=lp23 sig_type=std_logic lab=CLK_R_BB}
C {devices/lab_pin.sym} 1020 -650 2 0 {name=lp24 sig_type=std_logic lab=CLK_R_BB}
C {devices/lab_pin.sym} 1010 -470 0 1 {name=lp25 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 980 -210 0 0 {name=l11 lab=GND}
