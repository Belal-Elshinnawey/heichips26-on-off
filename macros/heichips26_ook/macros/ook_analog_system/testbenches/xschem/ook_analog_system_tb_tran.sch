v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
P 4 6 2090 -1110 2090 -960 2280 -960 2280 -1140 2090 -1140 2090 -1110 {}
T {Off Chip Accumulator} 2080 -960 0 0 0.4 0.4 {}
N 160 -630 160 -610 {lab=CLK_REF}
N 160 -550 160 -520 {lab=GND}
N 160 -800 160 -780 {lab=VDD}
N 160 -720 160 -690 {lab=GND}
N 1610 -1060 1650 -1060 {lab=VDD}
N 1950 -1000 1980 -1000 {lab=vout_tx}
N 1830 -1260 1830 -1240 {lab=VDD}
N 160 -990 160 -970 {lab=VDDA}
N 160 -910 160 -880 {lab=GND}
N 1760 -1260 1760 -1240 {lab=VDDA}
N 1600 -1160 1650 -1160 {lab=q0}
N 1600 -1140 1650 -1140 {lab=q1}
N 1600 -1120 1650 -1120 {lab=q2}
N 1600 -1100 1650 -1100 {lab=q3}
N 1600 -1000 1650 -1000 {lab=CLK_REF}
N 1590 -980 1590 -960 {lab=VDD}
N 1590 -980 1650 -980 {lab=VDD}
N 1550 -1040 1650 -1040 {lab=GND}
N 2190 -1120 2190 -1080 {lab=vout_accum}
N 2130 -1120 2130 -1080 {lab=vout_accum}
N 2130 -1120 2190 -1120 {lab=vout_accum}
N 2130 -1020 2130 -1000 {lab=GND}
N 2130 -1000 2190 -1000 {lab=GND}
N 2190 -1020 2190 -1000 {lab=GND}
N 2190 -1000 2190 -980 {lab=GND}
N 2190 -1120 2220 -1120 {lab=vout_accum}
N 1950 -1120 2130 -1120 {lab=vout_accum}
N 1350 -1420 1350 -1370 {lab=#net1}
N 1170 -1420 1190 -1420 {lab=#net2}
N 1440 -1420 1520 -1420 {lab=#net1}
N 1250 -1420 1270 -1420 {lab=#net3}
N 1330 -1420 1350 -1420 {lab=#net1}
N 1440 -1420 1440 -1370 {lab=#net1}
N 1350 -1420 1440 -1420 {lab=#net1}
N 1440 -1310 1440 -1300 {lab=GND}
N 1350 -1300 1440 -1300 {lab=GND}
N 1350 -1310 1350 -1300 {lab=GND}
N 1350 -1300 1350 -1250 {lab=GND}
N 1610 -1420 1610 -1390 {lab=#net4}
N 1580 -1420 1610 -1420 {lab=#net4}
N 1610 -1330 1610 -1310 {lab=GND}
N 1610 -1420 1680 -1420 {lab=#net4}
N 1740 -1420 1980 -1420 {lab=#net5}
N 1980 -1420 1980 -1140 {lab=#net5}
N 1950 -1140 1980 -1140 {lab=#net5}
N 1950 -910 1970 -910 {lab=dac_out}
N 1950 -890 1970 -890 {lab=clk_fb}
N 1950 -930 1970 -930 {lab=vcl}
N 1800 -620 1800 -590 {lab=GND}
N 1050 -1420 1110 -1420 {lab=vin_rx}
C {devices/code_shown.sym} 30 -1670 0 0 {name=NGSPICE
only_toplevel=true
value="
.param VDD=1.5
.param FREQ_REF=80e6
.param FREQ_FB=600e6
.options klu reltol=1e-3 abstol=1e-12 vntol=1e-6 gmin=1e-9 rshunt=1e12
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

Bvin1 vin_rx 0 V=\{(V(nenv)*V(ncar))\}
.save vout_tx clk_fb vcl q0 q1 q2 q3 vout_accum vin_rx
.tran 100p 150u 0 100p
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
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook/macros/dac/netlist/xspice/dac.xspice
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook/macros/ook_analog_system/netlist/pex/ook_transmitter_magic_pex_3.spice
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook/macros/ook_analog_system/netlist/pex/ook_analog_system_magic_pex_3.spice
.include /home/belal/HeiChips/heichips26-on-off/IHP-Open-PDK/ihp-sg13cmos5l/libs.tech/ngspice/models/cap_mfringe.lib
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook/macros/ook_analog_system/netlist/pex/vco_magic_pex_3.spice
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook/macros/ook_analog_system/netlist/pex/output_buffer_magic_pex_3.spice
"}
C {devices/vsource.sym} 160 -580 0 0 {name=VCLKREF value="PULSE(0 \{VDD\} 0 0.5n 0.5n \{0.5/FREQ_REF\} \{1/FREQ_REF\})"}
C {devices/lab_pin.sym} 160 -630 0 0 {name=lpclkref1 sig_type=std_logic lab=CLK_REF}
C {devices/gnd.sym} 160 -520 0 0 {name=lgnd3 lab=GND}
C {devices/vsource.sym} 160 -750 0 0 {name=VDDSRC value=\{VDD\}}
C {vdd.sym} 160 -800 0 0 {name=lvddb lab=VDD}
C {devices/gnd.sym} 160 -690 0 0 {name=lgnd5 lab=GND}
C {vdd.sym} 1830 -1260 0 0 {name=lvddb2 lab=VDD}
C {devices/gnd.sym} 1800 -590 0 0 {name=lgnd1 lab=GND}
C {ook_analog_system_pex.sym} 1800 -930 0 0 {name=x3}
C {devices/lab_pin.sym} 1980 -1000 2 0 {name=lpclkref7 sig_type=std_logic lab=vout_tx}
C {devices/vsource.sym} 160 -940 0 0 {name=VDDSRC1 value=\{3.3\}}
C {vdd.sym} 160 -990 0 0 {name=lvddb4 lab=VDDA
value=\{3.3\}}
C {devices/gnd.sym} 160 -880 0 0 {name=lgnd4 lab=GND
value=\{VDD/2\}}
C {vdd.sym} 1760 -1260 0 0 {name=lvddb5 lab=VDDA
value=\{VDD/2\}}
C {devices/lab_pin.sym} 1600 -1160 0 0 {name=lpclkref8 sig_type=std_logic lab=q0}
C {devices/lab_pin.sym} 1600 -1140 0 0 {name=lpclkref9 sig_type=std_logic lab=q1}
C {devices/lab_pin.sym} 1600 -1120 0 0 {name=lpclkref10 sig_type=std_logic lab=q2}
C {devices/lab_pin.sym} 1600 -1100 0 0 {name=lpclkref11 sig_type=std_logic lab=q3}
C {devices/lab_pin.sym} 1600 -1000 0 0 {name=lpclkref12 sig_type=std_logic lab=CLK_REF}
C {devices/gnd.sym} 1550 -1040 2 0 {name=lgnd2 lab=GND}
C {capa.sym} 2130 -1050 0 1 {name=Cb5
m=1
value=5p
footprint=1206
device="ceramic capacitor"
}
C {res.sym} 2190 -1050 2 1 {name=R2
value=250k
int=1206
device=resistor
m=1}
C {devices/gnd.sym} 2190 -980 0 1 {name=l4 lab=GND}
C {devices/lab_pin.sym} 2220 -1120 2 0 {name=p7 sig_type=std_logic lab=vout_accum}
C {capa.sym} 1710 -1420 3 0 {name=Cb2
m=1
value=10p
footprint=1206
device="ceramic capacitor"
}
C {ind.sym} 1220 -1420 3 0 {name=L20
m=1
value=8.33u
footprint=1206
device=inductor}
C {devices/gnd.sym} 1350 -1250 0 0 {name=l21 lab=GND}
C {res.sym} 1140 -1420 1 0 {name=R1
value=50
footprint=1206
device=resistor
m=1}
C {capa.sym} 1350 -1340 0 0 {name=Cb1
m=1
value=1.25n
footprint=1206
device="ceramic capacitor"
}
C {capa.sym} 1300 -1420 3 0 {name=Cb3
m=1
value=16.14f
footprint=1206
device="ceramic capacitor"
}
C {ind.sym} 1440 -1340 0 0 {name=L22
m=1
value=107p
footprint=1206
device=inductor}
C {ind.sym} 1550 -1420 1 0 {name=L24
m=1
value=344n
footprint=1206
device=inductor}
C {capa.sym} 1610 -1360 0 0 {name=Cb4
m=1
value=330f
footprint=1206
device="ceramic capacitor"
}
C {devices/gnd.sym} 1610 -1310 0 0 {name=l25 lab=GND}
C {devices/lab_pin.sym} 1970 -890 2 0 {name=lpclkref13 sig_type=std_logic lab=clk_fb}
C {devices/lab_pin.sym} 1970 -910 2 0 {name=lpclkref14 sig_type=std_logic lab=dac_out}
C {devices/lab_pin.sym} 1970 -930 2 0 {name=lpclkref15 sig_type=std_logic lab=vcl}
C {vdd.sym} 1610 -1060 3 0 {name=lvddb3 lab=VDD}
C {vdd.sym} 1590 -960 2 0 {name=lvddb1 lab=VDD}
C {devices/lab_pin.sym} 1050 -1420 0 0 {name=lpclkref2 sig_type=std_logic lab=vin_rx}
