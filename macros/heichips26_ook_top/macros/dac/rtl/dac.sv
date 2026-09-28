`default_nettype none

module clk_div_async #(
    parameter int unsigned N = 2   // must be a power of 2
) (
    input  wire clk_in,
    input  wire rst_ni,
    output wire [$clog2(N)-1:0] stage_q_out
);

    localparam int unsigned STAGES = $clog2(N);

    wire [STAGES-1:0] stage_q;

    reg stage_q0;
    always @(posedge clk_in or negedge rst_ni) begin
        if (!rst_ni) stage_q0 <= 1'b0;
        else         stage_q0 <= ~stage_q0;
    end
    assign stage_q[0] = stage_q0;

    genvar i;
    generate
        for (i = 1; i < STAGES; i = i + 1) begin : g_stage
            reg q;
            always @(posedge stage_q[i-1] or negedge rst_ni) begin
                if (!rst_ni) q <= 1'b0;
                else         q <= ~q;
            end
            assign stage_q[i] = q;
        end
    endgenerate

    assign stage_q_out = stage_q;

endmodule

module dac (
    input  wire clk_ref,   // 80MHz baseband reference
    input  wire clk_fb,    // VCO feedback, target 433.92MHz (100-800MHz range)
    input  wire rst_ni,
    output wire dac_out,

    input  wire vctrl_in,
    input  wire vctrl_b_in,
    output wire vctrl_out,
    output wire vctrl_b_out
);

    assign vctrl_out   = vctrl_in;
    assign vctrl_b_out = vctrl_b_in;

    localparam int unsigned MAX_FB_DIV = 8192;
    localparam int unsigned STAGES     = $clog2(MAX_FB_DIV);  // 13
    localparam int unsigned TAP_BITS   = 4;                   // covers stage indices 0..12
    localparam int unsigned TAP_MIN    = 6;                   // stage_q[6]  -> FB_DIV=128  (coarsest/start)
    localparam int unsigned TAP_MAX    = STAGES - 1;          // stage_q[12] -> FB_DIV=8192 (finest)
    localparam int unsigned GEAR_MARGIN = 8;  // clk_ref cycles beyond HOLD before a tap "breaks"

    localparam int unsigned DUTY_BITS    = 13;
    localparam int unsigned PER_CNT_BITS = 13;  // covers up to 8191 clk_ref cycles (worst case ~6554 at 100MHz VCO, FB_DIV=8192)
    localparam int unsigned STREAK_BITS  = 6;   // caps how large one period's bump can grow to
    localparam int unsigned STEP_SHIFT   = 3;   // every tap but TAP_MAX steps 2**STEP_SHIFT duty LSBs per correction, so the extra duty resolution only sharpens TAP_MAX and doesn't slow down acquisition at the coarser taps

    localparam [DUTY_BITS-1:0] DUTY_MAX  = (1 << DUTY_BITS) - 1;
    localparam [DUTY_BITS-1:0] DUTY_INIT = 1 << (DUTY_BITS - 1);
    localparam [STREAK_BITS-1:0] STREAK_MAX = (1 << STREAK_BITS) - 1;

    localparam [1:0] DIR_HOLD = 2'd0;
    localparam [1:0] DIR_DOWN = 2'd1;  // too fast
    localparam [1:0] DIR_UP   = 2'd2;  // too slow

    function automatic [PER_CNT_BITS-1:0] tap_hold_low(input [TAP_BITS-1:0] tap);
        case (tap)
            6:       tap_hold_low = 23;
            7:       tap_hold_low = 47;
            8:       tap_hold_low = 94;
            9:       tap_hold_low = 188;
            10:      tap_hold_low = 377;
            11:      tap_hold_low = 755;
            default: tap_hold_low = 1509;  // 12
        endcase
    endfunction

    function automatic [PER_CNT_BITS-1:0] tap_hold_high(input [TAP_BITS-1:0] tap);
        case (tap)
            6:       tap_hold_high = 25;
            7:       tap_hold_high = 49;
            8:       tap_hold_high = 96;
            9:       tap_hold_high = 190;
            10:      tap_hold_high = 379;
            11:      tap_hold_high = 757;
            default: tap_hold_high = 1513;  // 12
        endcase
    endfunction

    wire [STAGES-1:0] fb_stage_q;

    clk_div_async #(.N(MAX_FB_DIV)) u_fb_div (
        .clk_in     (clk_fb),
        .rst_ni     (rst_ni),
        .stage_q_out(fb_stage_q)
    );

    reg [TAP_BITS-1:0] tap_sel;

    wire clk_fb_tap = fb_stage_q[tap_sel];

    reg [2:0] fb_sync;

    always @(posedge clk_ref or negedge rst_ni) begin
        if (!rst_ni) fb_sync <= 3'b0;
        else         fb_sync <= {fb_sync[1:0], clk_fb_tap};
    end

    wire fb_edge = fb_sync[1] & ~fb_sync[2];

    reg [PER_CNT_BITS-1:0] per_cnt;
    reg [DUTY_BITS-1:0]    duty;
    reg [STREAK_BITS-1:0]  streak;
    reg [1:0]              last_dir;
    reg                    settling;

    wire [PER_CNT_BITS-1:0] hold_low   = tap_hold_low(tap_sel);
    wire [PER_CNT_BITS-1:0] hold_high  = tap_hold_high(tap_sel);
    wire [PER_CNT_BITS-1:0] break_low  = (tap_sel == TAP_MAX) ? 13'd1472 : (hold_low - GEAR_MARGIN);
    wire [PER_CNT_BITS-1:0] break_high = (tap_sel == TAP_MAX) ? 13'd1544 : (hold_high + GEAR_MARGIN);

    wire [TAP_BITS-1:0] tap_up   = (tap_sel == TAP_MAX) ? tap_sel : tap_sel + 1'b1;
    wire [TAP_BITS-1:0] tap_down = (tap_sel == TAP_MIN) ? tap_sel : tap_sel - 1'b1;

    wire in_break_zone = (per_cnt < break_low) || (per_cnt >= break_high);
    wire in_hold_zone  = (per_cnt >= hold_low) && (per_cnt < hold_high);

    wire gear_down_now = fb_edge && in_break_zone && (tap_sel != TAP_MIN);
    wire gear_up_now   = fb_edge && in_hold_zone  && (tap_sel != TAP_MAX);
    wire gear_change   = gear_down_now || gear_up_now;


    wire this_is_fast = fb_edge && !gear_change && !in_hold_zone && (per_cnt < hold_low);
    wire this_is_slow = fb_edge && !gear_change && !in_hold_zone && (per_cnt >= hold_high);
    wire [1:0] this_dir = this_is_fast ? DIR_DOWN : this_is_slow ? DIR_UP : DIR_HOLD;
    wire same_streak    = fb_edge && !gear_change && (this_dir == last_dir) && (this_dir != DIR_HOLD);

    wire [DUTY_BITS-1:0] step_unit = (tap_sel == TAP_MAX)
        ? {{(DUTY_BITS-1){1'b0}}, 1'b1}
        : ({{(DUTY_BITS-1){1'b0}}, 1'b1} << STEP_SHIFT);

    wire [DUTY_BITS-1:0] step_amt = (tap_sel == TAP_MAX)
        ? {{(DUTY_BITS-1){1'b0}}, 1'b1}
        : ({{(DUTY_BITS-STREAK_BITS){1'b0}}, streak} << STEP_SHIFT);

    always @(posedge clk_ref or negedge rst_ni) begin
        if (!rst_ni) begin
            tap_sel    <= TAP_MIN[TAP_BITS-1:0];
            per_cnt    <= '0;
            duty       <= DUTY_INIT;
            streak     <= {{(STREAK_BITS-1){1'b0}}, 1'b1};
            last_dir   <= DIR_HOLD;
            settling   <= 1'b0;
        end else if (settling) begin
            per_cnt <= fb_edge ? '0 : (per_cnt + 1'b1);
            if (fb_edge) settling <= 1'b0;
        end else begin
            per_cnt <= fb_edge ? '0 : (per_cnt + 1'b1);

            if (gear_change) begin
                tap_sel    <= gear_down_now ? tap_down : tap_up;
                streak     <= {{(STREAK_BITS-1){1'b0}}, 1'b1};
                last_dir   <= DIR_HOLD;
                settling   <= 1'b1;
            end else if (fb_edge) begin
                last_dir <= this_dir;

                if (same_streak) begin
                    streak <= (streak == STREAK_MAX) ? STREAK_MAX : streak + 1'b1;
                    if (this_is_fast)      duty <= (duty <= step_amt)            ? '0       : duty - step_amt;
                    else if (this_is_slow) duty <= (duty >= DUTY_MAX - step_amt) ? DUTY_MAX : duty + step_amt;
                end else begin
                    streak <= {{(STREAK_BITS-1){1'b0}}, 1'b1};
                    if (this_is_fast)      duty <= (duty <= step_unit)            ? '0       : duty - step_unit;
                    else if (this_is_slow) duty <= (duty >= DUTY_MAX - step_unit) ? DUTY_MAX : duty + step_unit;
                end
            end
        end
    end

    reg [DUTY_BITS-1:0] sd_acc;
    reg                 dac_q;

    always @(posedge clk_ref or negedge rst_ni) begin
        if (!rst_ni) begin
            sd_acc <= '0;
            dac_q  <= 1'b0;
        end else begin
            {dac_q, sd_acc} <= sd_acc + duty;
        end
    end

    assign dac_out = dac_q;

endmodule

`default_nettype wire
