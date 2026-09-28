v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 1640 -1120 2440 -720 {flags=graph
y1=3600
y2=15600
ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1
x1=2.0e+08
x2=6.0e+08
divx=4
subdivx=8
xlabmag=1.0
ylabmag=1.0
node="Zin_re
Zin_im"
color="4 7"
dataset=-1
unitx=1
logx=0
logy=0
linewidth_mult=4}
P 4 5 700 -430 700 -220 860 -220 860 -430 700 -430 {}
P 4 6 890 -460 1260 -460 1260 -210 880 -210 880 -460 890 -460 {}
T {Filter} 1070 -490 0 0 0.4 0.4 {}
T {Matching Stub} 700 -460 0 0 0.4 0.4 {}
T {Receiver Side} 1260 -490 0 0 0.4 0.4 {}
T {50 ohm source} 530 -460 0 0 0.4 0.4 {}
N 1480 -1240 1480 -1200 {lab=VDD}
N 1480 -1140 1480 -1100 {lab=GND}
N 2120 -540 2120 -450 {lab=VDD}
N 2120 -350 2120 -310 {lab=GND}
N 2180 -400 2290 -400 {lab=vout}
N 650 -320 650 -290 {lab=GND}
N 1760 -520 1760 -490 {lab=GND}
N 1740 -590 1740 -470 {lab=GND}
N 1730 -590 1730 -460 {lab=VDD}
N 1750 -540 1750 -480 {lab=VDD}
N 1590 -400 1770 -400 {lab=#net1}
N 1590 -400 1590 -390 {lab=#net1}
N 1330 -390 1520 -390 {lab=#net1}
N 650 -390 650 -380 {lab=i_in}
N 1770 -300 1830 -300 {lab=#net2}
N 1830 -400 1830 -300 {lab=#net2}
N 1830 -400 2070 -400 {lab=#net2}
N 1030 -390 1030 -350 {lab=#net3}
N 1100 -390 1100 -350 {lab=#net3}
N 1050 -270 1050 -250 {lab=GND}
N 1030 -270 1050 -270 {lab=GND}
N 1030 -290 1030 -270 {lab=GND}
N 1100 -290 1100 -270 {lab=GND}
N 1050 -270 1100 -270 {lab=GND}
N 1200 -300 1200 -280 {lab=GND}
N 1200 -390 1200 -360 {lab=#net3}
N 950 -390 1030 -390 {lab=#net3}
N 550 -310 550 -290 {lab=GND}
N 550 -390 550 -370 {lab=i_in}
N 550 -390 650 -390 {lab=i_in}
N 650 -390 710 -390 {lab=i_in}
N 800 -390 800 -360 {lab=#net4}
N 770 -390 800 -390 {lab=#net4}
N 800 -390 890 -390 {lab=#net4}
N 800 -300 800 -270 {lab=GND}
N 1030 -390 1100 -390 {lab=#net3}
N 1200 -390 1270 -390 {lab=#net3}
N 1100 -390 1200 -390 {lab=#net3}
C {devices/code_shown.sym} 20 -1720 0 0 {name=NGSPICE
only_toplevel=true
value="
.param VDD=3.3
.param temp=27
.options savecurrents klu reltol=1e-4 abstol=1e-15 gmin=1e-15 rshunt=1e9

.control
let Rs = 50
let f_ism = 433.92e6

save all
op
print all
write @schname\\\\\\\\.raw
set appendwrite

ac lin 401 200e6 600e6

let Zin      = v(i_in)
let Zin_mag  = mag(Zin)
let Zin_re   = real(Zin)
let Zin_im   = imag(Zin)
let Zin_ph   = 180/PI*cphase(Zin)

let Zpin     = v(net1)
let Zpin_mag = mag(Zpin)
let Zpin_re  = real(Zpin)
let Zpin_im  = imag(Zpin)

let Gam    = (Zin - Rs)/(Zin + Rs)
let Gmag   = mag(Gam)
let S11_dB = db(Gmag)
let ML_dB  = -10*log10(1 - Gmag*Gmag)

remzerovec
write @schname\\\\\\\\.raw
unset appendwrite

meas ac Zmag_ism find Zin_mag  when frequency=$&f_ism
meas ac Zre_ism  find Zin_re   when frequency=$&f_ism
meas ac Zim_ism  find Zin_im   when frequency=$&f_ism
meas ac Zph_ism  find Zin_ph   when frequency=$&f_ism

meas ac Zpre_ism find Zpin_re  when frequency=$&f_ism
meas ac Zpim_ism find Zpin_im  when frequency=$&f_ism

meas ac S11_ism  find S11_dB   when frequency=$&f_ism
meas ac ML_ism   find ML_dB    when frequency=$&f_ism

echo
echo   Zin  magnitude = $&Zmag_ism ohm
echo   Zin  real      = $&Zre_ism ohm
echo   Zin  imag      = $&Zim_ism ohm
echo   Zin  phase     = $&Zph_ism deg
echo
echo   Zpin real      = $&Zpre_ism ohm
echo   Zpin imag      = $&Zpim_ism ohm
echo
echo   S11            = $&S11_ism dB
echo   mismatch loss  = $&ML_ism dB
echo

plot Zin_re Zin_im xlimit 200e6 600e6 ylabel 'Zin real / imag [ohm]' xlabel 'Frequency [Hz]'

.endc"}
C {devices/launcher.sym} 1700 -1280 0 0 {name=h2
descr="Simulate"
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {title-3.sym} 0 0 0 0 {name=l2 author="Belal Elshinnawey" rev=1.0 lock=true}
C {devices/launcher.sym} 1700 -1160 0 0 {name=h1
descr="Load waves"
tclcommand="xschem raw_read $netlist_dir/[file rootname [file tail [xschem get current_name]]].raw ac"
}
C {devices/launcher.sym} 1700 -1220 0 0 {name=h3
descr="Annotate OP"
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/code_shown.sym} 1040 -1730 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerDIO.lib dio_tt
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/macros/ook_analog_system/netlist/pex/lna_magic_pex_3.spice
.include /home/belal/HeiChips/heichips26-on-off/IHP-Open-PDK/ihp-sg13cmos5l/libs.ref/sg13cmos5l_io/spice/sg13cmos5l_io.spi
"}
C {devices/vsource.sym} 1480 -1170 0 0 {name=VDD1 value=\{VDD\}}
C {devices/gnd.sym} 1480 -1100 0 0 {name=l8 lab=GND}
C {vdd.sym} 1480 -1240 0 0 {name=l9 lab=VDD}
C {devices/gnd.sym} 650 -290 0 0 {name=l13 lab=GND}
C {vdd.sym} 2120 -540 0 0 {name=l17 lab=VDD}
C {devices/gnd.sym} 2120 -310 0 0 {name=l18 lab=GND}
C {devices/lab_pin.sym} 670 -390 3 1 {name=l1 sig_type=std_logic lab=i_in}
C {devices/lab_pin.sym} 2290 -400 0 1 {name=l7 sig_type=std_logic lab=vout
}
C {isource.sym} 650 -350 2 0 {name=I0 value="dc 0 ac 1"}
C {lna_pex.sym} 2120 -400 0 0 {name=x1}
C {sg13cmos5l_IOPadAnalog.sym} 1420 -500 1 0 {name=x2}
C {devices/gnd.sym} 1760 -520 2 1 {name=l3 lab=GND}
C {vdd.sym} 1750 -540 0 1 {name=l4 lab=VDD}
C {devices/gnd.sym} 1740 -590 2 1 {name=l5 lab=GND}
C {vdd.sym} 1730 -590 0 1 {name=l19 lab=VDD}
C {capa.sym} 1300 -390 3 0 {name=Cb1
m=1
value=1p
footprint=1206
device="ceramic capacitor"
}
C {capa.sym} 1030 -320 2 0 {name=C2
m=1
value=1n
footprint=1206
device="ceramic capacitor"}
C {ind.sym} 1100 -320 0 0 {name=L12
m=1
value=134.5p
footprint=1206
device=inductor}
C {devices/gnd.sym} 1050 -250 0 0 {name=l20 lab=GND}
C {capa.sym} 920 -390 3 0 {name=C1
m=1
value=0.558p
footprint=1206
device="ceramic capacitor"}
C {ind.sym} 1200 -330 0 0 {name=L6
m=1
value=138.95n
footprint=1206
device=inductor}
C {devices/gnd.sym} 1200 -280 0 0 {name=l10 lab=GND}
C {res.sym} 550 -340 0 0 {name=RBIAS value=10meg footprint=1206 device=resistor m=1}
C {devices/gnd.sym} 550 -290 0 0 {name=l11 lab=GND}
C {capa.sym} 740 -390 1 0 {name=C3
m=1
value=10.02p
footprint=1206
device="ceramic capacitor"}
C {ind.sym} 800 -330 0 0 {name=L14
m=1
value=17.56n
footprint=1206
device=inductor}
C {devices/gnd.sym} 800 -270 0 0 {name=l15 lab=GND}
