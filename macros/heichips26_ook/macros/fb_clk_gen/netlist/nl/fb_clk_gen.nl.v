module fb_clk_gen (clk_i,
    clk_out);
 input clk_i;
 output clk_out;

 wire _000_;
 wire clknet_0_div2;
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
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;
 wire net10;
 wire net11;
 wire net12;
 wire net13;
 wire net14;
 wire net15;
 wire net1;
 wire \count[0] ;
 wire \count[1] ;
 wire \count[2] ;
 wire \count[3] ;
 wire \count[4] ;
 wire \count[5] ;
 wire \count[6] ;
 wire \count[7] ;
 wire \count[8] ;
 wire div2;
 wire net2;
 wire net3;
 wire net4;
 wire net;
 wire clknet_1_0__leaf_div2;
 wire clknet_1_1__leaf_div2;

 sg13cmos5l_decap_8 FILLER_0_0 ();
 sg13cmos5l_decap_8 FILLER_0_123 ();
 sg13cmos5l_decap_8 FILLER_0_130 ();
 sg13cmos5l_fill_2 FILLER_0_137 ();
 sg13cmos5l_fill_1 FILLER_0_139 ();
 sg13cmos5l_decap_8 FILLER_0_14 ();
 sg13cmos5l_decap_8 FILLER_0_21 ();
 sg13cmos5l_fill_1 FILLER_0_28 ();
 sg13cmos5l_decap_4 FILLER_0_60 ();
 sg13cmos5l_fill_2 FILLER_0_64 ();
 sg13cmos5l_decap_8 FILLER_0_7 ();
 sg13cmos5l_fill_2 FILLER_0_71 ();
 sg13cmos5l_fill_2 FILLER_0_78 ();
 sg13cmos5l_fill_1 FILLER_0_80 ();
 sg13cmos5l_decap_8 FILLER_1_0 ();
 sg13cmos5l_decap_8 FILLER_1_113 ();
 sg13cmos5l_decap_8 FILLER_1_120 ();
 sg13cmos5l_decap_8 FILLER_1_127 ();
 sg13cmos5l_decap_4 FILLER_1_134 ();
 sg13cmos5l_fill_2 FILLER_1_138 ();
 sg13cmos5l_fill_2 FILLER_1_19 ();
 sg13cmos5l_fill_1 FILLER_1_21 ();
 sg13cmos5l_decap_4 FILLER_1_26 ();
 sg13cmos5l_fill_2 FILLER_1_68 ();
 sg13cmos5l_decap_4 FILLER_1_7 ();
 sg13cmos5l_fill_1 FILLER_1_70 ();
 sg13cmos5l_fill_2 FILLER_1_76 ();
 sg13cmos5l_decap_8 FILLER_2_0 ();
 sg13cmos5l_fill_1 FILLER_2_11 ();
 sg13cmos5l_fill_1 FILLER_2_118 ();
 sg13cmos5l_decap_8 FILLER_2_122 ();
 sg13cmos5l_decap_8 FILLER_2_129 ();
 sg13cmos5l_decap_4 FILLER_2_136 ();
 sg13cmos5l_decap_8 FILLER_2_16 ();
 sg13cmos5l_decap_4 FILLER_2_23 ();
 sg13cmos5l_fill_2 FILLER_2_27 ();
 sg13cmos5l_fill_1 FILLER_2_66 ();
 sg13cmos5l_decap_4 FILLER_2_7 ();
 sg13cmos5l_decap_8 FILLER_3_0 ();
 sg13cmos5l_decap_8 FILLER_3_123 ();
 sg13cmos5l_decap_8 FILLER_3_130 ();
 sg13cmos5l_fill_2 FILLER_3_137 ();
 sg13cmos5l_fill_1 FILLER_3_139 ();
 sg13cmos5l_decap_8 FILLER_3_14 ();
 sg13cmos5l_decap_8 FILLER_3_21 ();
 sg13cmos5l_fill_1 FILLER_3_28 ();
 sg13cmos5l_fill_2 FILLER_3_56 ();
 sg13cmos5l_fill_1 FILLER_3_64 ();
 sg13cmos5l_decap_8 FILLER_3_7 ();
 sg13cmos5l_decap_4 FILLER_4_123 ();
 sg13cmos5l_decap_8 FILLER_4_130 ();
 sg13cmos5l_fill_2 FILLER_4_137 ();
 sg13cmos5l_fill_1 FILLER_4_139 ();
 sg13cmos5l_decap_4 FILLER_4_19 ();
 sg13cmos5l_fill_2 FILLER_4_26 ();
 sg13cmos5l_fill_1 FILLER_4_28 ();
 sg13cmos5l_fill_1 FILLER_4_4 ();
 sg13cmos5l_fill_2 FILLER_4_61 ();
 sg13cmos5l_fill_1 FILLER_4_63 ();
 sg13cmos5l_fill_1 FILLER_4_79 ();
 sg13cmos5l_fill_1 FILLER_4_87 ();
 sg13cmos5l_decap_8 FILLER_5_0 ();
 sg13cmos5l_decap_4 FILLER_5_114 ();
 sg13cmos5l_fill_1 FILLER_5_118 ();
 sg13cmos5l_decap_8 FILLER_5_123 ();
 sg13cmos5l_decap_8 FILLER_5_130 ();
 sg13cmos5l_fill_2 FILLER_5_137 ();
 sg13cmos5l_fill_1 FILLER_5_139 ();
 sg13cmos5l_fill_2 FILLER_5_19 ();
 sg13cmos5l_fill_1 FILLER_5_21 ();
 sg13cmos5l_decap_4 FILLER_5_26 ();
 sg13cmos5l_fill_1 FILLER_5_30 ();
 sg13cmos5l_fill_2 FILLER_5_38 ();
 sg13cmos5l_fill_1 FILLER_5_40 ();
 sg13cmos5l_decap_4 FILLER_5_7 ();
 sg13cmos5l_fill_2 FILLER_5_81 ();
 sg13cmos5l_decap_8 FILLER_6_0 ();
 sg13cmos5l_decap_8 FILLER_6_106 ();
 sg13cmos5l_decap_8 FILLER_6_113 ();
 sg13cmos5l_decap_8 FILLER_6_120 ();
 sg13cmos5l_decap_8 FILLER_6_127 ();
 sg13cmos5l_decap_4 FILLER_6_134 ();
 sg13cmos5l_fill_2 FILLER_6_138 ();
 sg13cmos5l_decap_8 FILLER_6_14 ();
 sg13cmos5l_fill_1 FILLER_6_21 ();
 sg13cmos5l_fill_2 FILLER_6_26 ();
 sg13cmos5l_fill_1 FILLER_6_28 ();
 sg13cmos5l_decap_8 FILLER_6_69 ();
 sg13cmos5l_decap_8 FILLER_6_7 ();
 sg13cmos5l_decap_8 FILLER_6_76 ();
 sg13cmos5l_fill_1 FILLER_6_87 ();
 sg13cmos5l_decap_8 FILLER_6_92 ();
 sg13cmos5l_decap_8 FILLER_6_99 ();
 sg13cmos5l_inv_1 _050_ (.Y(_011_),
    .A(net4));
 sg13cmos5l_nand2b_1 _051_ (.Y(_012_),
    .B(\count[6] ),
    .A_N(\count[5] ));
 sg13cmos5l_or2_2 _052_ (.X(_013_),
    .B(\count[3] ),
    .A(\count[2] ));
 sg13cmos5l_nand3b_1 _053_ (.B(\count[8] ),
    .C(net2),
    .Y(_014_),
    .A_N(\count[7] ));
 sg13cmos5l_nor3_2 _054_ (.A(_012_),
    .B(_013_),
    .C(_014_),
    .Y(_015_));
 sg13cmos5l_and3_1 _055_ (.X(_000_),
    .A(_011_),
    .B(net3),
    .C(_015_));
 sg13cmos5l_inv_1 _056__16 (.Y(net15),
    .A(clknet_1_1__leaf_div2));
 sg13cmos5l_and4_2 _057_ (.A(net4),
    .B(net3),
    .C(\count[2] ),
    .D(\count[3] ),
    .X(_016_));
 sg13cmos5l_nand4_1 _058_ (.B(\count[5] ),
    .C(\count[6] ),
    .A(net2),
    .Y(_017_),
    .D(_016_));
 sg13cmos5l_xnor2_1 _059_ (.Y(_002_),
    .A(\count[7] ),
    .B(_017_));
 sg13cmos5l_nand4_1 _060_ (.B(net3),
    .C(\count[2] ),
    .A(net4),
    .Y(_018_),
    .D(\count[3] ));
 sg13cmos5l_nand4_1 _061_ (.B(\count[5] ),
    .C(\count[6] ),
    .A(net2),
    .Y(_019_),
    .D(\count[7] ));
 sg13cmos5l_o21ai_1 _062_ (.B1(\count[8] ),
    .Y(_020_),
    .A1(_018_),
    .A2(_019_));
 sg13cmos5l_inv_1 _063_ (.Y(_021_),
    .A(\count[8] ));
 sg13cmos5l_nand3b_1 _064_ (.B(_021_),
    .C(_016_),
    .Y(_022_),
    .A_N(_019_));
 sg13cmos5l_nand2b_1 _065_ (.Y(_023_),
    .B(net3),
    .A_N(net4));
 sg13cmos5l_nor4_1 _066_ (.A(_012_),
    .B(_013_),
    .C(_014_),
    .D(_023_),
    .Y(_024_));
 sg13cmos5l_a21oi_1 _067_ (.A1(_020_),
    .A2(_022_),
    .Y(_003_),
    .B1(_024_));
 sg13cmos5l_a21oi_1 _068_ (.A1(net3),
    .A2(_015_),
    .Y(_004_),
    .B1(net4));
 sg13cmos5l_nand2b_1 _069_ (.Y(_025_),
    .B(net4),
    .A_N(net3));
 sg13cmos5l_o21ai_1 _070_ (.B1(_025_),
    .Y(_005_),
    .A1(_015_),
    .A2(_023_));
 sg13cmos5l_nand2_1 _071_ (.Y(_026_),
    .A(net4),
    .B(net3));
 sg13cmos5l_xnor2_1 _072_ (.Y(_006_),
    .A(\count[2] ),
    .B(_026_));
 sg13cmos5l_nand3_1 _073_ (.B(net3),
    .C(\count[2] ),
    .A(net4),
    .Y(_027_));
 sg13cmos5l_xnor2_1 _074_ (.Y(_007_),
    .A(\count[3] ),
    .B(_027_));
 sg13cmos5l_nor4_1 _075_ (.A(\count[7] ),
    .B(_021_),
    .C(_012_),
    .D(_013_),
    .Y(_028_));
 sg13cmos5l_nand2_1 _076_ (.Y(_029_),
    .A(_011_),
    .B(net2));
 sg13cmos5l_inv_1 _077_ (.Y(_030_),
    .A(net2));
 sg13cmos5l_and2_1 _078_ (.A(\count[0] ),
    .B(net2),
    .X(_031_));
 sg13cmos5l_nand2_1 _079_ (.Y(_032_),
    .A(\count[2] ),
    .B(\count[3] ));
 sg13cmos5l_nor2b_1 _080_ (.A(\count[1] ),
    .B_N(net2),
    .Y(_033_));
 sg13cmos5l_a221oi_1 _081_ (.B2(_032_),
    .C1(_033_),
    .B1(_031_),
    .A1(_030_),
    .Y(_034_),
    .A2(_016_));
 sg13cmos5l_o21ai_1 _082_ (.B1(_034_),
    .Y(_008_),
    .A1(_028_),
    .A2(_029_));
 sg13cmos5l_nand2_1 _083_ (.Y(_035_),
    .A(net2),
    .B(_016_));
 sg13cmos5l_xnor2_1 _084_ (.Y(_009_),
    .A(\count[5] ),
    .B(_035_));
 sg13cmos5l_nand2_1 _085_ (.Y(_036_),
    .A(\count[4] ),
    .B(\count[5] ));
 sg13cmos5l_o21ai_1 _086_ (.B1(\count[6] ),
    .Y(_037_),
    .A1(_036_),
    .A2(_018_));
 sg13cmos5l_or3_1 _087_ (.A(\count[6] ),
    .B(_036_),
    .C(_018_),
    .X(_038_));
 sg13cmos5l_a21oi_1 _088_ (.A1(_037_),
    .A2(_038_),
    .Y(_010_),
    .B1(_024_));
 sg13cmos5l_dfrbpq_1 _089_ (.RESET_B(net14),
    .D(_010_),
    .Q(\count[6] ),
    .CLK(clknet_1_1__leaf_div2));
 sg13cmos5l_tiehi _089__15 (.L_HI(net14));
 sg13cmos5l_dfrbpq_1 _090_ (.RESET_B(net6),
    .D(_002_),
    .Q(\count[7] ),
    .CLK(clknet_1_1__leaf_div2));
 sg13cmos5l_tiehi _090__7 (.L_HI(net6));
 sg13cmos5l_dfrbpq_1 _091_ (.RESET_B(net7),
    .D(_003_),
    .Q(\count[8] ),
    .CLK(clknet_1_1__leaf_div2));
 sg13cmos5l_tiehi _091__8 (.L_HI(net7));
 sg13cmos5l_dfrbpq_1 _092_ (.RESET_B(net13),
    .D(_000_),
    .Q(net1),
    .CLK(clknet_1_0__leaf_div2));
 sg13cmos5l_tiehi _092__14 (.L_HI(net13));
 sg13cmos5l_dfrbpq_1 _093_ (.RESET_B(net12),
    .D(net15),
    .Q(div2),
    .CLK(clk_i));
 sg13cmos5l_tiehi _093__13 (.L_HI(net12));
 sg13cmos5l_dfrbpq_1 _094_ (.RESET_B(net11),
    .D(_004_),
    .Q(\count[0] ),
    .CLK(clknet_1_0__leaf_div2));
 sg13cmos5l_tiehi _094__12 (.L_HI(net11));
 sg13cmos5l_dfrbpq_1 _095_ (.RESET_B(net10),
    .D(_005_),
    .Q(\count[1] ),
    .CLK(clknet_1_0__leaf_div2));
 sg13cmos5l_tiehi _095__11 (.L_HI(net10));
 sg13cmos5l_dfrbpq_1 _096_ (.RESET_B(net9),
    .D(_006_),
    .Q(\count[2] ),
    .CLK(clknet_1_0__leaf_div2));
 sg13cmos5l_tiehi _096__10 (.L_HI(net9));
 sg13cmos5l_dfrbpq_1 _097_ (.RESET_B(net8),
    .D(_007_),
    .Q(\count[3] ),
    .CLK(clknet_1_0__leaf_div2));
 sg13cmos5l_tiehi _097__9 (.L_HI(net8));
 sg13cmos5l_dfrbpq_1 _098_ (.RESET_B(net5),
    .D(_008_),
    .Q(\count[4] ),
    .CLK(clknet_1_0__leaf_div2));
 sg13cmos5l_tiehi _098__6 (.L_HI(net5));
 sg13cmos5l_dfrbpq_1 _099_ (.RESET_B(net),
    .D(_009_),
    .Q(\count[5] ),
    .CLK(clknet_1_1__leaf_div2));
 sg13cmos5l_tiehi _099__5 (.L_HI(net));
 sg13cmos5l_buf_8 clkbuf_0_div2 (.A(div2),
    .X(clknet_0_div2));
 sg13cmos5l_buf_8 clkbuf_1_0__f_div2 (.A(clknet_0_div2),
    .X(clknet_1_0__leaf_div2));
 sg13cmos5l_buf_8 clkbuf_1_1__f_div2 (.A(clknet_0_div2),
    .X(clknet_1_1__leaf_div2));
 sg13cmos5l_inv_1 clkload0 (.A(clknet_1_1__leaf_div2));
 sg13cmos5l_buf_1 fanout2 (.A(\count[4] ),
    .X(net2));
 sg13cmos5l_buf_1 fanout3 (.A(\count[1] ),
    .X(net3));
 sg13cmos5l_buf_1 fanout4 (.A(\count[0] ),
    .X(net4));
 sg13cmos5l_buf_1 output1 (.A(net1),
    .X(clk_out));
endmodule
