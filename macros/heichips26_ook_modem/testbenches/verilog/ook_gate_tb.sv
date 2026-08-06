// ookゲート用のテストベンチ

`timescale 1ns / 1ps
`default_nettype none

module ook_gate_tb;
    
    logic mode_carrier = 0;
    logic ro_en = 0;
    logic tx_busy = 0;
    logic carrier_clk = 0;
    logic ook_out = 0;
    logic tx_drive_en = 0;
    logic rst_n = 1;

    ook_gate u_dut (.*);

    always #10 carrier_clk = ~carrier_clk;

    initial begin
        $dumpfile("ook_date_tb.fst");
        $dumpvars(0, ook_gate_tb);
    end

    int errors = 0;
    task chk(input bit cond, input string msg);
        if(!cond) begin $display("FAIL: %s (t=%0t)", msg, $time); errors++; end
    endtask

    initial begin 
        #25;

        tx_busy = 1; mode_carrier = 0;
        ro_en = 1; #1; chk(ook_out === 1'b1, "BB: ro_en=1 -> out=1");
        ro_en = 0; #1; chk(ook_out === 1'b0, "BB: ro_en=0 -> out=0");
        chk(tx_drive_en === 1'b1, "drive_en = busy");

        mode_carrier = 1; ro_en = 1;
        @(posedge carrier_clk); #1; chk(ook_out === 1'b1, "CR: en & clk=1 -> 1");
        @(negedge carrier_clk); #1; chk(ook_out === 1'b0, "CR: en & clk=0 -> 0");
        ro_en = 0;
        @(posedge carrier_clk); #1; chk(ook_out === 1'b0, "CR: en=0 -> 0");

        tx_busy = 0; ro_en = 1; mode_carrier = 0;
        #1; chk(ook_out === 1'b0, "mute: busy=0 -> out=0");
        mode_carrier = 1;
        @(posedge carrier_clk); #1; chk(ook_out === 1'b0, "mute(CR): busy=0 -> out=0");
        chk(tx_drive_en === 1'b0, "drive_en = busy = 0");

        if (errors == 0) $display("[TB] ook_gate: ALL PASS");
        else begin $display("[TB] ook_gate: FAIL (%0d errors)", errors); $finish; end
        $finish;
    end

endmodule