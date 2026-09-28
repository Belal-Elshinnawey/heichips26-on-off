// SPDX-FileCopyrightText: © 2026 XXX Authors
// SPDX-License-Identifier: Apache-2.0
`timescale 1ns / 1ps
`default_nettype none

module analog_interface(
`ifdef USE_POWER_PINS
    inout  wire VPWR,
    inout  wire VGND,
`endif
    //FPGA pins
    input  wire [7:0] chip_ui_in,    // Dedicated inputs from the FPGA
    output wire [7:0] chip_uo_out,   // Dedicated outputs to the FPGA
    input  wire       clk,      // clock
    input  wire       rst_n,     // reset_n - low to reset

    output wire sys_clk, //clock to the Analog IP
    output wire sys_reset_n, // reset to the analog ip

    // analog IP pins
    input wire q0,
    input wire q1,
    input wire q2,
    input wire q3,
    output wire vctrl,
    output wire vctrl_b,

    // digital IP pins to the analog macro
    input wire data_in_tx, // data from the digital IP to transmit by the analog side
    output wire q0_rx_data, // data from the analog ip to be wired to the digital side. q0
    output wire q1_rx_data,
    output wire q2_rx_data,
    output wire q3_rx_data,

    // digital macro SPI interface from/to the digital macro
    output wire CS_D, //connects to the digital macro
    output wire MOSI_D,
    input wire MISO_D,
    input wire DTRDY_D
    
);
    // Pinout: only vctrl/vctrl_b (TX) is mode-switched. SPI and Q0-3 are always live.
    // chip_ui_in : [0] tx_mode (0=SPI, 1=bitbang) [1] bitbang TX data
    //              [2] SPI CS  [3] SPI MOSI  [7:4] unused
    // chip_uo_out: [0] SPI MISO [1] SPI DTRDY [2] q0 [3] q1 [4] q2 [5] q3 [7:6] unused
    assign sys_clk = clk;
    assign sys_reset_n = rst_n;
    //block diagram:
    // FPGA <-> this interface <-> digital macro
    //                 |
    //                 --------<-> analog macro



    // register the FPGA and analog ip pins
    reg [7:0] ui_in_r; 
    reg q0_r,q0_rr;
    reg q1_r,q1_rr;
    reg q2_r,q2_rr;
    reg q3_r,q3_rr;
    always @(posedge clk) begin
        if (!rst_n) begin
            ui_in_r <= 8'b00000000;
            q0_r <= 1'b0;
            q1_r <= 1'b0;
            q2_r <= 1'b0;
            q3_r <= 1'b0;
            q0_rr <= 1'b0;
            q1_rr <= 1'b0;
            q2_rr <= 1'b0;
            q3_rr <= 1'b0;
        end else begin
            ui_in_r <= chip_ui_in;
            q0_r <= q0;
            q1_r <= q1;
            q2_r <= q2;
            q3_r <= q3;
            q0_rr <= q0_r;
            q1_rr <= q1_r;
            q2_rr <= q2_r;
            q3_rr <= q3_r;
        end
    end
    // CDC synced data edges to the digital side.
    assign q0_rx_data = q0_rr;
    assign q1_rx_data = q1_rr;
    assign q2_rx_data = q2_rr;
    assign q3_rx_data = q3_rr;

    //data_in_tx controlls vctrl and vctrl_b, vctrl is data in, vctrl_b is !data_in.
    //but we need dead time between switching data in to prevent VCO ouput to VGND short.
    // the safe state is both vctrl and vctrl_b be set to 0 for 10 clock cycles.
    reg vctrl_r, vctrl_b_r;
    // tx source select. 1 = drive vctrl/vctrl_b from ui_in_r[1] (bitbang), 0 = from data_in_tx.
    wire bypass_mode = ui_in_r[0];
    // block diagram:
    // data_in_tx ->[       ]    [                ] ->vctrl
    //              [2:1 MUX] -> [Dead time insert]
    // ui_in_r[1] ->[       ]    [                ] -> vctrl_b
    wire vctrl_mux_out = bypass_mode ? ui_in_r[1] : data_in_tx;
    reg vctrl_mux_out_d;
    reg [3:0] dead_cnt;
    localparam int unsigned DEAD_TIME = 10;
    always @(posedge clk) begin
        if (!rst_n) begin
            vctrl_mux_out_d <= 1'b0;
            dead_cnt        <= 4'd0;
            vctrl_r         <= 1'b0;
            vctrl_b_r       <= 1'b0;
        end else begin
            vctrl_mux_out_d <= vctrl_mux_out;
            if (vctrl_mux_out != vctrl_mux_out_d) begin
                // data changed: drop to the safe state and restart the dead-time count
                dead_cnt  <= 4'd0;
                vctrl_r   <= 1'b0;
                vctrl_b_r <= 1'b0;
            end else if (dead_cnt < DEAD_TIME) begin
                dead_cnt  <= dead_cnt + 4'd1;
                vctrl_r   <= 1'b0;
                vctrl_b_r <= 1'b0;
            end else begin
                vctrl_r   <= vctrl_mux_out;
                vctrl_b_r <= ~vctrl_mux_out;
            end
        end
    end
    assign vctrl   = vctrl_r;
    assign vctrl_b = vctrl_b_r;

    //M: the FPGA
    //S: this chip
    // digital macro SPI interface from/to the FPGA
    wire CS_in; // this chip is getting selected by the FPGA //chip_ui_in[2]
    wire MOSI_IN; // MOSI line coming from the FPGA to this chip chip_ui_in[3]
    wire MISO_OUT;  // MISO line coming from this chip to the FPGA chip_uo_out[0]
    wire DTRDY_OUT; // from the chip to the FPGA (I have data interrupt) chip_uo_out[1]
    assign CS_D = CS_in;
    assign MOSI_D = MOSI_IN;
    assign MISO_OUT = MISO_D;
    assign DTRDY_OUT = DTRDY_D;

    assign chip_uo_out[0] = MISO_OUT;
    assign chip_uo_out[1] = DTRDY_OUT;
    assign chip_uo_out[2] = q0_rr;
    assign chip_uo_out[3] = q1_rr;
    assign chip_uo_out[4] = q2_rr;
    assign chip_uo_out[5] = q3_rr;
    assign chip_uo_out[7:6] = 2'b00;

    assign CS_in = ui_in_r[2];
    assign MOSI_IN = ui_in_r[3];

endmodule
