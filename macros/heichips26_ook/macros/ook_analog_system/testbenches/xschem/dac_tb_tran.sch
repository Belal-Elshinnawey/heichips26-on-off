v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 880 -1240 920 -1240 {lab=CLK_REF}
N 880 -1210 920 -1210 {lab=CLK_FB}
N 150 -880 150 -860 {lab=CLK_REF}
N 150 -800 150 -770 {lab=GND}
N 150 -1050 150 -1030 {lab=VDD}
N 150 -970 150 -940 {lab=GND}
N 880 -1180 880 -1160 {lab=VDD}
N 880 -1180 920 -1180 {lab=VDD}
N 1660 -1230 1840 -1230 {lab=#net1}
N 1540 -1320 1540 -1280 {lab=VDD}
N 1540 -1170 1540 -1130 {lab=GND}
N 1390 -1210 1420 -1210 {lab=vcl}
N 1840 -1100 1880 -1100 {lab=CLK_FB}
N 1880 -1150 1880 -1100 {lab=CLK_FB}
N 1950 -1200 2020 -1200 {lab=vout}
N 1890 -1300 1890 -1250 {lab=VDD}
N 1920 -1170 1920 -1140 {lab=GND}
N 1780 -1200 1840 -1200 {lab=VDD}
N 1760 -1170 1760 -1150 {lab=GND}
N 1760 -1170 1840 -1170 {lab=GND}
N 170 -1280 170 -1260 {lab=VDD2}
N 170 -1200 170 -1170 {lab=GND}
N 1010 -1290 1010 -1280 {lab=VDD}
N 1290 -1210 1310 -1210 {lab=vcl}
N 1290 -1210 1290 -1180 {lab=vcl}
N 1190 -1210 1290 -1210 {lab=vcl}
N 1290 -1120 1290 -1100 {lab=GND}
N 1010 -1070 1010 -1040 {lab=GND}
N 1100 -1210 1130 -1210 {lab=#net2}
N 900 -1150 900 -1070 {lab=VDD}
N 900 -1150 920 -1150 {lab=VDD}
N 920 -1110 920 -1090 {lab=GND}
C {devices/lab_pin.sym} 880 -1240 0 0 {name=lpclkref sig_type=std_logic lab=CLK_REF}
C {devices/lab_pin.sym} 880 -1210 0 0 {name=lpclkfb sig_type=std_logic lab=CLK_FB}
C {devices/vsource.sym} 150 -830 0 0 {name=VCLKREF value="PULSE(0 \{VDD\} 0 0.5n 0.5n \{0.5/FREQ_REF\} \{1/FREQ_REF\})"}
C {devices/lab_pin.sym} 150 -880 0 0 {name=lpclkref1 sig_type=std_logic lab=CLK_REF}
C {devices/gnd.sym} 150 -770 0 0 {name=lgnd3 lab=GND}
C {devices/vsource.sym} 150 -1000 0 0 {name=VDDSRC value=\{VDD\}}
C {vdd.sym} 150 -1050 0 0 {name=lvddb lab=VDD}
C {devices/gnd.sym} 150 -940 0 0 {name=lgnd5 lab=GND}
C {devices/code_shown.sym} 1750 -980 0 0 {name=NGSPICE
only_toplevel=true
value="
.param VDD=1.5
.param FREQ_REF=80e6
.options klu reltol=1e-3 abstol=1e-12 vntol=1e-6 gmin=1e-9 rshunt=1e12
.save vout CLK_FB vcl
.tran 100p 150u 0 100p 
"}
C {devices/code_shown.sym} -40 -2020 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerDIO.lib dio_tt
.lib cornerCAP.lib cap_typ
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook/macros/dac/netlist/xspice/dac.xspice
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook/macros/ook_analog_system/netlist/pex/vco_magic_pex_3.spice
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook/macros/ook_analog_system/netlist/pex/output_buffer_magic_pex_3.spice
.include /home/belal/HeiChips/heichips26-on-off/IHP-Open-PDK/ihp-sg13cmos5l/libs.tech/ngspice/models/cap_mfringe.lib

"}
C {devices/launcher.sym} 1300 -1000 0 0 {name=h2
descr="Simulate"
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/launcher.sym} 1300 -940 0 0 {name=h1
descr="Load waves"
tclcommand="xschem raw_read $netlist_dir/[file rootname [file tail [xschem get current_name]]].raw tran"
}
C {title-3.sym} 0 0 0 0 {name=l2 author="Belal Elshinnawey" rev=1.0 lock=true}
C {vdd.sym} 880 -1160 2 0 {name=lvdd1 lab=VDD}
C {vdd.sym} 1540 -1320 0 0 {name=lvdd2 lab=VDD}
C {devices/gnd.sym} 1540 -1130 0 0 {name=lgnd1 lab=GND}
C {devices/lab_pin.sym} 1840 -1100 0 0 {name=lpclkfb2 sig_type=std_logic lab=CLK_FB}
C {output_buffer_pex.sym} 1890 -1080 0 0 {name=x4}
C {vco_pex.sym} 1530 -1230 0 0 {name=x1}
C {devices/iopin.sym} 2020 -1200 0 0 {name=pvout1 lab=vout}
C {devices/gnd.sym} 1920 -1140 0 0 {name=lgnd4 lab=GND}
C {devices/gnd.sym} 1760 -1150 0 0 {name=lgnd7 lab=GND}
C {vdd.sym} 1890 -1300 0 0 {name=lvdd6 lab=VDD}
C {vdd.sym} 1780 -1200 3 0 {name=lvdd7 lab=VDD}
C {devices/lab_pin.sym} 1390 -1210 0 0 {name=lpclkfb1 sig_type=std_logic lab=vcl}
C {devices/lab_pin.sym} 1310 -1210 2 0 {name=lpclkfb3 sig_type=std_logic lab=vcl}
C {devices/vsource.sym} 170 -1230 0 0 {name=VDDSRC1 value=\{2\}}
C {vdd.sym} 170 -1280 0 0 {name=lvddb1 lab=VDD2
value=\{1.2\}}
C {devices/gnd.sym} 170 -1170 0 0 {name=lgnd8 lab=GND
value=\{1.2\}}
C {/home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook/macros/dac/schematic/xschem/dac.sym} 1010 -1160 0 0 {name=x7}
C {vdd.sym} 1010 -1290 0 0 {name=lvdd3 lab=VDD}
C {devices/gnd.sym} 1010 -1040 0 0 {name=lgnd2 lab=GND}
C {res.sym} 1160 -1210 1 0 {name=R1
value=250k
footprint=1206
device=resistor
m=1}
C {capa.sym} 1290 -1150 0 0 {name=C1
m=1
value=12p
footprint=1206
device="ceramic capacitor"
spice_ignore=false}
C {devices/gnd.sym} 1290 -1100 0 0 {name=lgnd6 lab=GND}
C {vdd.sym} 900 -1070 2 0 {name=lvdd4 lab=VDD}
C {devices/gnd.sym} 920 -1090 0 0 {name=lgnd9 lab=GND}
