-- sch_path: /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook/macros/ook_analog_system/testbenches/xschem/charge_pump_tb_tran.sch
entity charge_pump_tb_tran is
port(
  vout : inout std_logic
);
end charge_pump_tb_tran ;

architecture arch_charge_pump_tb_tran of charge_pump_tb_tran is

component output_buffer_pex 
port (
  vout_fb : out std_logic ;
  vctrl : in std_logic ;
  VDD : inout std_logic ;
  vin : in std_logic ;
  vout : out std_logic ;
  VSS : inout std_logic ;
  vctrl_b : in std_logic
);
end component ;

component vco_pex 
port (
  vout : out std_logic ;
  VDD : inout std_logic ;
  VSS : inout std_logic ;
  VCL : in std_logic
);
end component ;

component dac 
port (
  VPWR : inout std_logic ;
  VGND : inout std_logic ;
  dac_out : out std_logic ;
  rst_ni : in std_logic ;
  clk_ref : in std_logic ;
  clk_fb : in std_logic
);
end component ;


signal VDD : std_logic ;
signal VDD2 : std_logic := '{1.2}' ;
signal vcl : std_logic ;
signal CLK_REF : std_logic ;
signal net1 : std_logic ;
signal net2 : std_logic ;
signal GND : std_logic := '{1.2}' ;
signal CLK_FB : std_logic ;
begin
VCLKREF : vsource
generic map (
   value => PULSE(0 {VDD} 0 0.5n 0.5n {0.5/FREQ_REF} {1/FREQ_REF})
)
port map (
   p => CLK_REF ,
   m => GND
);

VDDSRC : vsource
generic map (
   value => {VDD}
)
port map (
   p => VDD ,
   m => GND
);

x4 : output_buffer_pex
port map (
   vout_fb => CLK_FB ,
   vctrl => VDD ,
   VDD => VDD ,
   vin => net1 ,
   vout => vout ,
   VSS => GND ,
   vctrl_b => GND
);

x1 : vco_pex
port map (
   vout => net1 ,
   VDD => VDD ,
   VSS => GND ,
   VCL => vcl
);

VDDSRC1 : vsource
generic map (
   value => {2}
)
port map (
   p => VDD2 ,
   m => GND
);

x7 : dac
port map (
   VPWR => VDD ,
   VGND => GND ,
   dac_out => net2 ,
   rst_ni => VDD ,
   clk_ref => CLK_REF ,
   clk_fb => CLK_FB
);

R1 : res
generic map (
   value => 50000 ,
   footprint => 1206 ,
   device => resistor ,
   m => 1
)
port map (
   P => vcl ,
   M => net2
);


.param VDD=1.5
.param FREQ_REF=80e6
.param FREQ_FB=600e6
.options klu reltol=1e-3 abstol=1e-12 vntol=1e-6 gmin=1e-9 rshunt=1e12
.save vout UPLV DNLV CLK_FB vcl i(x5.xc2.c1)
.tran 100p 150u 0 100p


.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerDIO.lib dio_tt
.lib cornerCAP.lib cap_typ
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook/macros/ook_analog_system/netlist/pex/charge_pump_magic_pex_3.spice
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook/macros/pfd/netlist/xspice/pfd.xspice
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook/macros/dac/netlist/xspice/dac.xspice
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook/macros/ook_analog_system/netlist/pex/vco_magic_pex_3.spice
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook/macros/ook_analog_system/netlist/pex/output_buffer_magic_pex_3.spice
.include /home/belal/HeiChips/heichips26-on-off/IHP-Open-PDK/ihp-sg13cmos5l/libs.tech/ngspice/models/cap_mfringe.lib


end arch_charge_pump_tb_tran ;

