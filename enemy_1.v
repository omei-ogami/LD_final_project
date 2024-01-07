module enemy1(
    input clk,
    input rst,
    input clk_22,
    input clk_25MHz,
    input hit_1,
    input [4:0] pos_1,
    input [9:0] h_cnt,
    input [9:0] v_cnt,
    input [11:0] data,
    output [11:0] pixel,
    output reg damage
);

    /////////////////////////////////////////////////////////////////
    // VGA
    /////////////////////////////////////////////////////////////////
    wire [14:0] pixel_addr_e1;
    wire [9:0] H, V;
    reg [4:0] pos;

    reg next_damage;

    mem_addr_gen_e1 addr_e1(
        .clk(clk_22),
        .rst(rst),
        .h_cnt(H),
        .v_cnt(V),
        .pixel_addr(pixel_addr_e1)
    );
     
 
    blk_mem_gen_4 image_e1(
        .clka(clk_25MHz),
        .wea(0),
        .addra(pixel_addr_e1),
        .dina(data[11:0]),
        .douta(pixel)
    ); 

    always @(posedge clk) begin
        damage <= next_damage;
        if(pos_1 > 11) pos <= pos_1 - 11;
        else pos <= pos_1;
    end

    always @(*) begin
        next_damage = damage;
        if(hit_1 && pos_1 >= 12 && pos_1 <= 20) next_damage = 1'b1;
        else next_damage = 1'b0; 
    end

    enemy_pos Pos_11(
        .clk(clk),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .pos(pos),
        .hit(hit_1),
        .H(H),
        .V(V)
    );
    
endmodule



module mem_addr_gen_e1(
    input clk,
    input rst,
    input [9:0] h_cnt,
    input [9:0] v_cnt,
    output [14:0] pixel_addr
    );

    assign pixel_addr = (h_cnt + v_cnt * 160);  //640*480 --> 160*120 
    
    
endmodule
