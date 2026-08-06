`timescale 1ns / 1ps
`default_nettype none

module rx_chain_tb;

    localparam int N          = 100;  // 受信側のシンボル長(clk数)
    localparam int CLK_PERIOD = 10;

    logic clk = 0, rst_n = 0;
    logic rx_line = 0;          // 「電波」に相当する生波形(検波済みベースバンド)
    logic suppress = 0;

    wire rx_i, phase_rst, symbol, symbol_valid;
    wire [5:0] rx_data;
    wire rx_valid, rx_sop, rx_eop;

    rx_sync    u_sync (.clk(clk), .rx_in(rx_line), .rx_i(rx_i));
    rx_sampler #(.CLKS_PER_BIT(N)) u_samp (
        .clk(clk), .rst_n(rst_n), .rx_i(rx_i), .phase_rst(phase_rst),
        .symbol(symbol), .symbol_valid(symbol_valid));
    rx_deframer u_defr (
        .clk(clk), .rst_n(rst_n), .rx_i(rx_i), .suppress(suppress),
        .symbol(symbol), .symbol_valid(symbol_valid), .phase_rst(phase_rst),
        .rx_data(rx_data), .rx_valid(rx_valid), .rx_sop(rx_sop), .rx_eop(rx_eop));

    always #(CLK_PERIOD / 2) clk = ~clk;

    initial begin
        $dumpfile("rx_chain_tb.fst");
        $dumpvars(0, rx_chain_tb);
    end

    int errors = 0;
    logic [5:0] exp_data [0:31];
    bit         exp_sop  [0:31];
    int exp_n = 0, got_n = 0, eop_cnt = 0;

    task chk(input bit cond, input string msg);
        if (!cond) begin $display("FAIL: %s (t=%0t)", msg, $time); errors++; end
    endtask

    always @(posedge clk) if (rx_valid) begin
        if (got_n >= exp_n) begin
            $display("FAIL: 余計なrx_valid (data=%b t=%0t)", rx_data, $time); errors++;
        end else begin
            chk(rx_data === exp_data[got_n],
                $sformatf("word%0d data got=%b exp=%b", got_n, rx_data, exp_data[got_n]));
            chk(rx_sop === exp_sop[got_n],
                $sformatf("word%0d rx_sop got=%b exp=%b", got_n, rx_sop, exp_sop[got_n]));
        end
        got_n++;
    end
    always @(posedge clk) if (rx_eop) eop_cnt++;

    int symlen = N;

    task sym(input logic level);
        rx_line = level;
        repeat (symlen) @(posedge clk);
    endtask

    task word(input logic [5:0] d, input bit is_first);
        exp_data[exp_n] = d; exp_sop[exp_n] = is_first; exp_n++;
        sym(1'b0);
        for (int i = 5; i >= 0; i--) sym(d[i]);
        sym(1'b1);
    endtask

    task preamble(); sym(1'b1); sym(1'b1); endtask
    task gap(input int len_clk); rx_line = 1'b1; repeat (len_clk) @(posedge clk); endtask
    task line_off(input int len_clk); rx_line = 1'b0; repeat (len_clk) @(posedge clk); endtask

    initial begin
        repeat (5) @(posedge clk); rst_n = 1;
        repeat (5) @(posedge clk);

        preamble();
        word(6'b101101, 1);
        gap(137);
        word(6'b000000, 0);           
        gap(23);
        word(6'b111111, 0);
        line_off(10 * N);              
        chk(got_n == 3,   "A: 3語すべて受信");
        chk(eop_cnt == 1, "A: rx_eopが1回");

        symlen = 102;
        preamble(); word(6'b110010, 1); gap(50); word(6'b011011, 0);
        line_off(10 * N);
        chk(got_n == 5, "C1: +2%誤差でも受信");

        symlen = 98;
        preamble(); word(6'b100001, 1); word(6'b010110, 0);
        line_off(10 * N);
        symlen = N;
        chk(got_n == 7, "C2: -2%誤差・連続語でも受信");

        preamble();
        word(6'b101010, 1);
        gap(40); rx_line = 1'b0; repeat (3) @(posedge clk); gap(60);
        word(6'b010101, 0);
        line_off(10 * N);
        chk(got_n == 9, "D: 偽スタートを弾いて次の語を受信");

        preamble();
        word(6'b111000, 1);
        sym(1'b0);                              // START
        for (int i = 0; i < 6; i++) sym(1'b1);  // データ 111111
        sym(1'b0);                            
        line_off(3 * N);
        preamble(); word(6'b001100, 1);
        line_off(10 * N);
        chk(got_n == 11,  "E: 破損語は捨てられ正常語のみ受信");
        chk(eop_cnt >= 5, "E: 破損でrx_eop(中断通知)が出ている");

        // ---- F ----
        chk(got_n == exp_n, "F: 期待した語数と完全一致(余計なvalidなし)");

        if (errors == 0) $display("[TB] rx_chain: ALL PASS");
        else begin $display("[TB] rx_chain: FAIL (%0d errors)", errors); $fatal(1); end
        $finish;
    end

endmodule
