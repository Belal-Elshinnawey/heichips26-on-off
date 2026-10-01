v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
P 4 6 1690 -460 1690 -310 1880 -310 1880 -490 1690 -490 1690 -460 {}
P 4 5 1490 -840 1490 -630 1650 -630 1650 -840 1490 -840 {}
P 4 6 1680 -870 2050 -870 2050 -620 1670 -620 1670 -870 1680 -870 {}
T {Off Chip Accumulator} 1680 -310 0 0 0.4 0.4 {}
T {Filter} 1860 -900 0 0 0.4 0.4 {}
T {Matching Stub} 1490 -870 0 0 0.4 0.4 {}
N 160 -630 160 -610 {lab=CLK_REF}
N 160 -550 160 -520 {lab=GND}
N 160 -800 160 -780 {lab=VDD}
N 160 -720 160 -690 {lab=GND}
N 1190 -690 1220 -690 {lab=vout_tx}
N 1030 -1160 1030 -1100 {lab=VDD}
N 160 -990 160 -970 {lab=VDDA}
N 160 -910 160 -880 {lab=GND}
N 1050 -1120 1050 -1100 {lab=VDDA}
N 1790 -470 1790 -430 {lab=vout_accum}
N 1730 -470 1730 -430 {lab=vout_accum}
N 1730 -470 1790 -470 {lab=vout_accum}
N 1730 -370 1730 -350 {lab=GND}
N 1730 -350 1790 -350 {lab=GND}
N 1790 -370 1790 -350 {lab=GND}
N 1790 -350 1790 -330 {lab=GND}
N 1790 -470 1820 -470 {lab=vout_accum}
N 1440 -800 1500 -800 {lab=vin_rx}
N 840 -1060 890 -1060 {lab=VDD}
N 800 -1040 890 -1040 {lab=CLK_REF}
N 860 -440 890 -440 {lab=q0}
N 860 -420 890 -420 {lab=q1}
N 860 -400 890 -400 {lab=q2}
N 860 -380 890 -380 {lab=q3}
N 1190 -710 1220 -710 {lab=vout_accum}
N 860 -1020 890 -1020 {lab=#net1}
N 860 -1000 890 -1000 {lab=#net2}
N 860 -980 890 -980 {lab=#net3}
N 860 -960 890 -960 {lab=#net4}
N 860 -940 890 -940 {lab=#net5}
N 860 -920 890 -920 {lab=#net6}
N 860 -900 890 -900 {lab=#net7}
N 860 -880 890 -880 {lab=#net8}
N 860 -840 890 -840 {lab=#net9}
N 860 -820 890 -820 {lab=#net10}
N 860 -800 890 -800 {lab=#net11}
N 860 -780 890 -780 {lab=#net12}
N 860 -760 890 -760 {lab=#net13}
N 860 -740 890 -740 {lab=#net14}
N 860 -720 890 -720 {lab=#net15}
N 860 -700 890 -700 {lab=#net16}
N 860 -680 890 -680 {lab=#net17}
N 860 -660 890 -660 {lab=#net18}
N 860 -640 890 -640 {lab=#net19}
N 860 -620 890 -620 {lab=#net20}
N 860 -600 890 -600 {lab=#net21}
N 860 -580 890 -580 {lab=#net22}
N 860 -560 890 -560 {lab=#net23}
N 860 -540 890 -540 {lab=#net24}
N 860 -520 890 -520 {lab=#net25}
N 860 -500 890 -500 {lab=#net26}
N 860 -480 890 -480 {lab=#net27}
N 860 -460 890 -460 {lab=#net28}
N 800 -860 890 -860 {lab=VDD}
N 800 -890 800 -860 {lab=VDD}
N 660 -1050 690 -1050 {lab=#net29}
N 660 -1030 690 -1030 {lab=#net30}
N 660 -1010 690 -1010 {lab=#net31}
N 660 -990 690 -990 {lab=#net32}
N 660 -970 690 -970 {lab=#net33}
N 660 -950 690 -950 {lab=#net34}
N 660 -930 690 -930 {lab=#net35}
N 660 -910 690 -910 {lab=#net36}
N 1040 -320 1040 -280 {lab=GND}
N 1820 -800 1820 -760 {lab=#net37}
N 1890 -800 1890 -760 {lab=#net37}
N 1840 -680 1840 -660 {lab=GND}
N 1820 -680 1840 -680 {lab=GND}
N 1820 -700 1820 -680 {lab=GND}
N 1890 -700 1890 -680 {lab=GND}
N 1840 -680 1890 -680 {lab=GND}
N 1990 -710 1990 -690 {lab=GND}
N 1990 -800 1990 -770 {lab=#net37}
N 1740 -800 1820 -800 {lab=#net37}
N 1590 -800 1590 -770 {lab=#net38}
N 1560 -800 1590 -800 {lab=#net38}
N 1590 -800 1680 -800 {lab=#net38}
N 1590 -710 1590 -680 {lab=GND}
N 1820 -800 1890 -800 {lab=#net37}
N 1990 -800 2060 -800 {lab=#net37}
N 1890 -800 1990 -800 {lab=#net37}
N 2120 -800 2170 -800 {lab=rx_filt}
N 1190 -730 1230 -730 {lab=rx_filt}
C {devices/code_shown.sym} 30 -1670 0 0 {name=NGSPICE
only_toplevel=true
value="
.param VDD=1.5
.param FREQ_REF=80e6
.param FREQ_FB=600e6
.options klu reltol=1e-3 abstol=1e-12 vntol=1e-6 gmin=1e-6 itl1=200 rshunt=1e9 trtol=20
.param b0=1 b1=0 b2=1 b3=0 b4=0 b5=1 b6=0 b7=1
.param bitsum=\{b0+b1+b2+b3+b4+b5+b6+b7\}
.param parity=\{bitsum-2*int(bitsum/2)\}

Vcarrier ncar 0 SINE(0 1m 433.92e6)

Bvenv nenv 0 V =
+ (time<10e-6)  ? 1 :
+ (time<15e-6)  ? (1-b0) : (time<20e-6) ? b0 :
+ (time<25e-6)  ? (1-b1) : (time<30e-6) ? b1 :
+ (time<35e-6)  ? (1-b2) : (time<40e-6) ? b2 :
+ (time<45e-6)  ? (1-b3) : (time<50e-6) ? b3 :
+ (time<55e-6)  ? (1-b4) : (time<60e-6) ? b4 :
+ (time<65e-6)  ? (1-b5) : (time<70e-6) ? b5 :
+ (time<75e-6)  ? (1-b6) : (time<80e-6) ? b6 :
+ (time<85e-6)  ? (1-b7) : (time<90e-6) ? b7 :
+ (time<100e-6) ? parity :
+ 1

Bvin1 vin_rx_src 0 V=\{(V(nenv)*V(ncar))\}
Rsrc vin_rx_src vin_rx 50
.save vout_tx q0 q1 q2 q3 vout_accum vin_rx rx_filt i(VDDSRC) i(VDDSRC1)
.tran 100p 150u 0 100p uic
"}
C {devices/launcher.sym} 2340 -1410 0 0 {name=h2
descr="Simulate"
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {title-3.sym} 0 0 0 0 {name=l2 author="Belal Elshinnawey" rev=1.0 lock=true}
C {devices/launcher.sym} 2340 -1350 0 0 {name=h3
descr="Annotate OP"
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/code_shown.sym} 900 -1740 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerDIO.lib dio_tt
.lib cornerCAP.lib cap_typ
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/macros/dac/netlist/xspice/dac.xspice
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/macros/ook_analog_system/netlist/pex/ook_transmitter_magic_pex_3.spice
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/macros/ook_analog_system/netlist/pex/ook_analog_system_magic_pex_3.spice
.include /home/belal/HeiChips/heichips26-on-off/IHP-Open-PDK/ihp-sg13cmos5l/libs.tech/ngspice/models/cap_mfringe.lib
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/macros/ook_analog_system/netlist/pex/vco_magic_pex_3.spice
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/macros/ook_analog_system/netlist/pex/output_buffer_magic_pex_3.spice
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/netlist/pex/heichips26_ook_top_magic_pex_3.spice

"}
C {devices/vsource.sym} 160 -580 0 0 {name=VCLKREF value="PULSE(0 \{VDD\} 0 0.5n 0.5n \{0.5/FREQ_REF\} \{1/FREQ_REF\})"}
C {devices/lab_pin.sym} 160 -630 0 0 {name=lpclkref1 sig_type=std_logic lab=CLK_REF}
C {devices/gnd.sym} 160 -520 0 0 {name=lgnd3 lab=GND}
C {devices/vsource.sym} 160 -750 0 0 {name=VDDSRC value=\{VDD\}}
C {vdd.sym} 160 -800 0 0 {name=lvddb lab=VDD}
C {devices/gnd.sym} 160 -690 0 0 {name=lgnd5 lab=GND}
C {vdd.sym} 1030 -1160 0 0 {name=lvddb2 lab=VDD}
C {devices/lab_pin.sym} 1220 -690 2 0 {name=lpclkref7 sig_type=std_logic lab=vout_tx}
C {devices/vsource.sym} 160 -940 0 0 {name=VDDSRC1 value=\{3.3\}}
C {vdd.sym} 160 -990 0 0 {name=lvddb4 lab=VDDA
value=\{3.3\}}
C {devices/gnd.sym} 160 -880 0 0 {name=lgnd4 lab=GND
value=\{VDD/2\}}
C {vdd.sym} 1050 -1120 0 0 {name=lvddb5 lab=VDDA
value=\{VDD/2\}}
C {devices/lab_pin.sym} 860 -440 0 0 {name=lpclkref8 sig_type=std_logic lab=q0}
C {devices/lab_pin.sym} 860 -420 0 0 {name=lpclkref9 sig_type=std_logic lab=q1}
C {devices/lab_pin.sym} 860 -400 0 0 {name=lpclkref10 sig_type=std_logic lab=q2}
C {devices/lab_pin.sym} 860 -380 0 0 {name=lpclkref11 sig_type=std_logic lab=q3}
C {devices/lab_pin.sym} 800 -1040 0 0 {name=lpclkref12 sig_type=std_logic lab=CLK_REF}
C {capa.sym} 1730 -400 0 1 {name=Cb5
m=1
value=5p
footprint=1206
device="ceramic capacitor"
}
C {res.sym} 1790 -400 2 1 {name=R2
value=250k
int=1206
device=resistor
m=1}
C {devices/gnd.sym} 1790 -330 0 1 {name=l4 lab=GND}
C {devices/lab_pin.sym} 1820 -470 2 0 {name=p7 sig_type=std_logic lab=vout_accum}
C {vdd.sym} 840 -1060 3 0 {name=lvddb1 lab=VDD}
C {devices/lab_pin.sym} 1440 -800 2 1 {name=lpclkref2 sig_type=std_logic lab=vin_rx}
C {heichips26_ook_top_pex.sym} 1050 -710 0 0 {name=x1}
C {devices/lab_pin.sym} 1220 -710 2 0 {name=p1 sig_type=std_logic lab=vout_accum}
C {noconn.sym} 860 -460 0 0 {name=l1}
C {noconn.sym} 860 -480 0 0 {name=l3}
C {noconn.sym} 860 -500 0 0 {name=l5}
C {noconn.sym} 860 -520 0 0 {name=l6}
C {noconn.sym} 860 -540 0 0 {name=l7}
C {noconn.sym} 860 -560 0 0 {name=l8}
C {noconn.sym} 860 -580 0 0 {name=l9}
C {noconn.sym} 860 -600 0 0 {name=l10}
C {noconn.sym} 860 -620 0 0 {name=l11}
C {noconn.sym} 860 -640 0 0 {name=l12}
C {noconn.sym} 860 -660 0 0 {name=l13}
C {noconn.sym} 860 -680 0 0 {name=l14}
C {noconn.sym} 860 -700 0 0 {name=l15}
C {noconn.sym} 860 -720 0 0 {name=l16}
C {noconn.sym} 860 -740 0 0 {name=l17}
C {noconn.sym} 860 -760 0 0 {name=l18}
C {noconn.sym} 860 -780 0 0 {name=l19}
C {noconn.sym} 860 -800 0 0 {name=l20}
C {noconn.sym} 860 -820 0 0 {name=l21}
C {noconn.sym} 860 -840 0 0 {name=l22}
C {noconn.sym} 860 -880 0 0 {name=l24}
C {noconn.sym} 860 -900 0 0 {name=l25}
C {noconn.sym} 860 -920 0 0 {name=l26}
C {noconn.sym} 860 -940 0 0 {name=l27}
C {noconn.sym} 860 -960 0 0 {name=l28}
C {noconn.sym} 860 -980 0 0 {name=l29}
C {noconn.sym} 860 -1000 0 0 {name=l30}
C {noconn.sym} 860 -1020 0 0 {name=l31}
C {vdd.sym} 800 -890 0 0 {name=lvddb3 lab=VDD}
C {noconn.sym} 660 -910 0 0 {name=l34}
C {noconn.sym} 660 -930 0 0 {name=l35}
C {noconn.sym} 660 -950 0 0 {name=l36}
C {noconn.sym} 660 -970 0 0 {name=l37}
C {noconn.sym} 660 -990 0 0 {name=l38}
C {noconn.sym} 660 -1010 0 0 {name=l39}
C {noconn.sym} 660 -1030 0 0 {name=l40}
C {noconn.sym} 660 -1050 0 0 {name=l41}
C {devices/gnd.sym} 1040 -280 0 0 {name=lgnd1 lab=GND}
C {capa.sym} 2090 -800 3 0 {name=Cb1
m=1
value=1p
footprint=1206
device="ceramic capacitor"
}
C {capa.sym} 1820 -730 2 0 {name=C2
m=1
value=1n
footprint=1206
device="ceramic capacitor"}
C {ind.sym} 1890 -730 0 0 {name=L23
m=1
value=134.5p
footprint=1206
device=inductor}
C {devices/gnd.sym} 1840 -660 0 0 {name=l32 lab=GND}
C {capa.sym} 1710 -800 3 0 {name=C1
m=1
value=0.558p
footprint=1206
device="ceramic capacitor"}
C {ind.sym} 1990 -740 0 0 {name=L33
m=1
value=138.95n
footprint=1206
device=inductor}
C {devices/gnd.sym} 1990 -690 0 0 {name=l42 lab=GND}
C {capa.sym} 1530 -800 1 0 {name=C3
m=1
value=10.02p
footprint=1206
device="ceramic capacitor"}
C {ind.sym} 1590 -740 0 0 {name=L43
m=1
value=17.56n
footprint=1206
device=inductor}
C {devices/gnd.sym} 1590 -680 0 0 {name=l44 lab=GND}
C {devices/lab_pin.sym} 2170 -800 0 1 {name=lpclkref3 sig_type=std_logic lab=rx_filt}
C {devices/lab_pin.sym} 1230 -730 0 1 {name=lpclkref4 sig_type=std_logic lab=rx_filt}
