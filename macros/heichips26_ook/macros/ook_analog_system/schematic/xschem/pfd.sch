v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 420 -1090 450 -1090 {lab=CLK_REF}
N 420 -1050 450 -1050 {lab=RESET_N}
N 420 -900 450 -900 {lab=CLK_FB}
N 420 -860 450 -860 {lab=RESET_N}
N 420 -880 450 -880 {lab=VDD}
N 400 -1070 450 -1070 {lab=VDD}
N 630 -1090 690 -1090 {lab=#net1}
N 690 -1120 690 -1090 {lab=#net1}
N 630 -900 670 -900 {lab=DN}
N 670 -900 670 -790 {lab=DN}
N 870 -930 880 -930 {lab=DN}
N 880 -930 880 -790 {lab=DN}
N 690 -1120 880 -1120 {lab=#net1}
N 670 -790 880 -790 {lab=DN}
N 880 -1120 880 -970 {lab=#net1}
N 870 -970 880 -970 {lab=#net1}
N 720 -950 750 -950 {lab=RESET_N}
N 630 -1070 670 -1070 {lab=UP}
N 650 -880 650 -860 {lab=#net2}
N 630 -880 650 -880 {lab=#net2}
N 880 -790 930 -790 {lab=DN}
C {title-3.sym} 0 0 0 0 {name=l1 author="Belal Elshinnawey" rev=1.0 lock=true}
C {devices/iopin.sym} 400 -1070 2 0 {name=p6 lab=VDD}
C {devices/iopin.sym} 320 -970 2 0 {name=p7 lab=VSS}
C {devices/ipin.sym} 420 -1090 0 0 {name=p8 lab=CLK_REF}
C {devices/ipin.sym} 420 -900 0 0 {name=p11 lab=CLK_FB}
C {devices/lab_pin.sym} 420 -860 0 0 {name=lp6 sig_type=std_logic lab=RESET_N}
C {devices/lab_pin.sym} 420 -880 0 0 {name=lp1 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 720 -950 0 0 {name=lp8 sig_type=std_logic lab=RESET_N}
C {devices/lab_pin.sym} 420 -1050 0 0 {name=lp9 sig_type=std_logic lab=RESET_N}
C {devices/iopin.sym} 930 -790 0 0 {name=p1 lab=DN}
C {sg13cmos5l_stdcells/sg13cmos5l_dfrbp_1.sym} 540 -1070 0 0 {name=x1 VDD=VDD VSS=VSS prefix=sg13cmos5l_ }
C {sg13cmos5l_stdcells/sg13cmos5l_dfrbp_1.sym} 540 -880 0 0 {name=x2 VDD=VDD VSS=VSS prefix=sg13cmos5l_ }
C {devices/iopin.sym} 670 -1070 0 0 {name=p4 lab=UP}
C {noconn.sym} 650 -860 3 0 {name=l2}
C {sg13cmos5l_stdcells/sg13cmos5l_nand2_1.sym} 810 -950 2 0 {name=x3 VDD=VDD VSS=VSS prefix=sg13cmos5l_ }
