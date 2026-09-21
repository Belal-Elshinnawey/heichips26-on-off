module pfd_digital (clk_fb,
    clk_ref,
    dn,
    up);
 input clk_fb;
 input clk_ref;
 output dn;
 output up;

 wire _0_;
 wire _1_;
 wire net3;
 wire net4;
 wire net1;
 wire net2;
 wire net;

 sg13cmos5l_decap_8 FILLER_0_0 ();
 sg13cmos5l_decap_8 FILLER_0_14 ();
 sg13cmos5l_decap_8 FILLER_0_21 ();
 sg13cmos5l_decap_8 FILLER_0_28 ();
 sg13cmos5l_decap_8 FILLER_0_35 ();
 sg13cmos5l_decap_8 FILLER_0_42 ();
 sg13cmos5l_decap_8 FILLER_0_49 ();
 sg13cmos5l_decap_8 FILLER_0_7 ();
 sg13cmos5l_decap_8 FILLER_1_11 ();
 sg13cmos5l_decap_8 FILLER_1_18 ();
 sg13cmos5l_decap_4 FILLER_1_25 ();
 sg13cmos5l_decap_8 FILLER_1_4 ();
 sg13cmos5l_decap_8 FILLER_2_0 ();
 sg13cmos5l_fill_2 FILLER_2_11 ();
 sg13cmos5l_fill_2 FILLER_2_19 ();
 sg13cmos5l_fill_1 FILLER_2_21 ();
 sg13cmos5l_fill_2 FILLER_2_26 ();
 sg13cmos5l_fill_1 FILLER_2_28 ();
 sg13cmos5l_decap_8 FILLER_2_35 ();
 sg13cmos5l_fill_1 FILLER_2_42 ();
 sg13cmos5l_decap_4 FILLER_2_52 ();
 sg13cmos5l_decap_4 FILLER_2_7 ();
 sg13cmos5l_decap_8 FILLER_3_0 ();
 sg13cmos5l_decap_8 FILLER_3_14 ();
 sg13cmos5l_fill_1 FILLER_3_21 ();
 sg13cmos5l_fill_2 FILLER_3_26 ();
 sg13cmos5l_fill_1 FILLER_3_28 ();
 sg13cmos5l_decap_8 FILLER_3_7 ();
 sg13cmos5l_decap_8 FILLER_4_11 ();
 sg13cmos5l_decap_8 FILLER_4_18 ();
 sg13cmos5l_decap_8 FILLER_4_25 ();
 sg13cmos5l_decap_8 FILLER_4_32 ();
 sg13cmos5l_decap_8 FILLER_4_39 ();
 sg13cmos5l_decap_8 FILLER_4_4 ();
 sg13cmos5l_decap_8 FILLER_4_46 ();
 sg13cmos5l_fill_2 FILLER_4_53 ();
 sg13cmos5l_fill_1 FILLER_4_55 ();
 sg13cmos5l_nand2_2 _4_ (.Y(_1_),
    .A(net1),
    .B(net2));
 sg13cmos5l_nand2_2 _5_ (.Y(_0_),
    .A(net1),
    .B(net4));
 sg13cmos5l_dfrbpq_1 _6_ (.RESET_B(_1_),
    .D(net),
    .Q(net1),
    .CLK(clk_fb));
 sg13cmos5l_tiehi _6__3 (.L_HI(net));
 sg13cmos5l_dfrbpq_1 _7_ (.RESET_B(_0_),
    .D(net3),
    .Q(net2),
    .CLK(clk_ref));
 sg13cmos5l_tiehi _7__4 (.L_HI(net3));
 sg13cmos5l_dlygate4sd3_1 hold5 (.A(net2),
    .X(net4));
 sg13cmos5l_buf_1 output1 (.A(net1),
    .X(dn));
 sg13cmos5l_buf_1 output2 (.A(net2),
    .X(up));
endmodule
