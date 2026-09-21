module pfd (clk_fb,
    clk_ref,
    dn,
    rst_ni,
    up,
    VPWR,
    VGND);
 input clk_fb;
 input clk_ref;
 output dn;
 input rst_ni;
 output up;
 inout VPWR;
 inout VGND;

 wire _000_;
 wire _001_;
 wire _002_;
 wire _003_;
 wire _004_;
 wire _005_;
 wire _006_;
 wire _007_;
 wire _008_;
 wire _009_;
 wire _010_;
 wire _011_;
 wire _012_;
 wire _013_;
 wire _014_;
 wire _015_;
 wire _016_;
 wire _017_;
 wire _018_;
 wire _019_;
 wire _020_;
 wire _021_;
 wire _022_;
 wire _023_;
 wire _024_;
 wire _025_;
 wire _026_;
 wire _027_;
 wire _028_;
 wire _029_;
 wire _030_;
 wire _031_;
 wire _032_;
 wire _033_;
 wire _034_;
 wire _035_;
 wire _036_;
 wire _037_;
 wire _038_;
 wire _039_;
 wire _040_;
 wire _041_;
 wire _042_;
 wire _043_;
 wire _044_;
 wire _045_;
 wire _046_;
 wire _047_;
 wire _048_;
 wire _049_;
 wire _050_;
 wire _051_;
 wire _052_;
 wire _053_;
 wire _054_;
 wire _055_;
 wire _056_;
 wire _057_;
 wire _058_;
 wire _059_;
 wire _060_;
 wire _061_;
 wire _062_;
 wire _063_;
 wire _064_;
 wire _065_;
 wire _066_;
 wire net10;
 wire clknet_0_clk_ref;
 wire clk_fb_div;
 wire clk_ref_div;
 wire net2;
 wire \fb_count[0] ;
 wire \fb_count[1] ;
 wire \fb_count[2] ;
 wire \fb_count[3] ;
 wire \fb_count[4] ;
 wire \fb_count[5] ;
 wire \fb_count[6] ;
 wire \fb_count[7] ;
 wire \fb_count[8] ;
 wire \fb_count[9] ;
 wire \ref_count[0] ;
 wire \ref_count[1] ;
 wire \ref_count[2] ;
 wire \ref_count[3] ;
 wire \ref_count[4] ;
 wire \ref_count[5] ;
 wire \ref_count[6] ;
 wire net1;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;
 wire net;
 wire clknet_1_0__leaf_clk_ref;
 wire clknet_1_1__leaf_clk_ref;
 wire clknet_0_clk_fb;
 wire clknet_1_0__leaf_clk_fb;
 wire clknet_1_1__leaf_clk_fb;
 wire net11;
 wire net12;
 wire net13;
 wire net14;
 wire net15;
 wire net16;
 wire net17;
 wire net18;
 wire net19;
 wire net20;
 wire net21;
 wire net22;
 wire net23;
 wire net24;
 wire net25;
 wire net26;

 sg13cmos5l_decap_8 FILLER_0_0 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_0_106 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_0_113 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_0_120 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_0_127 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_0_134 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_0_14 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_0_141 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_0_148 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_0_155 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_0_162 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_0_169 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_0_176 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_0_183 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_0_190 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_0_21 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_0_28 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_0_35 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_0_42 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_0_49 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_0_56 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_0_63 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_0_7 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_0_70 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_0_77 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_0_84 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_4 FILLER_0_91 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_0_99 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_10_0 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_10_120 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_10_127 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_10_134 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_10_141 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_10_148 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_10_155 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_10_162 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_10_169 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_10_176 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_10_183 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_10_19 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_10_190 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_10_21 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_10_26 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_10_28 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_4 FILLER_10_56 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_10_69 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_10_7 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_11_0 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_11_123 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_11_130 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_11_137 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_11_14 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_11_144 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_11_151 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_11_158 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_11_165 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_11_172 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_11_179 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_4 FILLER_11_186 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_11_190 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_11_21 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_11_28 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_11_67 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_11_7 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_12_0 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_12_101 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_12_116 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_12_123 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_12_130 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_12_137 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_12_14 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_12_144 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_12_146 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_12_151 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_12_158 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_12_165 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_12_172 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_12_179 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_4 FILLER_12_186 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_12_190 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_12_21 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_12_28 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_12_30 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_12_7 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_4 FILLER_12_86 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_12_94 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_1_0 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_1_104 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_1_111 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_1_118 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_1_125 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_1_132 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_1_139 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_1_14 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_1_146 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_1_153 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_1_160 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_1_167 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_1_174 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_1_181 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_4 FILLER_1_188 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_1_21 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_1_28 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_1_35 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_1_42 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_1_49 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_1_56 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_1_63 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_1_7 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_1_70 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_1_77 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_4 FILLER_1_84 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_1_88 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_2_0 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_2_119 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_2_126 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_2_133 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_2_14 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_2_169 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_2_176 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_2_183 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_2_190 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_2_21 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_2_28 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_2_35 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_2_42 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_2_49 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_2_56 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_2_63 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_2_7 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_2_70 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_2_77 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_3_0 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_3_112 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_3_119 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_3_126 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_3_14 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_3_152 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_3_159 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_3_161 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_3_189 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_3_191 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_3_21 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_3_28 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_3_35 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_3_42 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_3_50 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_3_57 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_3_64 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_3_7 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_3_71 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_3_78 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_3_80 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_4_0 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_4 FILLER_4_106 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_4_110 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_4_115 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_4_122 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_4 FILLER_4_129 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_4_133 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_4_14 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_4 FILLER_4_140 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_4_164 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_4_166 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_4_171 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_4_178 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_4_185 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_4_21 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_4_28 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_4_56 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_4_62 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_4 FILLER_4_69 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_4_7 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_4_73 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_5_0 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_5_123 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_5_130 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_5_137 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_5_139 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_5_151 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_5_153 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_5_172 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_4 FILLER_5_186 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_5_19 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_5_190 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_5_21 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_5_26 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_5_28 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_4 FILLER_5_68 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_5_7 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_4 FILLER_5_77 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_5_81 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_5_91 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_5_93 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_6_0 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_6_123 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_4 FILLER_6_130 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_6_134 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_6_161 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_6_189 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_6_19 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_6_191 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_6_21 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_4 FILLER_6_26 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_6_30 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_6_7 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_4 FILLER_6_90 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_6_94 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_4 FILLER_7_0 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_7_123 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_7_130 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_7_137 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_4 FILLER_7_144 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_7_148 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_7_166 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_7_176 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_7_183 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_4 FILLER_7_19 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_7_190 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_7_26 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_7_28 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_7_4 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_7_94 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_8_0 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_8_105 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_8_112 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_8_119 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_8_126 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_8_133 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_4 FILLER_8_140 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_8_189 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_4 FILLER_8_19 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_8_191 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_4 FILLER_8_26 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_8_7 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_9_0 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_9_123 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_9_130 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_9_132 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_9_165 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_9_172 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_9_179 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_4 FILLER_9_186 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_9_19 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_9_190 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_9_26 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_9_28 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_4 FILLER_9_53 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_9_7 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_9_74 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_9_94 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_nor2b_1 _069_ (.A(net5),
    .B_N(net17),
    .Y(_026_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_and2_1 _070_ (.A(net11),
    .B(\ref_count[2] ),
    .X(_027_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_nand4_1 _071_ (.B(net19),
    .C(_026_),
    .A(net22),
    .Y(_028_),
    .VDD(VPWR),
    .VSS(VGND),
    .D(_027_));
 sg13cmos5l_nor2_1 _072_ (.A(net4),
    .B(net23),
    .Y(_001_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_inv_1 _073_ (.VDD(VPWR),
    .Y(_029_),
    .A(\fb_count[9] ),
    .VSS(VGND));
 sg13cmos5l_nor2b_1 _074_ (.A(\fb_count[3] ),
    .B_N(\fb_count[2] ),
    .Y(_030_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_nor2b_1 _075_ (.A(\fb_count[1] ),
    .B_N(\fb_count[0] ),
    .Y(_031_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_nor2b_1 _076_ (.A(\fb_count[6] ),
    .B_N(\fb_count[7] ),
    .Y(_032_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_nor2b_1 _077_ (.A(\fb_count[4] ),
    .B_N(\fb_count[5] ),
    .Y(_033_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_nand4_1 _078_ (.B(_031_),
    .C(_032_),
    .A(_030_),
    .Y(_034_),
    .VDD(VPWR),
    .VSS(VGND),
    .D(_033_));
 sg13cmos5l_nor3_1 _079_ (.A(\fb_count[8] ),
    .B(_029_),
    .C(_034_),
    .Y(_000_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_inv_1 _080_ (.VDD(VPWR),
    .Y(_002_),
    .A(\fb_count[0] ),
    .VSS(VGND));
 sg13cmos5l_xnor2_1 _081_ (.Y(_035_),
    .A(\fb_count[0] ),
    .B(\fb_count[1] ),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_nor2_1 _082_ (.A(_000_),
    .B(_035_),
    .Y(_003_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_nand2_1 _083_ (.Y(_036_),
    .A(\fb_count[0] ),
    .B(\fb_count[1] ),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_xor2_1 _084_ (.B(_036_),
    .A(\fb_count[2] ),
    .X(_037_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_nor2_1 _085_ (.A(_000_),
    .B(_037_),
    .Y(_004_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_nand3_1 _086_ (.B(\fb_count[1] ),
    .C(\fb_count[2] ),
    .A(\fb_count[0] ),
    .Y(_038_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_xnor2_1 _087_ (.Y(_005_),
    .A(\fb_count[3] ),
    .B(_038_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_and4_2 _088_ (.A(\fb_count[0] ),
    .B(\fb_count[1] ),
    .C(\fb_count[3] ),
    .D(\fb_count[2] ),
    .X(_039_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_xor2_1 _089_ (.B(_039_),
    .A(\fb_count[4] ),
    .X(_006_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_and2_1 _090_ (.A(\fb_count[4] ),
    .B(_039_),
    .X(_040_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_xnor2_1 _091_ (.Y(_041_),
    .A(\fb_count[5] ),
    .B(_040_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_nor2_1 _092_ (.A(_000_),
    .B(_041_),
    .Y(_007_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_nand2_1 _093_ (.Y(_042_),
    .A(\fb_count[5] ),
    .B(_040_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_xnor2_1 _094_ (.Y(_008_),
    .A(\fb_count[6] ),
    .B(_042_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_nand4_1 _095_ (.B(\fb_count[5] ),
    .C(\fb_count[6] ),
    .A(\fb_count[4] ),
    .Y(_043_),
    .VDD(VPWR),
    .VSS(VGND),
    .D(_039_));
 sg13cmos5l_xor2_1 _096_ (.B(_043_),
    .A(\fb_count[7] ),
    .X(_044_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_nor2_1 _097_ (.A(_000_),
    .B(_044_),
    .Y(_009_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_and2_1 _098_ (.A(\fb_count[4] ),
    .B(\fb_count[5] ),
    .X(_045_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_nand4_1 _099_ (.B(\fb_count[7] ),
    .C(_039_),
    .A(\fb_count[6] ),
    .Y(_046_),
    .VDD(VPWR),
    .VSS(VGND),
    .D(_045_));
 sg13cmos5l_xnor2_1 _100_ (.Y(_010_),
    .A(\fb_count[8] ),
    .B(_046_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_and2_1 _101_ (.A(\fb_count[9] ),
    .B(_034_),
    .X(_047_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_xnor2_1 _102_ (.Y(_048_),
    .A(\fb_count[9] ),
    .B(_046_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_mux2_1 _103_ (.A0(_047_),
    .A1(_048_),
    .S(\fb_count[8] ),
    .X(_011_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_inv_1 _104_ (.VDD(VPWR),
    .Y(_049_),
    .A(net17),
    .VSS(VGND));
 sg13cmos5l_nand4_1 _105_ (.B(net24),
    .C(net22),
    .A(net11),
    .Y(_050_),
    .VDD(VPWR),
    .VSS(VGND),
    .D(net19));
 sg13cmos5l_nor3_1 _106_ (.A(net4),
    .B(_049_),
    .C(_050_),
    .Y(_051_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_nor2_1 _107_ (.A(net5),
    .B(_051_),
    .Y(_012_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_xor2_1 _108_ (.B(net5),
    .A(net4),
    .X(_013_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_a21oi_1 _109_ (.VSS(VGND),
    .VDD(VPWR),
    .A1(net24),
    .A2(_028_),
    .Y(_052_),
    .B1(net4));
 sg13cmos5l_nand3_1 _110_ (.B(net5),
    .C(net24),
    .A(net4),
    .Y(_053_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_o21ai_1 _111_ (.B1(_053_),
    .VDD(VPWR),
    .Y(_054_),
    .VSS(VGND),
    .A1(net5),
    .A2(net24));
 sg13cmos5l_nor2_1 _112_ (.A(_052_),
    .B(_054_),
    .Y(_014_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_a21oi_1 _113_ (.VSS(VGND),
    .VDD(VPWR),
    .A1(net11),
    .A2(_028_),
    .Y(_055_),
    .B1(net4));
 sg13cmos5l_a21oi_1 _114_ (.VSS(VGND),
    .VDD(VPWR),
    .A1(net5),
    .A2(\ref_count[2] ),
    .Y(_056_),
    .B1(net11));
 sg13cmos5l_and3_1 _115_ (.X(_057_),
    .A(net4),
    .B(net6),
    .C(_027_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_nor3_1 _116_ (.A(_055_),
    .B(net12),
    .C(_057_),
    .Y(_015_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_nand3_1 _117_ (.B(_026_),
    .C(_027_),
    .A(\ref_count[5] ),
    .Y(_058_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_a21oi_1 _118_ (.VSS(VGND),
    .VDD(VPWR),
    .A1(\ref_count[4] ),
    .A2(_058_),
    .Y(_059_),
    .B1(net14));
 sg13cmos5l_and2_1 _119_ (.A(\ref_count[4] ),
    .B(_027_),
    .X(_060_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_and3_1 _120_ (.X(_061_),
    .A(net14),
    .B(net6),
    .C(_060_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_a21oi_1 _121_ (.VSS(VGND),
    .VDD(VPWR),
    .A1(net6),
    .A2(_027_),
    .Y(_062_),
    .B1(\ref_count[4] ));
 sg13cmos5l_nor3_1 _122_ (.A(net15),
    .B(_061_),
    .C(_062_),
    .Y(_016_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_nand3_1 _123_ (.B(_026_),
    .C(_027_),
    .A(\ref_count[4] ),
    .Y(_063_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_nand2_1 _124_ (.Y(_064_),
    .A(net19),
    .B(_063_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_inv_1 _125_ (.VDD(VPWR),
    .Y(_065_),
    .A(net14),
    .VSS(VGND));
 sg13cmos5l_a21oi_1 _126_ (.VSS(VGND),
    .VDD(VPWR),
    .A1(net6),
    .A2(_060_),
    .Y(_066_),
    .B1(net19));
 sg13cmos5l_a221oi_1 _127_ (.VDD(VPWR),
    .VSS(VGND),
    .B2(_065_),
    .C1(net20),
    .B1(_064_),
    .A1(net19),
    .Y(_017_),
    .A2(_061_));
 sg13cmos5l_a21oi_1 _128_ (.VSS(VGND),
    .VDD(VPWR),
    .A1(_065_),
    .A2(net5),
    .Y(_021_),
    .B1(_050_));
 sg13cmos5l_inv_1 _129_ (.VDD(VPWR),
    .Y(_022_),
    .A(net5),
    .VSS(VGND));
 sg13cmos5l_nor3_1 _130_ (.A(_022_),
    .B(net17),
    .C(_050_),
    .Y(_023_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_o21ai_1 _131_ (.B1(net4),
    .VDD(VPWR),
    .Y(_024_),
    .VSS(VGND),
    .A1(_026_),
    .A2(_023_));
 sg13cmos5l_o21ai_1 _132_ (.B1(_024_),
    .VDD(VPWR),
    .Y(_018_),
    .VSS(VGND),
    .A1(_049_),
    .A2(_021_));
 sg13cmos5l_inv_1 _133_ (.VDD(VPWR),
    .Y(_025_),
    .A(net8),
    .VSS(VGND));
 sg13cmos5l_a21oi_1 _134_ (.VSS(VGND),
    .VDD(VPWR),
    .A1(net2),
    .A2(net3),
    .Y(_019_),
    .B1(_025_));
 sg13cmos5l_a21oi_1 _135_ (.VSS(VGND),
    .VDD(VPWR),
    .A1(net2),
    .A2(net3),
    .Y(_020_),
    .B1(_025_));
 sg13cmos5l_dfrbpq_1 _136_ (.RESET_B(_019_),
    .VSS(VGND),
    .VDD(VPWR),
    .D(net),
    .Q(net2),
    .CLK(clk_fb_div));
 sg13cmos5l_tiehi _136__10 (.VDD(VPWR),
    .VSS(VGND),
    .L_HI(net));
 sg13cmos5l_dfrbpq_1 _137_ (.RESET_B(_020_),
    .VSS(VGND),
    .VDD(VPWR),
    .D(net10),
    .Q(net3),
    .CLK(clk_ref_div));
 sg13cmos5l_tiehi _137__11 (.VDD(VPWR),
    .VSS(VGND),
    .L_HI(net10));
 sg13cmos5l_dfrbpq_1 _138_ (.RESET_B(net8),
    .VSS(VGND),
    .VDD(VPWR),
    .D(_002_),
    .Q(\fb_count[0] ),
    .CLK(clknet_1_0__leaf_clk_fb));
 sg13cmos5l_dfrbpq_1 _139_ (.RESET_B(net7),
    .VSS(VGND),
    .VDD(VPWR),
    .D(_003_),
    .Q(\fb_count[1] ),
    .CLK(clknet_1_0__leaf_clk_fb));
 sg13cmos5l_dfrbpq_1 _140_ (.RESET_B(net7),
    .VSS(VGND),
    .VDD(VPWR),
    .D(_004_),
    .Q(\fb_count[2] ),
    .CLK(clknet_1_0__leaf_clk_fb));
 sg13cmos5l_dfrbpq_1 _141_ (.RESET_B(net8),
    .VSS(VGND),
    .VDD(VPWR),
    .D(_005_),
    .Q(\fb_count[3] ),
    .CLK(clknet_1_1__leaf_clk_fb));
 sg13cmos5l_dfrbpq_1 _142_ (.RESET_B(net8),
    .VSS(VGND),
    .VDD(VPWR),
    .D(_006_),
    .Q(\fb_count[4] ),
    .CLK(clknet_1_1__leaf_clk_fb));
 sg13cmos5l_dfrbpq_1 _143_ (.RESET_B(net8),
    .VSS(VGND),
    .VDD(VPWR),
    .D(_007_),
    .Q(\fb_count[5] ),
    .CLK(clknet_1_0__leaf_clk_fb));
 sg13cmos5l_dfrbpq_1 _144_ (.RESET_B(net8),
    .VSS(VGND),
    .VDD(VPWR),
    .D(_008_),
    .Q(\fb_count[6] ),
    .CLK(clknet_1_1__leaf_clk_fb));
 sg13cmos5l_dfrbpq_1 _145_ (.RESET_B(net8),
    .VSS(VGND),
    .VDD(VPWR),
    .D(_009_),
    .Q(\fb_count[7] ),
    .CLK(clknet_1_0__leaf_clk_fb));
 sg13cmos5l_dfrbpq_1 _146_ (.RESET_B(net9),
    .VSS(VGND),
    .VDD(VPWR),
    .D(_010_),
    .Q(\fb_count[8] ),
    .CLK(clknet_1_1__leaf_clk_fb));
 sg13cmos5l_dfrbpq_1 _147_ (.RESET_B(net9),
    .VSS(VGND),
    .VDD(VPWR),
    .D(_011_),
    .Q(\fb_count[9] ),
    .CLK(clknet_1_1__leaf_clk_fb));
 sg13cmos5l_dfrbpq_1 _148_ (.RESET_B(net8),
    .VSS(VGND),
    .VDD(VPWR),
    .D(_000_),
    .Q(clk_fb_div),
    .CLK(clknet_1_0__leaf_clk_fb));
 sg13cmos5l_dfrbpq_1 _149_ (.RESET_B(net7),
    .VSS(VGND),
    .VDD(VPWR),
    .D(_012_),
    .Q(\ref_count[0] ),
    .CLK(clknet_1_0__leaf_clk_ref));
 sg13cmos5l_dfrbpq_1 _150_ (.RESET_B(net7),
    .VSS(VGND),
    .VDD(VPWR),
    .D(_013_),
    .Q(\ref_count[1] ),
    .CLK(clknet_1_0__leaf_clk_ref));
 sg13cmos5l_dfrbpq_1 _151_ (.RESET_B(net7),
    .VSS(VGND),
    .VDD(VPWR),
    .D(net25),
    .Q(\ref_count[2] ),
    .CLK(clknet_1_1__leaf_clk_ref));
 sg13cmos5l_dfrbpq_1 _152_ (.RESET_B(net7),
    .VSS(VGND),
    .VDD(VPWR),
    .D(net13),
    .Q(\ref_count[3] ),
    .CLK(clknet_1_1__leaf_clk_ref));
 sg13cmos5l_dfrbpq_1 _153_ (.RESET_B(net7),
    .VSS(VGND),
    .VDD(VPWR),
    .D(net16),
    .Q(\ref_count[4] ),
    .CLK(clknet_1_1__leaf_clk_ref));
 sg13cmos5l_dfrbpq_1 _154_ (.RESET_B(net9),
    .VSS(VGND),
    .VDD(VPWR),
    .D(net21),
    .Q(\ref_count[5] ),
    .CLK(clknet_1_0__leaf_clk_ref));
 sg13cmos5l_dfrbpq_1 _155_ (.RESET_B(net7),
    .VSS(VGND),
    .VDD(VPWR),
    .D(net18),
    .Q(\ref_count[6] ),
    .CLK(clknet_1_0__leaf_clk_ref));
 sg13cmos5l_dfrbpq_1 _156_ (.RESET_B(net9),
    .VSS(VGND),
    .VDD(VPWR),
    .D(_001_),
    .Q(clk_ref_div),
    .CLK(clknet_1_1__leaf_clk_ref));
 sg13cmos5l_buf_8 clkbuf_0_clk_fb (.A(clk_fb),
    .X(clknet_0_clk_fb),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_buf_8 clkbuf_0_clk_ref (.A(clk_ref),
    .X(clknet_0_clk_ref),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_buf_8 clkbuf_1_0__f_clk_fb (.A(clknet_0_clk_fb),
    .X(clknet_1_0__leaf_clk_fb),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_buf_8 clkbuf_1_0__f_clk_ref (.A(clknet_0_clk_ref),
    .X(clknet_1_0__leaf_clk_ref),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_buf_8 clkbuf_1_1__f_clk_fb (.A(clknet_0_clk_fb),
    .X(clknet_1_1__leaf_clk_fb),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_buf_8 clkbuf_1_1__f_clk_ref (.A(clknet_0_clk_ref),
    .X(clknet_1_1__leaf_clk_ref),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_inv_1 clkload0 (.VDD(VPWR),
    .A(clknet_1_1__leaf_clk_fb),
    .VSS(VGND));
 sg13cmos5l_buf_1 fanout4 (.A(net14),
    .X(net4),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_buf_1 fanout5 (.A(net26),
    .X(net5),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_buf_1 fanout6 (.A(\ref_count[0] ),
    .X(net6),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_buf_1 fanout7 (.A(net9),
    .X(net7),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_buf_1 fanout8 (.A(net9),
    .X(net8),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_buf_1 fanout9 (.A(net1),
    .X(net9),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_dlygate4sd3_1 hold12 (.A(\ref_count[3] ),
    .VDD(VPWR),
    .VSS(VGND),
    .X(net11));
 sg13cmos5l_dlygate4sd3_1 hold13 (.A(_056_),
    .VDD(VPWR),
    .VSS(VGND),
    .X(net12));
 sg13cmos5l_dlygate4sd3_1 hold14 (.A(_015_),
    .VDD(VPWR),
    .VSS(VGND),
    .X(net13));
 sg13cmos5l_dlygate4sd3_1 hold15 (.A(\ref_count[1] ),
    .VDD(VPWR),
    .VSS(VGND),
    .X(net14));
 sg13cmos5l_dlygate4sd3_1 hold16 (.A(_059_),
    .VDD(VPWR),
    .VSS(VGND),
    .X(net15));
 sg13cmos5l_dlygate4sd3_1 hold17 (.A(_016_),
    .VDD(VPWR),
    .VSS(VGND),
    .X(net16));
 sg13cmos5l_dlygate4sd3_1 hold18 (.A(\ref_count[6] ),
    .VDD(VPWR),
    .VSS(VGND),
    .X(net17));
 sg13cmos5l_dlygate4sd3_1 hold19 (.A(_018_),
    .VDD(VPWR),
    .VSS(VGND),
    .X(net18));
 sg13cmos5l_dlygate4sd3_1 hold20 (.A(\ref_count[5] ),
    .VDD(VPWR),
    .VSS(VGND),
    .X(net19));
 sg13cmos5l_dlygate4sd3_1 hold21 (.A(_066_),
    .VDD(VPWR),
    .VSS(VGND),
    .X(net20));
 sg13cmos5l_dlygate4sd3_1 hold22 (.A(_017_),
    .VDD(VPWR),
    .VSS(VGND),
    .X(net21));
 sg13cmos5l_dlygate4sd3_1 hold23 (.A(\ref_count[4] ),
    .VDD(VPWR),
    .VSS(VGND),
    .X(net22));
 sg13cmos5l_dlygate4sd3_1 hold24 (.A(_028_),
    .VDD(VPWR),
    .VSS(VGND),
    .X(net23));
 sg13cmos5l_dlygate4sd3_1 hold25 (.A(\ref_count[2] ),
    .VDD(VPWR),
    .VSS(VGND),
    .X(net24));
 sg13cmos5l_dlygate4sd3_1 hold26 (.A(_014_),
    .VDD(VPWR),
    .VSS(VGND),
    .X(net25));
 sg13cmos5l_dlygate4sd3_1 hold27 (.A(\ref_count[0] ),
    .VDD(VPWR),
    .VSS(VGND),
    .X(net26));
 sg13cmos5l_buf_1 input1 (.A(rst_ni),
    .X(net1),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_buf_1 output2 (.A(net2),
    .X(dn),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_buf_1 output3 (.A(net3),
    .X(up),
    .VDD(VPWR),
    .VSS(VGND));
endmodule
