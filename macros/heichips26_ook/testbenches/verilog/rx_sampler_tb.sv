`timescale 1ns / 1ps
`default_nettype none

module rx_sampler_tb;

    localparam int N          = 16;
    localparam int CLK_PERIOD = 10;

    logic clk = 0, rst_n = 0, rx_i = 0, phase_rst = 0;
    wire  symbol, symbol_valid;

    rx_sampler #(.CLKS_PER_BIT(N)) u_dut (.*);

    always #(CLK_PERIOD / 2) clk = ~clk;

    initial begin
        $dumpfile("rx_sampler_tb.fst");
        $dumpvars(0, rx_sampler_tb);
    end

    int errors = 0;
    task chk(input bit cond, input string msg);
        if (!cond) begin $display("FAIL: %s (t=%0t)", msg, $time); errors++; end
    endtask

    task sync_phase();
        @(posedge clk); #1; phase_rst = 1;
        @(posedge clk); #1; phase_rst = 0;
    endtask

    task drive_symbol(input logic level, input int glitch_at, input logic exp);
        bit seen;
        seen = 0;
        for (int t = 0; t < N; t++) begin
            rx_i = (t == glitch_at) ? ~level : level;
            @(posedge clk); #1;
            if (symbol_valid) begin
                chk(symbol === exp, $sformatf("level=%b glitch@%0d: got=%b exp=%b",
                                              level, glitch_at, symbol, exp));
                seen = 1;
            end
        end
        if (!seen) begin
            @(posedge clk); #1;
            chk(symbol_valid === 1'b1, "symbol_validが窓終端で出ること");
            chk(symbol === exp, $sformatf("(late) level=%b got=%b exp=%b", level, symbol, exp));
        end
    endtask

    initial begin
        repeat (3) @(posedge clk); rst_n = 1;
        sync_phase();

        drive_symbol(1'b1, -1, 1'b1);
        drive_symbol(1'b0, -1, 1'b0);
        drive_symbol(1'b1, -1, 1'b1);

        drive_symbol(1'b1, 2,  1'b1);   // 窓の端のグリッチは無視
        drive_symbol(1'b0, 13, 1'b0);

        drive_symbol(1'b1, 8, 1'b1);    // 中央1点のグリッチは多数決で救う
        drive_symbol(1'b0, 8, 1'b0);

        rx_i = 0; repeat (5) @(posedge clk); 
        sync_phase(); 
        drive_symbol(1'b1, -1, 1'b1);
        drive_symbol(1'b0, -1, 1'b0);

        if (errors == 0) $display("[TB] rx_sampler: ALL PASS");
        else begin $display("[TB] rx_sampler: FAIL (%0d errors)", errors); $fatal(1); end
        $finish;
    end

endmodule
