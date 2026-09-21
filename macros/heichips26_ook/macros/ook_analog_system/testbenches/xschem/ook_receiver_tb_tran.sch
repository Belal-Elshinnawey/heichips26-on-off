v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 1640 -1240 2440 -840 {flags=graph
y1=-0.00075997852
y2=-0.00074522113
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=5.6748878e-07
x2=7.0170647e-07
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
node=i(vdd3)}
B 2 1640 -820 2440 -420 {flags=graph
y1=2.7980835
y2=2.9467881
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=5.6748878e-07
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="vin
vout"
color="4 7"
dataset=-1
unitx=1
logx=0
logy=0
linewidth_mult=3
autoload=0
x2=7.0170647e-07
hilight_wave=-1}
P 4 1 1040 -1090 {}
P 4 6 1110 -1220 1110 -1070 1300 -1070 1300 -1250 1110 -1250 1110 -1220 {}
T {Off Chip Accumulator} 1100 -1070 0 0 0.4 0.4 {}
N 2050 -370 2050 -330 {lab=VDD}
N 2050 -270 2050 -230 {lab=GND}
N 880 -1530 880 -1480 {lab=VDD}
N 340 -1290 340 -1240 {lab=#net1}
N 160 -1290 180 -1290 {lab=#net2}
N 430 -1290 510 -1290 {lab=#net1}
N 240 -1290 260 -1290 {lab=#net3}
N 320 -1290 340 -1290 {lab=#net1}
N 430 -1290 430 -1240 {lab=#net1}
N 340 -1290 430 -1290 {lab=#net1}
N 430 -1180 430 -1170 {lab=GND}
N 340 -1170 430 -1170 {lab=GND}
N 340 -1180 340 -1170 {lab=GND}
N 340 -1170 340 -1120 {lab=GND}
N 600 -1290 600 -1260 {lab=#net4}
N 570 -1290 600 -1290 {lab=#net4}
N 600 -1200 600 -1180 {lab=GND}
N 600 -1290 670 -1290 {lab=#net4}
N 70 -1290 100 -1290 {lab=vin}
N 1210 -1230 1210 -1190 {lab=vout}
N 1150 -1230 1150 -1190 {lab=vout}
N 1150 -1230 1210 -1230 {lab=vout}
N 1150 -1130 1150 -1110 {lab=GND}
N 1150 -1110 1210 -1110 {lab=GND}
N 1210 -1130 1210 -1110 {lab=GND}
N 1210 -1110 1210 -1090 {lab=GND}
N 1210 -1230 1240 -1230 {lab=vout}
N 2180 -370 2180 -330 {lab=VDDL}
N 2180 -270 2180 -230 {lab=GND}
N 1040 -1320 1070 -1320 {lab=q3}
N 1040 -1300 1070 -1300 {lab=q2}
N 1040 -1280 1070 -1280 {lab=q1}
N 1040 -1260 1070 -1260 {lab=q0}
N 890 -1100 890 -1080 {lab=GND}
N 900 -1550 900 -1480 {lab=VDDL}
N 700 -1190 740 -1190 {lab=lo_s2}
N 700 -1200 740 -1200 {lab=lo_s2f}
N 700 -1130 740 -1130 {lab=lnaf}
N 700 -1180 740 -1180 {lab=vref0}
N 700 -1170 740 -1170 {lab=vref1}
N 700 -1160 740 -1160 {lab=vref3}
N 700 -1150 740 -1150 {lab=vref2}
N 1040 -1230 1150 -1230 {lab=vout}
N 700 -1140 740 -1140 {lab=opm}
N 700 -1210 740 -1210 {lab=lo_s1}
N 700 -1220 740 -1220 {lab=lo_s1f}
N 730 -1290 740 -1290 {lab=#net5}
C {devices/code_shown.sym} 80 -600 0 0 {name=NGSPICE
only_toplevel=true
value="
.param VDD=3.3
.param temp=27
.options klu reltol=1e-3 abstol=1e-12 vntol=1e-6 gmin=1e-12

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

Bvin1 vin 0 V=\{(V(nenv)*V(ncar))\}

.save vin vout i(vdd3) v(q3) v(q2) v(q1) v(q0) opm lo_s1 lo_s1f lo_s2 lo_s2f vref0 vref1 vref2 vref3
.tran 100p 120u 100p
"
}
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
C {devices/code_shown.sym} 1150 -1730 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerDIO.lib dio_tt
.lib cornerCAP.lib cap_typ
.include /home/belal/HeiChips/heichips26-on-off/IHP-Open-PDK/ihp-sg13cmos5l/libs.tech/ngspice/models/cap_mfringe.lib
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook/macros/ook_analog_system/netlist/pex/ook_receiver_magic_pex_3.spice

"}
C {devices/vsource.sym} 2050 -300 0 0 {name=VDD3 value=\{VDD\}}
C {devices/gnd.sym} 2050 -230 0 0 {name=l1 lab=GND}
C {vdd.sym} 2050 -370 0 0 {name=l3 lab=VDD}
C {devices/lab_pin.sym} 70 -1290 2 1 {name=l26 sig_type=std_logic lab=vin}
C {capa.sym} 700 -1290 3 0 {name=Cb2
m=1
value=10p
footprint=1206
device="ceramic capacitor"
}
C {devices/gnd.sym} 890 -1080 0 0 {name=l12 lab=GND}
C {vdd.sym} 880 -1530 0 0 {name=l13 lab=VDD}
C {ind.sym} 210 -1290 3 0 {name=L20
m=1
value=8.33u
footprint=1206
device=inductor}
C {devices/gnd.sym} 340 -1120 0 0 {name=l21 lab=GND}
C {res.sym} 130 -1290 1 0 {name=R1
value=50
footprint=1206
device=resistor
m=1}
C {capa.sym} 340 -1210 0 0 {name=Cb1
m=1
value=1.25n
footprint=1206
device="ceramic capacitor"
}
C {capa.sym} 290 -1290 3 0 {name=Cb3
m=1
value=16.14f
footprint=1206
device="ceramic capacitor"
}
C {ind.sym} 430 -1210 0 0 {name=L22
m=1
value=107p
footprint=1206
device=inductor}
C {ind.sym} 540 -1290 1 0 {name=L24
m=1
value=344n
footprint=1206
device=inductor}
C {capa.sym} 600 -1230 0 0 {name=Cb4
m=1
value=330f
footprint=1206
device="ceramic capacitor"
}
C {devices/gnd.sym} 600 -1180 0 0 {name=l25 lab=GND}
C {capa.sym} 1150 -1160 0 1 {name=Cb5
m=1
value=5p
footprint=1206
device="ceramic capacitor"
}
C {res.sym} 1210 -1160 2 1 {name=R2
value=250k
int=1206
device=resistor
m=1}
C {devices/gnd.sym} 1210 -1090 0 1 {name=l4 lab=GND}
C {devices/vsource.sym} 2180 -300 0 0 {name=VDDL value=\{1.5\}}
C {devices/gnd.sym} 2180 -230 0 0 {name=VDDL1 lab=GND}
C {vdd.sym} 2180 -370 0 0 {name=VDDL2 lab=VDDL}
C {devices/lab_pin.sym} 1070 -1320 0 1 {name=p3 sig_type=std_logic lab=q3}
C {devices/lab_pin.sym} 1070 -1300 0 1 {name=p4 sig_type=std_logic lab=q2}
C {devices/lab_pin.sym} 1070 -1280 0 1 {name=p5 sig_type=std_logic lab=q1}
C {devices/lab_pin.sym} 1070 -1260 0 1 {name=p6 sig_type=std_logic lab=q0}
C {vdd.sym} 900 -1550 0 0 {name=l17 lab=VDDL}
C {devices/lab_pin.sym} 700 -1140 2 1 {name=p2 sig_type=std_logic lab=opm}
C {devices/lab_pin.sym} 1240 -1230 2 0 {name=p7 sig_type=std_logic lab=vout}
C {devices/lab_pin.sym} 700 -1190 2 1 {name=p1 sig_type=std_logic lab=lo_s2}
C {devices/lab_pin.sym} 700 -1200 2 1 {name=p8 sig_type=std_logic lab=lo_s2f}
C {devices/lab_pin.sym} 700 -1210 2 1 {name=p9 sig_type=std_logic lab=lo_s1}
C {devices/lab_pin.sym} 700 -1220 2 1 {name=p10 sig_type=std_logic lab=lo_s1f}
C {ook_receiver_pex.sym} 890 -1290 0 0 {name=x2}
C {devices/lab_pin.sym} 700 -1130 2 1 {name=p11 sig_type=std_logic lab=lnaf}
C {devices/lab_pin.sym} 700 -1180 2 1 {name=p12 sig_type=std_logic lab=vref0}
C {devices/lab_pin.sym} 700 -1170 2 1 {name=p13 sig_type=std_logic lab=vref1}
C {devices/lab_pin.sym} 700 -1160 2 1 {name=p14 sig_type=std_logic lab=vref3}
C {devices/lab_pin.sym} 700 -1150 2 1 {name=p15 sig_type=std_logic lab=vref2}
