-- sch_path: /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/macros/ook_analog_system/schematic/xschem/simple_comparator.sch
entity simple_comparator is
port(
  comp_out : out std_logic ;
  VDD : inout std_logic ;
  VSS : inout std_logic ;
  VDDL : inout std_logic ;
  vin :  in std_logic ;
  vref :  in std_logic
);
end simple_comparator ;

architecture arch_simple_comparator of simple_comparator is


signal vbias : std_logic ;
signal outn : std_logic ;
signal net1 : std_logic ;
signal net2 : std_logic ;
signal net3 : std_logic ;
signal net4 : std_logic ;
begin
MBIAS : sg13_hv_pmos
generic map (
   l => 5.0e-07 ,
   w => 4.0e-06 ,
   ng => 1 ,
   m => 1 ,
   mm_ok => 1 ,
   model => sg13_hv_pmos ,
   spiceprefix => X
)
port map (
   D => vbias ,
   G => vbias ,
   S => VDD ,
   B => VDD
);

RBIAS : rhigh_ps
generic map (
   w => 2.0e-6 ,
   l => 9.27E-6 ,
   model => rhigh ,
   body => VSS ,
   spiceprefix => X ,
   b => 15 ,
   ps => 0.18E-6 ,
   m => 1 ,
   mm_ok => 1 ,
   value => expr_eng(  ( 1.6e-4 / @w + 1360.0 * ( (@b + 1)* @l + ( 1.081*( @w - 0.04e-6 ) + 0.18e-6 )*@b ) / ( @w - 0.04e-6 ) ) / @m  )
)
port map (
   P => vbias ,
   M => VSS
);

M3P : sg13_hv_pmos
generic map (
   l => 5.0e-07 ,
   w => 4.0e-06 ,
   ng => 1 ,
   m => 1 ,
   mm_ok => 1 ,
   model => sg13_hv_pmos ,
   spiceprefix => X
)
port map (
   D => net4 ,
   G => vbias ,
   S => VDD ,
   B => VDD
);

M1P : sg13_hv_pmos
generic map (
   l => 5.0e-07 ,
   w => 4.0e-06 ,
   ng => 1 ,
   m => 4 ,
   mm_ok => 1 ,
   model => sg13_hv_pmos ,
   spiceprefix => X
)
port map (
   D => outn ,
   G => vin ,
   S => net4 ,
   B => VDD
);

M2P : sg13_hv_pmos
generic map (
   l => 5.0e-07 ,
   w => 4.0e-06 ,
   ng => 1 ,
   m => 4 ,
   mm_ok => 1 ,
   model => sg13_hv_pmos ,
   spiceprefix => X
)
port map (
   D => net1 ,
   G => vref ,
   S => net4 ,
   B => VDD
);

M4N : sg13_hv_nmos
generic map (
   l => 5.0e-07 ,
   w => 2.0e-06 ,
   ng => 1 ,
   m => 4 ,
   mm_ok => 1 ,
   model => sg13_hv_nmos ,
   spiceprefix => X
)
port map (
   D => outn ,
   G => outn ,
   S => VSS ,
   B => VSS
);

M5N : sg13_hv_nmos
generic map (
   l => 5.0e-07 ,
   w => 2.0e-06 ,
   ng => 1 ,
   m => 4 ,
   mm_ok => 1 ,
   model => sg13_hv_nmos ,
   spiceprefix => X
)
port map (
   D => net1 ,
   G => outn ,
   S => VSS ,
   B => VSS
);

MP1 : sg13_hv_pmos
generic map (
   l => 4.5e-07 ,
   w => 8.0e-06 ,
   ng => 1 ,
   m => 1 ,
   mm_ok => 1 ,
   model => sg13_hv_pmos ,
   spiceprefix => X
)
port map (
   D => net2 ,
   G => net1 ,
   S => VDD ,
   B => VDD
);

MN1 : sg13_hv_nmos
generic map (
   l => 4.5e-07 ,
   w => 4.0e-06 ,
   ng => 1 ,
   m => 1 ,
   mm_ok => 1 ,
   model => sg13_hv_nmos ,
   spiceprefix => X
)
port map (
   D => net2 ,
   G => net1 ,
   S => VSS ,
   B => VSS
);

MP2 : sg13_lv_pmos
generic map (
   l => 1.3e-07 ,
   w => 8.0e-06 ,
   ng => 1 ,
   m => 1 ,
   mm_ok => 1 ,
   model => sg13_lv_pmos ,
   spiceprefix => X
)
port map (
   D => comp_out ,
   G => net3 ,
   S => VDDL ,
   B => VDDL
);

MBIAS1 : sg13_hv_pmos
generic map (
   l => 5.0e-07 ,
   w => 4.0e-06 ,
   ng => 1 ,
   m => 1 ,
   mm_ok => 1 ,
   model => sg13_hv_pmos ,
   spiceprefix => X
)
port map (
   D => vbias ,
   G => vbias ,
   S => vbias ,
   B => VDD
);

MBIAS2 : sg13_hv_pmos
generic map (
   l => 5.0e-07 ,
   w => 4.0e-06 ,
   ng => 1 ,
   m => 1 ,
   mm_ok => 1 ,
   model => sg13_hv_pmos ,
   spiceprefix => X
)
port map (
   D => VDD ,
   G => VDD ,
   S => VDD ,
   B => VDD
);

M1 : sg13_hv_pmos
generic map (
   l => 5.0e-07 ,
   w => 4.0e-06 ,
   ng => 1 ,
   m => 1 ,
   mm_ok => 1 ,
   model => sg13_hv_pmos ,
   spiceprefix => X
)
port map (
   D => VDD ,
   G => VDD ,
   S => VDD ,
   B => VDD
);

M2 : sg13_hv_pmos
generic map (
   l => 5.0e-07 ,
   w => 4.0e-06 ,
   ng => 1 ,
   m => 1 ,
   mm_ok => 1 ,
   model => sg13_hv_pmos ,
   spiceprefix => X
)
port map (
   D => net4 ,
   G => net4 ,
   S => net4 ,
   B => VDD
);

MP3 : sg13_hv_pmos
generic map (
   l => 4.5e-07 ,
   w => 8.0e-06 ,
   ng => 1 ,
   m => 1 ,
   mm_ok => 1 ,
   model => sg13_hv_pmos ,
   spiceprefix => X
)
port map (
   D => net2 ,
   G => net2 ,
   S => net2 ,
   B => VDD
);

MP4 : sg13_hv_pmos
generic map (
   l => 4.5e-07 ,
   w => 8.0e-06 ,
   ng => 1 ,
   m => 1 ,
   mm_ok => 1 ,
   model => sg13_hv_pmos ,
   spiceprefix => X
)
port map (
   D => VDD ,
   G => VDD ,
   S => VDD ,
   B => VDD
);

MP5 : sg13_lv_pmos
generic map (
   l => 1.3e-07 ,
   w => 8.0e-06 ,
   ng => 1 ,
   m => 1 ,
   mm_ok => 1 ,
   model => sg13_lv_pmos ,
   spiceprefix => X
)
port map (
   D => VDDL ,
   G => VDDL ,
   S => VDDL ,
   B => VDDL
);

MP6 : sg13_lv_pmos
generic map (
   l => 1.3e-07 ,
   w => 8.0e-06 ,
   ng => 1 ,
   m => 1 ,
   mm_ok => 1 ,
   model => sg13_lv_pmos ,
   spiceprefix => X
)
port map (
   D => comp_out ,
   G => comp_out ,
   S => comp_out ,
   B => VDDL
);

MN3 : sg13_lv_nmos
generic map (
   l => 1.3e-07 ,
   w => 4.0e-06 ,
   ng => 1 ,
   m => 1 ,
   mm_ok => 1 ,
   model => sg13_lv_nmos ,
   spiceprefix => X
)
port map (
   D => comp_out ,
   G => comp_out ,
   S => comp_out ,
   B => VSS
);

MN4 : sg13_lv_nmos
generic map (
   l => 1.3e-07 ,
   w => 4.0e-06 ,
   ng => 1 ,
   m => 1 ,
   mm_ok => 1 ,
   model => sg13_lv_nmos ,
   spiceprefix => X
)
port map (
   D => VSS ,
   G => VSS ,
   S => VSS ,
   B => VSS
);

MN5 : sg13_hv_nmos
generic map (
   l => 4.5e-07 ,
   w => 4.0e-06 ,
   ng => 1 ,
   m => 1 ,
   mm_ok => 1 ,
   model => sg13_hv_nmos ,
   spiceprefix => X
)
port map (
   D => net2 ,
   G => net2 ,
   S => net2 ,
   B => VSS
);

MN6 : sg13_hv_nmos
generic map (
   l => 4.5e-07 ,
   w => 4.0e-06 ,
   ng => 1 ,
   m => 1 ,
   mm_ok => 1 ,
   model => sg13_hv_nmos ,
   spiceprefix => X
)
port map (
   D => VSS ,
   G => VSS ,
   S => VSS ,
   B => VSS
);

M3 : sg13_hv_pmos
generic map (
   l => 5.0e-07 ,
   w => 4.0e-06 ,
   ng => 1 ,
   m => 1 ,
   mm_ok => 1 ,
   model => sg13_hv_pmos ,
   spiceprefix => X
)
port map (
   D => net4 ,
   G => net4 ,
   S => net4 ,
   B => VDD
);

M4 : sg13_hv_pmos
generic map (
   l => 5.0e-07 ,
   w => 4.0e-06 ,
   ng => 1 ,
   m => 1 ,
   mm_ok => 1 ,
   model => sg13_hv_pmos ,
   spiceprefix => X
)
port map (
   D => outn ,
   G => outn ,
   S => outn ,
   B => VDD
);

M5 : sg13_hv_nmos
generic map (
   l => 5.0e-07 ,
   w => 2.0e-06 ,
   ng => 1 ,
   m => 1 ,
   mm_ok => 1 ,
   model => sg13_hv_nmos ,
   spiceprefix => X
)
port map (
   D => net1 ,
   G => net1 ,
   S => net1 ,
   B => VSS
);

M6 : sg13_hv_nmos
generic map (
   l => 5.0e-07 ,
   w => 2.0e-06 ,
   ng => 1 ,
   m => 1 ,
   mm_ok => 1 ,
   model => sg13_hv_nmos ,
   spiceprefix => X
)
port map (
   D => VSS ,
   G => VSS ,
   S => VSS ,
   B => VSS
);

M7 : sg13_hv_pmos
generic map (
   l => 5.0e-07 ,
   w => 4.0e-06 ,
   ng => 1 ,
   m => 1 ,
   mm_ok => 1 ,
   model => sg13_hv_pmos ,
   spiceprefix => X
)
port map (
   D => net4 ,
   G => net4 ,
   S => net4 ,
   B => VDD
);

M8 : sg13_hv_pmos
generic map (
   l => 5.0e-07 ,
   w => 4.0e-06 ,
   ng => 1 ,
   m => 1 ,
   mm_ok => 1 ,
   model => sg13_hv_pmos ,
   spiceprefix => X
)
port map (
   D => net1 ,
   G => net1 ,
   S => net1 ,
   B => VDD
);

M9 : sg13_hv_nmos
generic map (
   l => 5.0e-07 ,
   w => 2.0e-06 ,
   ng => 1 ,
   m => 1 ,
   mm_ok => 1 ,
   model => sg13_hv_nmos ,
   spiceprefix => X
)
port map (
   D => outn ,
   G => outn ,
   S => outn ,
   B => VSS
);

M10 : sg13_hv_nmos
generic map (
   l => 5.0e-07 ,
   w => 2.0e-06 ,
   ng => 1 ,
   m => 1 ,
   mm_ok => 1 ,
   model => sg13_hv_nmos ,
   spiceprefix => X
)
port map (
   D => VSS ,
   G => VSS ,
   S => VSS ,
   B => VSS
);

MN8 : sg13_lv_nmos
generic map (
   l => 1.3e-07 ,
   w => 4.0e-06 ,
   ng => 1 ,
   m => 1 ,
   mm_ok => 1 ,
   model => sg13_lv_nmos ,
   spiceprefix => X
)
port map (
   D => comp_out ,
   G => net3 ,
   S => VSS ,
   B => VSS
);

MP7 : sg13_hv_pmos
generic map (
   l => 4.5e-07 ,
   w => 8.0e-06 ,
   ng => 1 ,
   m => 1 ,
   mm_ok => 1 ,
   model => sg13_hv_pmos ,
   spiceprefix => X
)
port map (
   D => net3 ,
   G => net2 ,
   S => VDDL ,
   B => VDDL
);

MN2 : sg13_hv_nmos
generic map (
   l => 4.5e-07 ,
   w => 4.0e-06 ,
   ng => 1 ,
   m => 1 ,
   mm_ok => 1 ,
   model => sg13_hv_nmos ,
   spiceprefix => X
)
port map (
   D => net3 ,
   G => net2 ,
   S => VSS ,
   B => VSS
);

MP8 : sg13_hv_pmos
generic map (
   l => 4.5e-07 ,
   w => 8.0e-06 ,
   ng => 1 ,
   m => 1 ,
   mm_ok => 1 ,
   model => sg13_hv_pmos ,
   spiceprefix => X
)
port map (
   D => net3 ,
   G => net3 ,
   S => net3 ,
   B => VDDL
);

MP9 : sg13_hv_pmos
generic map (
   l => 4.5e-07 ,
   w => 8.0e-06 ,
   ng => 1 ,
   m => 1 ,
   mm_ok => 1 ,
   model => sg13_hv_pmos ,
   spiceprefix => X
)
port map (
   D => VDDL ,
   G => VDDL ,
   S => VDDL ,
   B => VDDL
);

MN7 : sg13_hv_nmos
generic map (
   l => 4.5e-07 ,
   w => 4.0e-06 ,
   ng => 1 ,
   m => 1 ,
   mm_ok => 1 ,
   model => sg13_hv_nmos ,
   spiceprefix => X
)
port map (
   D => net3 ,
   G => net3 ,
   S => net3 ,
   B => VSS
);

MN9 : sg13_hv_nmos
generic map (
   l => 4.5e-07 ,
   w => 4.0e-06 ,
   ng => 1 ,
   m => 1 ,
   mm_ok => 1 ,
   model => sg13_hv_nmos ,
   spiceprefix => X
)
port map (
   D => VSS ,
   G => VSS ,
   S => VSS ,
   B => VSS
);

end arch_simple_comparator ;

