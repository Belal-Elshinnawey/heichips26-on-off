// SPDX-FileCopyrightText: © 2026 HeiChips26 OOK Modem Authors
// SPDX-License-Identifier: Apache-2.0
`timescale 1ns / 1ps
`default_nettype none

module heichips26_ook_modem_tb;

    localparam int N          = 8;   // テスト用シンボル長(パラメータ上書き)
    localparam int CLK_PERIOD = 10;  // 100MHz

    logic       clk = 0, rst_n = 0;
    logic [7:0] ui_in = '0, uio_in = '0;
    wire  [7:0] uo_out, uio_out, uio_oe;

    heichips26_ook_modem #(.CLKS_PER_BIT(N)) u_dut (
        .ui_in   (ui_in),
        .uo_out  (uo_out),
        .uio_in  (uio_in),
        .uio_out (uio_out),
        .uio_oe  (uio_oe),
        .ena     (1'b1),
        .clk     (clk),
        .rst_n   (rst_n)
    );

    always #(CLK_PERIOD / 2) clk = ~clk;

    wire       tx_ready = uo_out[7];
    wire       rx_valid = uo_out[6];
    wire [5:0] rx_data  = uo_out[5:0];
    wire       tx_busy  = uio_out[5];
    wire       tx_out   = uio_out[7];
    wire       rx_sop   = uio_out[2];
    wire       rx_eop   = uio_out[3];

    initial begin
        $dumpfile("heichips26_ook_modem_tb.fst");
        $dumpvars(0, heichips26_ook_modem_tb);
    end

    int errors = 0;
    int edge_cnt = 0, e0 = 0;
    always @(posedge tx_out) edge_cnt++;

    task chk(input bit cond, input string msg);
        if (!cond) begin $display("FAIL: %s (t=%0t)", msg, $time); errors++; end
    endtask

    task pin_send(input logic [5:0] d, input logic sop, input logic eop);
        @(posedge clk); #1;
        chk(tx_ready, "送信前にtx_ready=1");
        ui_in  = {1'b0, 1'b1, d};
        uio_in = {uio_in[7:2], eop, sop};
        @(posedge clk); #1;
        ui_in[6] = 1'b0; uio_in[1:0] = 2'b00;
    endtask

    task check_symbols(input int nsym, input logic [0:9] exp, input string tag);
        logic [0:9] got;
        for (int s = 0; s < nsym; s++) begin
            repeat (N / 2) @(posedge clk); #1;
            got[s] = tx_out;
            repeat (N - N / 2) @(posedge clk); #1;
        end
        for (int s = 0; s < nsym; s++)
            chk(got[s] === exp[s], $sformatf("%s sym%0d got=%b exp=%b", tag, s, got[s], exp[s]));
    endtask

    task check_osc(input int nsym, input logic [0:9] on_exp, input string tag);
        for (int s = 0; s < nsym; s++) begin
            e0 = edge_cnt;
            repeat (N) @(posedge clk);
            if (on_exp[s]) chk(edge_cnt - e0 > 0,  $sformatf("%s sym%0d: 発振すべき", tag, s));
            else           chk(edge_cnt - e0 == 0, $sformatf("%s sym%0d: 無音のはず", tag, s));
        end
    endtask

    task wait_rx(input logic [5:0] exp_d, input logic exp_sop, input string tag);
        bit seen;
        seen = 0;
        for (int i = 0; i < 40 * N && !seen; i++) begin
            @(posedge clk); #1;
            if (rx_valid) begin
                seen = 1;
                chk(rx_data === exp_d,   $sformatf("%s: data got=%b exp=%b", tag, rx_data, exp_d));
                chk(rx_sop  === exp_sop, $sformatf("%s: rx_sop got=%b exp=%b", tag, rx_sop, exp_sop));
            end
        end
        chk(seen, $sformatf("%s: rx_validがタイムアウト", tag));
    endtask

    task wait_eop(input string tag);
        bit seen;
        seen = 0;
        for (int i = 0; i < 40 * N && !seen; i++) begin
            @(posedge clk); #1;
            if (rx_eop) seen = 1;
        end
        chk(seen, $sformatf("%s: rx_eopがタイムアウト", tag));
    endtask

    initial begin
        repeat (3) @(posedge clk); #1;
        chk(tx_out === 1'b0 && tx_busy === 1'b0, "リセット中は無音");
        rst_n = 1;
        repeat (2) @(posedge clk); #1;
        chk(uio_oe === 8'b1010_1100, "uio_oeが[03]の割当どおり");

        pin_send(6'b101101, 1, 1);
        check_symbols(10, '{1,1,0, 1,0,1,1,0,1, 1}, "BB");
        repeat (3) @(posedge clk); #1;
        chk(tx_out === 1'b0 && !tx_busy && tx_ready, "BB: パケット後はOFF/idle");

        uio_in[4] = 1'b1;
        pin_send(6'b110001, 1, 0);
        check_osc(10, '{1,1,0, 1,1,0,0,0,1, 1}, "CR-w1");
        begin
            e0 = edge_cnt;
            repeat (2 * N + 3) @(posedge clk); #1;
            chk(edge_cnt - e0 > 0, "GAP: 発振継続");
            chk(tx_busy && tx_ready, "GAP: busy=1 ready=1");
        end
        pin_send(6'b000000, 0, 1);
        check_osc(8, '{0, 0,0,0,0,0,0, 1, 0,0}, "CR-w2");
        begin
            repeat (2) @(posedge clk);
            e0 = edge_cnt;
            repeat (3 * N) @(posedge clk); #1;
            chk(edge_cnt - e0 == 0, "EOP後: 無音");
            chk(!tx_busy && tx_ready, "EOP後: idle");
        end

        uio_in[4] = 1'b0;   // ベースバンドに戻す
        uio_in[6] = 1'b1;   // bist_en

        pin_send(6'b100110, 1, 0);
        wait_rx(6'b100110, 1'b1, "BIST-w1(先頭語sop=1)");
        pin_send(6'b011001, 0, 0);
        wait_rx(6'b011001, 1'b0, "BIST-w2");
        pin_send(6'b000000, 0, 1);
        wait_rx(6'b000000, 1'b0, "BIST-w3(全0でも正当な語)");
        wait_eop("BIST: パケット終端");
        repeat (4) @(posedge clk); #1;
        chk(!rx_valid, "BIST: 終端後に余計なrx_validなし");

        pin_send(6'b111111, 1, 1);
        wait_rx(6'b111111, 1'b1, "BIST-2周目");
        wait_eop("BIST-2周目終端");
        uio_in[6] = 1'b0;
        pin_send(6'b101010, 1, 1);
        begin
            bit any;
            any = 0;
            for (int i = 0; i < 20 * N; i++) begin
                @(posedge clk); #1;
                if (rx_valid) any = 1;
            end
            chk(!any, "suppress: 非BISTでは自送信を受信しない");
        end

        if (errors == 0) $display("[TB] heichips26_ook_modem(TX+RX): ALL PASS");
        else begin $display("[TB] top: FAIL (%0d errors)", errors); $fatal(1); end
        $finish;
    end

endmodule
