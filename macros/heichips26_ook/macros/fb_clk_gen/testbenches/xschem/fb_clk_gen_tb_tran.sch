v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 1640 -1440 2440 -1040 {flags=graph
y1=-0.2
y2=1.4
ypos1=-0.2
ypos2=1.4
divy=5
subdivy=1
unity=1
x1=0
x2=2e-07
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="clk_i"
color="4"
dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=-1
linewidth_mult=4
digital=1
legend=1}
B 2 1640 -1000 2440 -600 {flags=graph
y1=-0.2
y2=1.4
ypos1=-0.2
ypos2=1.4
divy=5
subdivy=1
unity=1
x1=0
x2=1e-05
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="clk_i
clk_out"
color="4 10"
dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=-1
linewidth_mult=4
digital=1
legend=1}
B 2 1640 -560 2440 -160 {flags=graph
y1=-80
y2=10
ypos1=-80
ypos2=10
divy=5
subdivy=1
unity=1
x1=0
x2=3e+06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="clk_out_spectrum_db"
color="7"
dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=-1
linewidth_mult=1
digital=0
legend=1}
T {Testbench for transient analysis - fb_clk_gen (433.92MHz / 2 / 339)} 600 -1730 0 0 1 1 {}
N 120 -360 120 -320 {
lab=GND}
N 120 -720 120 -680 {
lab=VDD}
N 120 -620 120 -580 {
lab=GND}
N 120 -460 120 -420 {lab=clk_i}
N 1000 -560 1000 -540 {lab=VDD}
N 1000 -340 1000 -320 {lab=GND}
N 1100 -440 1220 -440 {lab=clk_out}
N 860 -440 900 -440 {lab=clk_i}
C {devices/vsource.sym} 120 -650 0 0 {name=VDD value="\{VDD\}"}
C {devices/gnd.sym} 120 -580 0 0 {name=l6 lab=GND}
C {devices/vdd.sym} 120 -720 0 0 {name=l8 lab=VDD}
C {devices/vsource.sym} 120 -390 0 0 {name=vclk value="pulse(0 \{VDD\} 0 10p 10p \{0.5/fclk\} \{1/fclk\})"
}
C {devices/lab_wire.sym} 120 -460 0 0 {name=p2 sig_type=std_logic lab=clk_i}
C {devices/gnd.sym} 120 -320 0 0 {name=l1 lab=GND}
C {devices/title-3.sym} 0 0 0 0 {name=l3 author="Belal Elshinnawey" rev=1.0 lock=true}
C {devices/launcher.sym} 1700 -1580 0 0 {name=h2
descr="Simulate"
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/launcher.sym} 1700 -1480 0 0 {name=h1
descr="Load waves"
tclcommand="xschem raw_read $netlist_dir/[file rootname [file tail [xschem get current_name]]].raw tran"
}
C {code_shown.sym} 60 -1510 0 0 {name=NGSPICE
only_toplevel=false
value="
.include ../../../netlist/xspice/fb_clk_gen.xspice
.param VDD=1.5
.param temp=27
.param fclk=433.92e6
.csparam fclk=fclk
.options savecurrents klu method=gear reltol=1e-4 abstol=1e-15 gmin=1e-15
.control

set num_threads=8

save all

* User Constants
let tstop = 1e-4
let tstep = 1/fclk

* Operating Point Analysis
op
remzerovec
write @schname\\\\.raw
set appendwrite

* Transient Analysis
tran $&tstep $&tstop
write @schname\\\\.raw

plot v(clk_i)
plot v(clk_i) v(clk_out)

* Writing Data
unset appendwrite
set wr_vecnames
set wr_singlescale
wrdata ../plot_simulations/data/@schname\\\\.txt clk_i clk_out
set appendwrite

let clk_out_fft = clk_out
linearize clk_out_fft
fft clk_out_fft
let clk_out_spectrum_db = db(mag(clk_out_fft))
write @schname\\\\.raw

plot clk_out_spectrum_db

*quit
.endc"}
C {devices/launcher.sym} 1700 -1530 0 0 {name=h3
descr="Annotate OP"
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/lab_wire.sym} 860 -440 0 0 {name=p10 sig_type=std_logic lab=clk_i}
C {devices/gnd.sym} 1000 -320 0 0 {name=l7 lab=GND}
C {devices/vdd.sym} 1000 -560 0 0 {name=l10 lab=VDD}
C {devices/code_shown.sym} 2000 -1590 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerDIO.lib dio_tt
"}
C {fb_clk_gen.sym} 1000 -440 0 0 {name=x1}
C {devices/lab_wire.sym} 1220 -440 0 1 {name=p14 sig_type=std_logic lab=clk_out}
