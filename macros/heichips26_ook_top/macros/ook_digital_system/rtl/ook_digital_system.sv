// SPDX-FileCopyrightText: © 2026 XXX Authors
// SPDX-License-Identifier: Apache-2.0

`default_nettype none

module ook_digital_system(
`ifdef USE_POWER_PINS
    inout  wire VPWR,
    inout  wire VGND,
`endif
    // East: analog-facing side
    input  wire q3,
    input  wire q2,
    input  wire q1,
    input  wire q0,
    output wire rst,
    output wire clk_ref,
    output wire vctrl,
    output wire vctrl_n,

    // West: digital/chip-facing side
    input  wire data_in_tx,
    output wire q3_d,
    output wire q2_d,
    output wire q1_d,
    output wire q0_d,
    input  wire rst_n_in,
    input  wire clk,
    output wire in_tieoff,  // stable tie-low this macro provides for unused inputs elsewhere
    output wire in_tieon    // stable tie-high this macro provides for unused enables elsewhere
);


    sg13cmos5l_buf_1 rtl_buf_clk (.X(clk_ref), .A(clk));
    sg13cmos5l_buf_1 rtl_buf_rst (.X(rst),     .A(rst_n_in));

    sg13cmos5l_tielo rtl_tie_off (.L_LO(in_tieoff));
    sg13cmos5l_tiehi rtl_tie_on  (.L_HI(in_tieon));


    reg [1:0] q0_sync;
    always @(posedge clk) q0_sync <= {q0_sync[0], q0};
    assign q0_d = q0_sync[1];

    reg [1:0] q1_sync;
    always @(posedge clk) q1_sync <= {q1_sync[0], q1};
    assign q1_d = q1_sync[1];

    reg [1:0] q2_sync;
    always @(posedge clk) q2_sync <= {q2_sync[0], q2};
    assign q2_d = q2_sync[1];

    reg [1:0] q3_sync;
    always @(posedge clk) q3_sync <= {q3_sync[0], q3};
    assign q3_d = q3_sync[1];

    localparam integer DEADTIME_CYCLES = 10;

    reg data_in_tx_sync0, data_in_tx_sync1;
    always @(posedge clk) begin
        if (!rst_n_in) begin
            data_in_tx_sync0 <= 1'b0;
            data_in_tx_sync1 <= 1'b0;
        end else begin
            data_in_tx_sync0 <= data_in_tx;
            data_in_tx_sync1 <= data_in_tx_sync0;
        end
    end

    reg       committed_state;
    reg       in_deadtime;
    reg [3:0] deadtime_cnt;

    always @(posedge clk) begin
        if (!rst_n_in) begin
            committed_state <= 1'b0;
            in_deadtime      <= 1'b0;
            deadtime_cnt     <= 4'd0;
        end else if (!in_deadtime) begin
            if (data_in_tx_sync1 != committed_state) begin
                in_deadtime  <= 1'b1;
                deadtime_cnt <= 4'd0;
            end
        end else if (deadtime_cnt == DEADTIME_CYCLES - 1) begin
            in_deadtime     <= 1'b0;
            committed_state <= data_in_tx_sync1;
        end else begin
            deadtime_cnt <= deadtime_cnt + 1'b1;
        end
    end

    assign vctrl   = in_deadtime ? 1'b0 :  committed_state;
    assign vctrl_n = in_deadtime ? 1'b0 : ~committed_state;

endmodule
