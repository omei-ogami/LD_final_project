module lab(
    input clk,
    input rst,
    inout wire PS2_DATA,
	inout wire PS2_CLK,
    output [3:0] vgaRed,
    output [3:0] vgaGreen,
    output [3:0] vgaBlue,
    output hsync,
    output vsync,
    output [9:0] led,
    output hit,
    output [6:0] DISPLAY,
	output [3:0] DIGIT
);

    /////////////////////////////////////////////////////////////////
    // clocks
    /////////////////////////////////////////////////////////////////
    wire clk_25MHz;
    wire clk_22;
    /////////////////////////////////////////////////////////////////
    // VGA
    /////////////////////////////////////////////////////////////////
    wire [11:0] data;
    wire [16:0] pixel_addr;
    wire [11:0] pixel, pixel_background, pixel_enemyL, pixel_gamestart;
    wire valid;
    wire [9:0] h_cnt;   //640
    wire [9:0] v_cnt;   //480
    /////////////////////////////////////////////////////////////////
    // script
    /////////////////////////////////////////////////////////////////
    wire [7:0] counter;
    wire [3:0] pos_0;
    wire gameend;
    /////////////////////////////////////////////////////////////////
    // player info
    /////////////////////////////////////////////////////////////////
    wire damage, op_damage, op_hit;
    wire [2:0] level;
    /////////////////////////////////////////////////////////////////
    // state
    /////////////////////////////////////////////////////////////////
    reg [3:0] state, next_state;
    /////////////////////////////////////////////////////////////////
    // keyboard
    /////////////////////////////////////////////////////////////////
    wire [127:0] key_down;
    wire [8:0] last_change;
	wire been_ready, op_ready, op_keydown;

    // states
    parameter GAMESTART = 4'd0;
    parameter EASY = 4'd1; 
    

    assign {vgaRed, vgaGreen, vgaBlue} = (valid==1'b1) ? pixel : 12'h0;

    // FSM
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            state <= GAMESTART;
        end
        else begin
            state <= next_state;
        end
    end

    always @(*) begin
        next_state = state;
        if(state == GAMESTART) begin
            if(level == EASY) next_state = EASY;
        end
        else begin
            if(gameend) next_state = GAMESTART;
        end
    end

    composite comp(
        .clk(clk),
        .rst(rst),
        .state(state),
        .background(pixel_background),
        .enemyL(pixel_enemyL),
        .gamestart(pixel_gamestart),
        .pixel(pixel)
    );

    background vga_bg(
        .clk(clk),
        .rst(rst),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .data(data),
        .pixel(pixel_background)
    );

    enemyL vga_enemyL(
        .clk(clk),
        .rst(rst),
        .hit(hit),
        .pos(pos_0),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .data(data),
        .pixel(pixel_enemyL),
        .damage(damage)
    );

    clock_divider clk_div(
        .clk(clk),
        .clk1(clk_25MHz),
        .clk22(clk_22)
    );

    vga_controller vga_inst(
        .pclk(clk_25MHz),
        .reset(rst),
        .hsync(hsync),
        .vsync(vsync),
        .valid(valid),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt)
    );

    script pos_enemy0(
        .clk(clk_22),
        .rst(rst),
        .state(state),
        .pos_0(pos_0),
        .gameend(gameend)
    );

    KeyboardDecoder key_de (
		.key_down(key_down),
		.last_change(last_change),
		.key_valid(been_ready),
		.PS2_DATA(PS2_DATA),
		.PS2_CLK(PS2_CLK),
		.rst(op_rst),
		.clk(clk)
	);

    onepulse op1(.clk(clk), .signal(been_ready), .op(op_ready));
    onepulse op2(.clk(clk), .signal(key_down[last_change]), .op(op_keydown));

    judge hit_judge(
        .clk(clk),
        .rst(rst),
        .ready(op_ready),
        .keydown(op_keydown),
        .last_change(last_change),
        .pos_0(pos_0),
        .hit(hit)
    );

    onepulse op_Damage(.clk(clk), .signal(damage), .op(op_damage));
    onepulse op_Hit(.clk(clk), .signal(hit), .op(op_hit));

    player play(
        .clk(clk),
        .rst(rst),
        .damage(op_damage),
        .hit(op_hit),
        .state(state),
        .life(led),
        .display(DISPLAY),
        .digit(DIGIT)
    );

    gamestart start(
        .clk(clk),
        .rst(rst),
        .ready(op_ready),
        .keydown(op_keydown),
        .last_change(last_change),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .data(data),
        .pixel(pixel_gamestart),
        .level(level)
    );

    
endmodule