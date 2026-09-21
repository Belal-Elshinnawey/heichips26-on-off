module pfd_digital (clk_fb,
    clk_ref,
    dn,
    up,
    VPWR,
    VGND);
 input clk_fb;
 input clk_ref;
 output dn;
 output up;
 inout VPWR;
 inout VGND;

 wire _0_;
 wire _1_;
 wire net3;
 wire net4;
 wire net1;
 wire net2;
 wire net;

 sg13cmos5l_decap_8 FILLER_0_0 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_0_14 (.VDD(VPWR),
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
 sg13cmos5l_decap_8 FILLER_0_7 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_1_11 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_1_18 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_4 FILLER_1_25 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_1_4 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_2_0 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_2_11 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_2_19 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_2_21 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_2_26 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_2_28 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_2_35 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_2_42 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_4 FILLER_2_52 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_4 FILLER_2_7 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_3_0 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_3_14 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_3_21 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_3_26 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_3_28 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_3_7 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_4_11 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_4_18 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_4_25 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_4_32 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_4_39 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_4_4 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_decap_8 FILLER_4_46 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_2 FILLER_4_53 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_fill_1 FILLER_4_55 (.VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_nand2_2 _4_ (.Y(_1_),
    .A(net1),
    .B(net2),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_nand2_2 _5_ (.Y(_0_),
    .A(net1),
    .B(net4),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_dfrbpq_1 _6_ (.RESET_B(_1_),
    .VSS(VGND),
    .VDD(VPWR),
    .D(net),
    .Q(net1),
    .CLK(clk_fb));
 sg13cmos5l_tiehi _6__3 (.VDD(VPWR),
    .VSS(VGND),
    .L_HI(net));
 sg13cmos5l_dfrbpq_1 _7_ (.RESET_B(_0_),
    .VSS(VGND),
    .VDD(VPWR),
    .D(net3),
    .Q(net2),
    .CLK(clk_ref));
 sg13cmos5l_tiehi _7__4 (.VDD(VPWR),
    .VSS(VGND),
    .L_HI(net3));
 sg13cmos5l_dlygate4sd3_1 hold5 (.A(net2),
    .VDD(VPWR),
    .VSS(VGND),
    .X(net4));
 sg13cmos5l_buf_1 output1 (.A(net1),
    .X(dn),
    .VDD(VPWR),
    .VSS(VGND));
 sg13cmos5l_buf_1 output2 (.A(net2),
    .X(up),
    .VDD(VPWR),
    .VSS(VGND));
endmodule
