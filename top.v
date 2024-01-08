module lab(
    input clk,
    input rst,
    input cheat,
    inout wire PS2_DATA,
	inout wire PS2_CLK,
    output [3:0] vgaRed,
    output [3:0] vgaGreen,
    output [3:0] vgaBlue,
    output hsync,
    output vsync,
    output [9:0] led,
    output [6:0] DISPLAY,
	output [3:0] DIGIT,
    output audio_mclk, 
    output audio_lrck, 
    output audio_sck,  
    output audio_sdin
);

    /////////////////////////////////////////////////////////////////
    // clocks
    /////////////////////////////////////////////////////////////////
    wire clk_25MHz;
    wire clk_22;
    wire db_rst, op_rst;
    /////////////////////////////////////////////////////////////////
    // VGA
    /////////////////////////////////////////////////////////////////
    wire [11:0] data;
    wire [16:0] pixel_addr;
    wire [11:0] pixel, pixel_background, pixel_enemy0, pixel_gamestart;
    wire [11:0] pixel_failure, pixel_enemy1, pixel_enemy2;
    wire valid;
    wire [9:0] h_cnt;   //640
    wire [9:0] v_cnt;   //480
    /////////////////////////////////////////////////////////////////
    // script
    /////////////////////////////////////////////////////////////////
    wire [7:0] counter;
    wire [4:0] pos_0, pos_1, pos_2, pos_3;
    wire gameend;
    /////////////////////////////////////////////////////////////////
    // player info
    /////////////////////////////////////////////////////////////////
    wire damage_0, op_damage_0, damage_1, op_damage_1, damage_2, op_damage_2, damage_3, op_damage_3;
    wire hit_0, hit_1, hit_2, hit_3, op_hit_0, op_hit_1, op_hit_2, op_hit_3;
    wire return, fail;
    wire ticket, op_ticket;
    wire [2:0] level;
    wire [6:0] money;
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
    parameter NORMAL = 4'd2;
    parameter HARD = 4'd3;
    parameter INFERNO = 4'd4;
    parameter FAILURE = 4'd5; 
    

    assign {vgaRed, vgaGreen, vgaBlue} = (valid==1'b1) ? pixel : 12'h0;

    // FSM
    always @(posedge clk or posedge op_rst) begin
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
            else if(level == NORMAL) next_state = NORMAL;
            else if(level == HARD) next_state = HARD;
            else if(level == INFERNO) next_state = INFERNO;
        end
        else if(state == EASY || state == NORMAL || state == HARD || state == INFERNO) begin
            if(gameend) next_state = GAMESTART;
            else if(fail) next_state = FAILURE;
        end
        else if(state == FAILURE) begin
            if(return) next_state = GAMESTART;
        end
    end

    composite comp(
        .clk(clk),
        .rst(op_rst),
        .state(state),
        .background(pixel_background),
        .enemy0(pixel_enemy0),
        .enemy1(pixel_enemy1),
        .enemy2(pixel_enemy2),
        .gamestart(pixel_gamestart),
        .failure(pixel_failure),
        .pixel(pixel)
    );

    background vga_bg(
        .clk(clk),
        .rst(op_rst),
        .clk_22(clk_22),
        .clk_25MHz(clk_25MHz),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .data(data),
        .pixel(pixel_background)
    );

    enemy0 vga_enemy0(
        .clk(clk),
        .rst(op_rst),
        .clk_22(clk_22),
        .clk_25MHz(clk_25MHz),
        .hit_0(hit_0),
        .hit_1(hit_1),
        .pos_0(pos_0),
        .pos_1(pos_1),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .data(data),
        .pixel0(pixel_enemy0),
        .damage_0(damage_0),
        .damage_1(damage_1)
    );

    enemy1 vga_enemy1(
        .clk(clk),
        .rst(op_rst),
        .clk_22(clk_22),
        .clk_25MHz(clk_25MHz),
        .hit_2(hit_2),
        .pos_2(pos_2),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .data(data),
        .pixel(pixel_enemy1),
        .damage(damage_2)
    );

    enemy2 vga_enemy2(
        .clk(clk),
        .rst(op_rst),
        .clk_22(clk_22),
        .clk_25MHz(clk_25MHz),
        .hit_3(hit_3),
        .pos_3(pos_3),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .data(data),
        .pixel(pixel_enemy2),
        .damage(damage_3)
    );

    clock_divider clk_div(
        .clk(clk),
        .clk1(clk_25MHz),
        .clk22(clk_22)
    );

    vga_controller vga_inst(
        .pclk(clk_25MHz),
        .reset(op_rst),
        .hsync(hsync),
        .vsync(vsync),
        .valid(valid),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt)
    );

    script pos_enemy(
        .clk(clk_22),
        .rst(op_rst),
        .state(state),
        .pos_0(pos_0),
        .pos_1(pos_1),
        .pos_2(pos_2),
        .pos_3(pos_3),
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

    debounce db(.clk(clk), .pb(rst), .pb_debounced(db_rst));
    onepulse op1(.clk(clk), .signal(been_ready), .op(op_ready));
    onepulse op2(.clk(clk), .signal(key_down[last_change]), .op(op_keydown));
    onepulse op3(.clk(clk), .signal(db_rst), .op(op_rst));

    judge hit_judge(
        .clk(clk),
        .rst(op_rst),
        .ready(op_ready),
        .keydown(op_keydown),
        .last_change(last_change),
        .pos_0(pos_0),
        .pos_1(pos_1),
        .pos_2(pos_2),
        .pos_3(pos_3),
        .hit_0(hit_0),
        .hit_1(hit_1),
        .hit_2(hit_2),
        .hit_3(hit_3)
    );

    onepulse op_Damage0(.clk(clk), .signal(damage_0), .op(op_damage_0));
    onepulse op_Damage1(.clk(clk), .signal(damage_1), .op(op_damage_1));
    onepulse op_Damage2(.clk(clk), .signal(damage_2), .op(op_damage_2));
    onepulse op_Damage3(.clk(clk), .signal(damage_3), .op(op_damage_3));
    onepulse op_Hit0(.clk(clk), .signal(hit_0), .op(op_hit_0));
    onepulse op_Hit1(.clk(clk), .signal(hit_1), .op(op_hit_1));
    onepulse op_Hit2(.clk(clk), .signal(hit_2), .op(op_hit_2));
    onepulse op_Hit3(.clk(clk), .signal(hit_3), .op(op_hit_3));
    onepulse op_Ticket(.clk(clk), .signal(ticket), .op(op_ticket));

    player play(
        .clk(clk),
        .rst(op_rst),
        .cheat(cheat),
        .damage_0(op_damage_0),
        .damage_1(op_damage_1),
        .fail(fail),
        .hit_0(op_hit_0),
        .hit_1(op_hit_1),
        .hit_2(op_hit_2),
        .hit_3(op_hit_3),
        .ticket(op_ticket),
        .state(state),
        .life(led),
        .total_money(money),
        .display(DISPLAY),
        .digit(DIGIT)
    );

    gamestart start(
        .clk(clk),
        .rst(op_rst),
        .clk_22(clk_22),
        .clk_25MHz(clk_25MHz),
        .ready(op_ready),
        .keydown(op_keydown),
        .money(money),
        .last_change(last_change),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .data(data),
        .pixel(pixel_gamestart),
        .level(level),
        .ticket(ticket)
    );

    failure failed(
        .clk(clk),
        .rst(op_rst),
        .clk_22(clk_22),
        .clk_25MHz(clk_25MHz),
        .ready(op_ready),
        .keydown(op_keydown),
        .last_change(last_change),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .data(data),
        .pixel(pixel_failure),
        .return(return)
    );

    music music(
        .clk(clk),
        .clk_22(clk_22),
        .reset(op_rst),
        .mode(state),
        .audio_mclk(audio_mclk),     
        .audio_lrck(audio_lrck),   
        .audio_sck(audio_sck),  
        .audio_sdin(audio_sdin) 
    );

    
endmodule