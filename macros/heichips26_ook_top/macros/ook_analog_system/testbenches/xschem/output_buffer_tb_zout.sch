v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
P 4 7 1840 -780 1970 -780 1970 -560 1820 -560 1820 -780 1850 -780 1840 -780 {}
P 4 6 1980 -780 2290 -780 2290 -530 1990 -530 1980 -530 1980 -780 {}
T {output match} 1820 -810 0 0 0.4 0.4 {}
T {output Filter} 2070 -530 0 0 0.4 0.4 {}
T {50 Ohm load} 2310 -750 0 0 0.4 0.4 {}
N 90 -220 90 -180 {lab=VDD}
N 90 -120 90 -80 {lab=GND}
N 1200 -710 1200 -670 {lab=VDD}
N 1230 -590 1230 -500 {lab=GND}
N 2210 -890 2210 -860 {lab=GND}
N 1070 -620 1150 -620 {lab=VDD}
N 1190 -570 1190 -540 {lab=#net1}
N 2140 -890 2140 -860 {lab=GND}
N 950 -650 1160 -650 {lab=VDD}
N 950 -680 950 -650 {lab=VDD}
N 930 -650 950 -650 {lab=VDD}
N 1870 -710 1870 -680 {lab=#net2}
N 1870 -620 1870 -590 {lab=GND}
N 1110 -590 1110 -560 {lab=GND}
N 1110 -590 1150 -590 {lab=GND}
N 1380 -840 1380 -810 {lab=GND}
N 1400 -910 1400 -790 {lab=GND}
N 1410 -910 1410 -780 {lab=VDD}
N 1390 -860 1390 -800 {lab=VDD}
N 1370 -720 1550 -720 {lab=#net2}
N 1550 -720 1550 -710 {lab=#net2}
N 2210 -970 2220 -970 {lab=vout}
N 2140 -970 2140 -950 {lab=vout}
N 1550 -710 1870 -710 {lab=#net2}
N 2210 -970 2210 -950 {lab=vout}
N 2140 -970 2210 -970 {lab=vout}
N 1870 -710 1900 -710 {lab=#net2}
N 1960 -710 1980 -710 {lab=#net3}
N 1260 -620 1370 -620 {lab=#net4}
N 2260 -710 2310 -710 {lab=vout}
N 2040 -710 2070 -710 {lab=#net5}
N 2190 -710 2190 -670 {lab=vout}
N 2130 -710 2190 -710 {lab=vout}
N 2260 -710 2260 -670 {lab=vout}
N 2190 -710 2260 -710 {lab=vout}
N 2210 -590 2210 -570 {lab=GND}
N 2190 -590 2210 -590 {lab=GND}
N 2190 -610 2190 -590 {lab=GND}
N 2260 -610 2260 -590 {lab=GND}
N 2210 -590 2260 -590 {lab=GND}
C {devices/code_shown.sym} 0 -1650 0 0 {name=NGSPICE
only_toplevel=true
value="
.param VDD=1.5
.csparam VDD=VDD
.param temp=27
.options savecurrents reltol=1e-3 abstol=1e-12 gmin=1e-9 trtol=25 itl1=200 itl4=50 rshunt=1e9
.control

shell rm -f @schname\\\\.raw
shell rm -f ../plot_simulations/data/@schname\\\\.txt
shell rm -f ../plot_simulations/data/@schname\\\\_433p92MHz.txt

save all
set wr_vecnames
set wr_singlescale

op
write @schname\\\\.raw
set appendwrite
ac lin 200 200e6 600e6
write @schname\\\\.raw
let zout = -v(vout)
print zout[0]
plot real(zout) imag(zout) xlimit 200e6 600e6
wrdata ../plot_simulations/data/@schname\\\\.txt mag(zout) phase(zout) real(zout) imag(zout)

ac lin 1 433.92meg 433.92meg
write @schname\\\\.raw
let zout_433 = -v(vout)
print zout_433
wrdata ../plot_simulations/data/@schname\\\\_433p92MHz.txt mag(zout_433) phase(zout_433) real(zout_433) imag(zout_433)

unset appendwrite

*quit
.endc
"}
C {devices/launcher.sym} 1700 -1410 0 0 {name=h2
descr="Simulate"
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {title-3.sym} 0 0 0 0 {name=l2 author="Belal ELshinnawey" rev=1.0 lock=true}
C {devices/launcher.sym} 1700 -1290 0 0 {name=h1
descr="Load waves"
tclcommand="xschem raw_read $netlist_dir/[file rootname [file tail [xschem get current_name]]].raw ac"
}
C {devices/launcher.sym} 1700 -1350 0 0 {name=h3
descr="Annotate OP"
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/vsource.sym} 90 -150 0 0 {name=VDD value=\{VDD\}}
C {devices/gnd.sym} 90 -80 0 0 {name=l3 lab=GND}
C {vdd.sym} 90 -220 0 0 {name=l7 lab=VDD}
C {devices/lab_pin.sym} 2220 -970 0 1 {name=l12 sig_type=std_logic lab=vout}
C {devices/code_shown.sym} 1530 -1710 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerDIO.lib dio_tt
.lib cornerCAP.lib cap_typ
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/macros/ook_analog_system/netlist/pex/output_buffer_magic_pex_3.spice
.include /home/belal/HeiChips/heichips26-on-off/IHP-Open-PDK/ihp-sg13cmos5l/libs.ref/sg13cmos5l_io/spice/sg13cmos5l_io.spi
"}
C {devices/gnd.sym} 1230 -500 0 0 {name=l6 lab=GND}
C {vdd.sym} 1200 -710 0 0 {name=l9 lab=VDD}
C {devices/lab_pin.sym} 1070 -620 0 0 {name=l10 sig_type=std_logic lab=VDD}
C {noconn.sym} 1190 -540 0 0 {name=l4}
C {devices/isource.sym} 2140 -920 0 0 {name=IAC_PROBE value="ac 1"}
C {devices/gnd.sym} 2140 -860 0 0 {name=l21 lab=GND}
C {res.sym} 2210 -920 0 0 {name=RBIAS value=10meg footprint=1206 device=resistor m=1}
C {devices/gnd.sym} 2210 -860 0 0 {name=l22 lab=GND}
C {vdd.sym} 950 -680 0 0 {name=l14 lab=VDD}
C {ind.sym} 1930 -710 3 0 {name=L1
m=1
value=58n
footprint=1206
device=inductor}
C {capa.sym} 1870 -650 0 0 {name=C3
m=1
value=1.8p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 1870 -590 0 0 {name=l16 lab=GND}
C {devices/gnd.sym} 1110 -560 0 0 {name=l15 lab=GND}
C {output_buffer_pex.sym} 1200 -500 0 0 {name=x2}
C {sg13cmos5l_IOPadAnalog.sym} 1720 -820 3 1 {name=x1}
C {devices/gnd.sym} 1380 -840 2 0 {name=l13 lab=GND}
C {vdd.sym} 1390 -860 0 0 {name=l17 lab=VDD}
C {devices/gnd.sym} 1400 -910 2 0 {name=l18 lab=GND}
C {vdd.sym} 1410 -910 0 0 {name=l19 lab=VDD}
C {devices/lab_pin.sym} 2310 -710 0 1 {name=l5 sig_type=std_logic lab=vout}
C {ind.sym} 2010 -710 3 0 {name=L8
m=1
value=2.75u
footprint=1206
device=inductor}
C {capa.sym} 2100 -710 1 0 {name=C1
m=1
value=48f
footprint=1206
device="ceramic capacitor"}
C {capa.sym} 2190 -640 2 0 {name=C2
m=1
value=0.89n
footprint=1206
device="ceramic capacitor"}
C {ind.sym} 2260 -640 0 0 {name=L11
m=1
value=151p
footprint=1206
device=inductor}
C {devices/gnd.sym} 2210 -570 0 0 {name=l20 lab=GND}
C {devices/gnd.sym} 930 -610 0 0 {name=l23 lab=GND}
