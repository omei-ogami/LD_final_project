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
    output hit
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
    wire [11:0] pixel, pixel_background, pixel_enemyL;
    wire valid;
    wire [9:0] h_cnt;   //640
    wire [9:0] v_cnt;   //480
    /////////////////////////////////////////////////////////////////
    // script
    /////////////////////////////////////////////////////////////////
    wire [7:0] counter;
    wire [3:0] pos_0;
    /////////////////////////////////////////////////////////////////
    // player
    /////////////////////////////////////////////////////////////////
    wire damage, op_damage;
    

    assign {vgaRed, vgaGreen, vgaBlue} = (valid==1'b1) ? pixel : 12'h0;

    composite comp(
        .clk(clk),
        .background(pixel_background),
        .enemyL(pixel_enemyL),
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
        .pos_0(pos_0)
    );

    judge hit_judge(
        .clk(clk),
        .rst(rst),
        .PS2_DATA(PS2_DATA),
		.PS2_CLK(PS2_CLK),
        .pos_0(pos_0),
        .hit(hit)
    );

    onepulse op_d(.clk(clk), .signal(damage), .op(op_damage));

    player play(
        .clk(clk),
        .rst(rst),
        .damage(op_damage),
        .life(led)
    );

    
endmodule