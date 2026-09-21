module ref_clk_gen (clk_i,
    clk_out,
    rst_ni,
    VPWR,
    VGND);
 input clk_i;
 output clk_out;
 input rst_ni;
 inout VPWR;
 inout VGND;

 wire _00_;
 wire _01_;
 wire _02_;
 wire _03_;
 wire _04_;
 wire _05_;
 wire _06_;
 wire _07_;
 wire _08_;
 wire _09_;
 wire _10_;
 wire _11_;
 wire _12_;
 wire _13_;
 wire _14_;
 wire _15_;
 wire _16_;
 wire _17_;
 wire _18_;
 wire _19_;
 wire _20_;
 wire _21_;
 wire _22_;
 wire _23_;
 wire _24_;
 wire _25_;
 wire _26_;
 wire _27_;
 wire _28_;
 wire _29_;
 wire _30_;
 wire _31_;
 wire _32_;
 wire net2;
 wire \count[0] ;
 wire \count[1] ;
 wire \count[2] ;
 wire \count[3] ;
 wire \count[4] ;
 wire \count[5] ;
 wire \count[6] ;
 wire net1;
 wire net3;
 wire net4;
 wire clknet_0_clk_i;
 wire clknet_1_0__leaf_clk_i;
 wire clknet_1_1__leaf_clk_i;
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
 wire net16;
 wire net17;
 wire net18;
 wire net19;

 sg13cmos5l_decap_8 FILLER_0_100 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_0_107 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_0_11 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_0_114 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_0_18 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_4 FILLER_0_25 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_0_4 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_0_61 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_0_93 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_1_0 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_1_105 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_1_112 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_1_119 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_1_19 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_1_21 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_1_26 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_1_28 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_1_65 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_1_98 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_4 FILLER_2_0 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_2_19 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_2_26 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_2_28 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_2_4 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_2_65 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_4 FILLER_3_0 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_3_106 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_3_113 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_3_120 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_3_19 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_3_21 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_4 FILLER_3_26 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_3_30 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_3_4 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_4_0 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_4_106 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_4_113 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_4_120 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_4_19 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_4_26 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_4_28 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_4_70 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_4_92 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_4_99 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_4 FILLER_5_0 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_5_106 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_5_113 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_5_120 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_5_19 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_5_26 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_5_28 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_5_4 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_6_0 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_6_105 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_6_112 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_6_119 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_6_19 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_6_26 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_6_28 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_6_7 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_6_70 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_6_77 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_4 FILLER_6_84 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_6_88 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_6_98 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_nand4_1 _33_ (.B(net18),
    .C(net8),
    .A(net10),
    .Y(_08_),
    .VDD(VPWR),
    .VSS(VGND),
    .D(net5));
 sg13cmos5l_nand2b_1 _34_ (.Y(_09_),
    .B(net15),
    .A_N(net3),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_nor3_2 _35_ (.A(net4),
    .B(_08_),
    .C(net16),
    .Y(_00_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_nor2_1 _36_ (.A(_08_),
    .B(_09_),
    .Y(_10_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_nor2_1 _37_ (.A(net4),
    .B(_10_),
    .Y(_01_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_xor2_1 _38_ (.B(net3),
    .A(net4),
    .X(_02_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_and2_1 _39_ (.A(net4),
    .B(net3),
    .X(_11_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_xnor2_1 _40_ (.Y(_12_),
    .A(net18),
    .B(_11_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_nor2_1 _41_ (.A(net17),
    .B(_12_),
    .Y(_03_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_inv_1 _42_ (.VDD(VPWR),
    .Y(_13_),
    .A(net8),
    .VSS(VGND));
 sg13cmos5l_nand2b_1 _43_ (.Y(_14_),
    .B(net5),
    .A_N(net4),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_nor3_1 _44_ (.A(_13_),
    .B(_09_),
    .C(_14_),
    .Y(_15_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_nand2_1 _45_ (.Y(_16_),
    .A(net4),
    .B(net3),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_nand2_1 _46_ (.Y(_17_),
    .A(net10),
    .B(_16_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_nor2b_1 _47_ (.A(net10),
    .B_N(\count[2] ),
    .Y(_18_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_nor2b_1 _48_ (.A(\count[2] ),
    .B_N(net10),
    .Y(_19_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_a21oi_1 _49_ (.VSS(VGND),
    .VDD(VPWR),
    .A1(_11_),
    .A2(_18_),
    .Y(_20_),
    .B1(_19_));
 sg13cmos5l_o21ai_1 _50_ (.B1(_20_),
    .VDD(VPWR),
    .Y(_04_),
    .VSS(VGND),
    .A1(_15_),
    .A2(_17_));
 sg13cmos5l_nand3_1 _51_ (.B(\count[2] ),
    .C(_11_),
    .A(\count[3] ),
    .Y(_21_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_o21ai_1 _52_ (.B1(_16_),
    .VDD(VPWR),
    .Y(_22_),
    .VSS(VGND),
    .A1(_09_),
    .A2(_14_));
 sg13cmos5l_and3_1 _53_ (.X(_23_),
    .A(net10),
    .B(\count[2] ),
    .C(net8),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_a22oi_1 _54_ (.Y(_05_),
    .B1(_22_),
    .B2(_23_),
    .A2(_21_),
    .A1(_13_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_nand2b_1 _55_ (.Y(_24_),
    .B(\count[6] ),
    .A_N(\count[0] ),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_nand3_1 _56_ (.B(\count[0] ),
    .C(net3),
    .A(net5),
    .Y(_25_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_o21ai_1 _57_ (.B1(_25_),
    .VDD(VPWR),
    .Y(_26_),
    .VSS(VGND),
    .A1(\count[1] ),
    .A2(_24_));
 sg13cmos5l_a21oi_1 _58_ (.VSS(VGND),
    .VDD(VPWR),
    .A1(_23_),
    .A2(_11_),
    .Y(_27_),
    .B1(net5));
 sg13cmos5l_a21oi_1 _59_ (.VSS(VGND),
    .VDD(VPWR),
    .A1(_23_),
    .A2(_26_),
    .Y(_06_),
    .B1(net6));
 sg13cmos5l_nor2b_1 _60_ (.A(\count[6] ),
    .B_N(net3),
    .Y(_28_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_nand4_1 _61_ (.B(net12),
    .C(_23_),
    .A(net5),
    .Y(_29_),
    .VDD(VPWR),
    .VSS(VGND),
    .D(_28_));
 sg13cmos5l_nand3b_1 _62_ (.B(net4),
    .C(\count[6] ),
    .Y(_30_),
    .VDD(VPWR),
    .VSS(VGND),
    .A_N(net3));
 sg13cmos5l_nor2b_1 _63_ (.A(net4),
    .B_N(net3),
    .Y(_31_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_o21ai_1 _64_ (.B1(\count[6] ),
    .VDD(VPWR),
    .Y(_32_),
    .VSS(VGND),
    .A1(_08_),
    .A2(_31_));
 sg13cmos5l_nand3_1 _65_ (.B(_30_),
    .C(_32_),
    .A(net13),
    .Y(_07_),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_dfrbpq_1 _66_ (.RESET_B(net1),
    .VSS(VGND),
    .VDD(VPWR),
    .D(net17),
    .Q(net2),
    .CLK(clknet_1_1__leaf_clk_i));
 sg13cmos5l_dfrbpq_1 _67_ (.RESET_B(net1),
    .VSS(VGND),
    .VDD(VPWR),
    .D(_01_),
    .Q(\count[0] ),
    .CLK(clknet_1_0__leaf_clk_i));
 sg13cmos5l_dfrbpq_1 _68_ (.RESET_B(net1),
    .VSS(VGND),
    .VDD(VPWR),
    .D(_02_),
    .Q(\count[1] ),
    .CLK(clknet_1_0__leaf_clk_i));
 sg13cmos5l_dfrbpq_1 _69_ (.RESET_B(net1),
    .VSS(VGND),
    .VDD(VPWR),
    .D(_03_),
    .Q(\count[2] ),
    .CLK(clknet_1_1__leaf_clk_i));
 sg13cmos5l_dfrbpq_1 _70_ (.RESET_B(net1),
    .VSS(VGND),
    .VDD(VPWR),
    .D(net11),
    .Q(\count[3] ),
    .CLK(clknet_1_1__leaf_clk_i));
 sg13cmos5l_dfrbpq_1 _71_ (.RESET_B(net1),
    .VSS(VGND),
    .VDD(VPWR),
    .D(net9),
    .Q(\count[4] ),
    .CLK(clknet_1_1__leaf_clk_i));
 sg13cmos5l_dfrbpq_1 _72_ (.RESET_B(net1),
    .VSS(VGND),
    .VDD(VPWR),
    .D(net7),
    .Q(\count[5] ),
    .CLK(clknet_1_0__leaf_clk_i));
 sg13cmos5l_dfrbpq_1 _73_ (.RESET_B(net1),
    .VSS(VGND),
    .VDD(VPWR),
    .D(net14),
    .Q(\count[6] ),
    .CLK(clknet_1_0__leaf_clk_i));
 sg13cmos5l_buf_8 clkbuf_0_clk_i (.A(clk_i),
    .X(clknet_0_clk_i),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_buf_8 clkbuf_1_0__f_clk_i (.A(clknet_0_clk_i),
    .X(clknet_1_0__leaf_clk_i),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_buf_8 clkbuf_1_1__f_clk_i (.A(clknet_0_clk_i),
    .X(clknet_1_1__leaf_clk_i),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_buf_1 fanout3 (.A(net19),
    .X(net3),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_buf_1 fanout4 (.A(net12),
    .X(net4),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_dlygate4sd3_1 hold10 (.A(\count[3] ),
    .VDD(VPWR),
    .VSS(VGND),
    .X(net10));
 sg13cmos5l_dlygate4sd3_1 hold11 (.A(_04_),
    .VDD(VPWR),
    .VSS(VGND),
    .X(net11));
 sg13cmos5l_dlygate4sd3_1 hold12 (.A(\count[0] ),
    .VDD(VPWR),
    .VSS(VGND),
    .X(net12));
 sg13cmos5l_dlygate4sd3_1 hold13 (.A(_29_),
    .VDD(VPWR),
    .VSS(VGND),
    .X(net13));
 sg13cmos5l_dlygate4sd3_1 hold14 (.A(_07_),
    .VDD(VPWR),
    .VSS(VGND),
    .X(net14));
 sg13cmos5l_dlygate4sd3_1 hold15 (.A(\count[6] ),
    .VDD(VPWR),
    .VSS(VGND),
    .X(net15));
 sg13cmos5l_dlygate4sd3_1 hold16 (.A(_09_),
    .VDD(VPWR),
    .VSS(VGND),
    .X(net16));
 sg13cmos5l_dlygate4sd3_1 hold17 (.A(_00_),
    .VDD(VPWR),
    .VSS(VGND),
    .X(net17));
 sg13cmos5l_dlygate4sd3_1 hold18 (.A(\count[2] ),
    .VDD(VPWR),
    .VSS(VGND),
    .X(net18));
 sg13cmos5l_dlygate4sd3_1 hold19 (.A(\count[1] ),
    .VDD(VPWR),
    .VSS(VGND),
    .X(net19));
 sg13cmos5l_dlygate4sd3_1 hold5 (.A(\count[5] ),
    .VDD(VPWR),
    .VSS(VGND),
    .X(net5));
 sg13cmos5l_dlygate4sd3_1 hold6 (.A(_27_),
    .VDD(VPWR),
    .VSS(VGND),
    .X(net6));
 sg13cmos5l_dlygate4sd3_1 hold7 (.A(_06_),
    .VDD(VPWR),
    .VSS(VGND),
    .X(net7));
 sg13cmos5l_dlygate4sd3_1 hold8 (.A(\count[4] ),
    .VDD(VPWR),
    .VSS(VGND),
    .X(net8));
 sg13cmos5l_dlygate4sd3_1 hold9 (.A(_05_),
    .VDD(VPWR),
    .VSS(VGND),
    .X(net9));
 sg13cmos5l_buf_1 input1 (.A(rst_ni),
    .X(net1),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_buf_1 output2 (.A(net2),
    .X(clk_out),
    .VDD(VPWR),
    .VSS(VGND));
endmodule
