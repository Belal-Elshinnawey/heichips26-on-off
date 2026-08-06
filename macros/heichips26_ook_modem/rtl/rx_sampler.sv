`timescale 1ns / 1ps
`default_nettype none

module rx_sampler #(
    parameter int unsigned CLKS_PER_BIT = 1000
)(
    input  logic       clk,
    input  logic       rst_n,

    // RX入力
    input  logic       rx_i,
    input  logic       phase_rst,   // 位相リセット信号
    output logic       symbol,      // 判定結果[01]
    output logic       symbol_valid // stableしたタイミングフラグ
);
  localparam int unsigned S_A = (3 * CLKS_PER_BIT) / 8;
  localparam int unsigned S_B = (CLKS_PER_BIT     ) / 2;
  localparam int unsigned S_C = (5 * CLKS_PER_BIT) / 8;
  localparam int unsigned TICKW = (CLKS_PER_BIT <= 1) ? 1 : $clog2(CLKS_PER_BIT);

  logic [TICKW-1:0] tick;


  wire window_end = (tick == TICKW'(CLKS_PER_BIT - 1));

  logic sa, sb, sc;

  always_ff @(posedge clk or negedge rst_n) begin

    if (!rst_n) begin
        tick <= '0;
        sa <= 1'b0;
        sb <= 1'b0;
        sc <= 1'b0;
        symbol <= 1'b0;
        symbol_valid <= 1'b0;
    end else begin
        symbol_valid <= 1'b0;
        
        if(phase_rst) begin
            tick <= '0;
        end else begin
            tick <= window_end ? '0 : tick + 1'b1;

            if(tick == TICKW'(S_A)) sa <= rx_i;
            if(tick == TICKW'(S_B)) sb <= rx_i;
            if(tick == TICKW'(S_C)) sc <= rx_i;

            if(window_end) begin
                symbol <= (sa & sb) | (sb & sc) | (sa & sc);
                symbol_valid <= 1'b1;
            end 
        end
    end
  end
endmodule
