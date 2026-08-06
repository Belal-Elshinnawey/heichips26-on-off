`timescale 1ns / 1ps
`default_nettype none

module tx_framer_tb;

    localparam int N          = 4;   
    localparam int CLK_PERIOD = 10;

    logic       clk = 0, rst_n = 0;
    logic       tx_valid = 0, tx_sop = 0, tx_eop = 0;
    logic [5:0] tx_data;
    wire        tx_ready, ro_en, tx_busy;

    tx_framer #(.CLKS_PER_BIT(N)) u_dut (
        .clk, .rst_n, .tx_data, .tx_valid, .tx_sop, .tx_eop,
        .tx_ready, .ro_en, .tx_busy
    );

    always #(CLK_PERIOD / 2) clk = ~clk;

    initial begin
        $dumpfile("tx_framer_tb.fst");
        $dumpvars(0, tx_framer_tb);
    end

    int errors = 0;
    task chk(input bit cond, input string msg);
        if (!cond) begin $display("FAIL: %s (t=%0t)", msg, $time); errors++; end
    endtask

    task send_word(input logic [5:0] d, input logic sop, input logic eop,
                   input int nsym, input logic [0:9] exp);
        logic [0:9] got;
        @(posedge clk); #1;
        chk(tx_ready, "wordの前にreadyであること");
        tx_data = d; tx_valid = 1; tx_sop = sop; tx_eop = eop;
        @(posedge clk); #1;              
        tx_valid = 0; tx_sop = 0; tx_eop = 0;
        for (int s = 0; s < nsym; s++) begin
            repeat (N / 2) @(posedge clk); #1;
            got[s] = ro_en;
            chk(tx_busy, "word送信中はbusy=1");
            repeat (N - N / 2) @(posedge clk); #1;
        end
        for (int s = 0; s < nsym; s++)
            chk(got[s] === exp[s],
                $sformatf("d=%b sop=%b sym%0d got=%b exp=%b", d, sop, s, got[s], exp[s]));
    endtask

    task check_gap(input int gap_clk);
        for (int i = 0; i < gap_clk; i++) begin
            @(posedge clk); #1;
            chk(ro_en    === 1'b1, "GAP: 搬送波イネーブルはON保持");
            chk(tx_ready === 1'b1, "GAP: ready=1");
            chk(tx_busy  === 1'b1, "GAP: busy=1");
        end
    endtask

    initial begin
        repeat (3) @(posedge clk); rst_n = 1;

        // A+B+C
        send_word(6'b101101, 1, 0, 10, '{1,1,0, 1,0,1,1,0,1, 1});
        check_gap(13);
        send_word(6'b010101, 0, 0, 8, '{0, 0,1,0,1,0,1, 1, 0,0});
        check_gap(3);
        send_word(6'b111000, 0, 1, 8, '{0, 1,1,1,0,0,0, 1, 0,0});

        // D
        repeat (2) @(posedge clk);
        for (int i = 0; i < 8; i++) begin
            @(posedge clk); #1;
            chk(ro_en === 1'b0, "EOP後: OFF");
            chk(!tx_busy,       "EOP後: busy=0");
            chk(tx_ready,       "EOP後: ready=1");
        end

        // E
        send_word(6'b110011, 1, 1, 10, '{1,1,0, 1,1,0,0,1,1, 1});
        repeat (3) @(posedge clk); #1;
        chk(ro_en === 1'b0 && !tx_busy, "1語パケットも正しく閉じる");

        // F
        @(posedge clk); #1; tx_data = 6'h15; tx_valid = 1; tx_sop = 1; tx_eop = 1;
        @(posedge clk); #1; tx_valid = 0; tx_sop = 0; tx_eop = 0;
        repeat (N) @(posedge clk); #1;
        chk(!tx_ready, "word送信中はready=0");
        repeat (10 * N) @(posedge clk);

        if (errors == 0) $display("[TB] tx_framer: ALL PASS");
        else begin $display("[TB] tx_framer: FAIL (%0d errors)", errors); $fatal(1); end
        $finish;
    end

endmodule
