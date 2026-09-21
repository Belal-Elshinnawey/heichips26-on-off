`default_nettype none
`timescale 1ns / 1ps

module pfd_tb;

    // clk_ref: raw 80MHz reference input
    localparam real CLK_REF_PERIOD = 12.5;
    // clk_fb: raw feedback/VCO input, nominally 433.92MHz
    localparam real CLK_FB_PERIOD  = 1000.0 / 433.92;

    // Expected comparison frequency out of both dividers:
    //   80MHz    / 125 = 640kHz
    //   433.92MHz / 678 = 640kHz
    localparam real EXPECTED_DIV_PERIOD = 1.0e6 / 640.0; // ns (640kHz)

    logic clk_ref = 0;
    logic clk_fb  = 0;
    logic rst_ni  = 0;
    wire  up, dn;

    always #(CLK_REF_PERIOD / 2.0) clk_ref = ~clk_ref;
    always #(CLK_FB_PERIOD  / 2.0) clk_fb  = ~clk_fb;

    pfd dut (
        .clk_ref (clk_ref),
        .clk_fb  (clk_fb),
        .rst_ni  (rst_ni),
        .up      (up),
        .dn      (dn)
    );

    int errors = 0;

    task check_period(input string name, input real got, input real exp, input real tol_pct);
        real lo, hi;
        lo = exp * (1.0 - tol_pct / 100.0);
        hi = exp * (1.0 + tol_pct / 100.0);
        if (got < lo || got > hi) begin
            $display("FAIL: %s period=%0.4fns expected=%0.4fns (+/-%0.1f%%)", name, got, exp, tol_pct);
            errors++;
        end else begin
            $display("PASS: %s period=%0.4fns (expected %0.4fns)", name, got, exp);
        end
    endtask

    real t_ref0, t_ref1, t_fb0, t_fb1;

    initial begin
        $dumpfile("pfd_tb.fst");
        $dumpvars(0, pfd_tb);

        repeat (4) @(posedge clk_ref);
        rst_ni = 1;

        // Measure two consecutive rising edges of each internal divided
        // clock to get its actual period.
        @(posedge dut.clk_ref_div); t_ref0 = $realtime;
        @(posedge dut.clk_ref_div); t_ref1 = $realtime;

        @(posedge dut.clk_fb_div); t_fb0 = $realtime;
        @(posedge dut.clk_fb_div); t_fb1 = $realtime;

        check_period("clk_ref_div (80MHz/125)",     t_ref1 - t_ref0, EXPECTED_DIV_PERIOD, 0.01);
        check_period("clk_fb_div (433.92MHz/678)",  t_fb1  - t_fb0,  EXPECTED_DIV_PERIOD, 0.05);

        repeat (20) @(posedge clk_ref);
        $display("up=%b dn=%b at end of run", up, dn);

        if (errors == 0) $display("[TB] pfd: ALL PASS");
        else begin $display("[TB] pfd: FAIL (%0d errors)", errors); $fatal(1); end
        $finish;
    end

endmodule

`default_nettype wire
