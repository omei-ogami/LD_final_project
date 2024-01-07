module enemy0(
    input clk,
    input rst,
    input clk_22,
    input clk_25MHz,
    input hit_0,
    input hit_1,
    input [4:0] pos_0,
    input [4:0] pos_1,
    input [9:0] h_cnt,
    input [9:0] v_cnt,
    input [11:0] data,
    output [11:0] pixel0,
    output reg damage_0,
    output reg damage_1
);

    /////////////////////////////////////////////////////////////////
    // VGA
    /////////////////////////////////////////////////////////////////
    wire [14:0] pixel_addr_e0;
    wire [9:0] H, V;

    reg next_damage_0, next_damage_1;

    mem_addr_gen_e0 addr_e0(
        .clk(clk_22),
        .rst(rst),
        .h_cnt(H),
        .v_cnt(V),
        .pixel_addr(pixel_addr_e0)
    );
     
 
    blk_mem_gen_1 image_e0(
        .clka(clk_25MHz),
        .wea(0),
        .addra(pixel_addr_e0),
        .dina(data[11:0]),
        .douta(pixel0)
    ); 

    always @(posedge clk) begin
        damage_0 <= next_damage_0;
        damage_1 <= next_damage_1;
    end

    always @(*) begin
        next_damage_0 = damage_0;
        next_damage_1 = damage_1;
        if((pos_0 != 0 && pos_0 != 10) || hit_0) next_damage_0 = 1'b0;
        else if(!hit_0) next_damage_0 = 1'b1;
        if((pos_1 != 0 && pos_1 != 10) || hit_1) next_damage_1 = 1'b0;
        else if(!hit_1) next_damage_1 = 1'b1; 
        
    //    if((pos_1 != 0 && pos_1 != 10 || (pos_1 >= 12 && pos_1 <= 20)) || hit_1) next_damage = 1'b0;
    //    else if(!hit_1) next_damage = 1'b1; 
    end

    enemy_pos Pos_00(
        .clk(clk),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .pos_0(pos_0),
        .pos_1(pos_1),
        .pos_2(5'd0),
        .hit(hit_0),
        .H(H),
        .V(V)
    );


    
endmodule



module mem_addr_gen_e0(
    input clk,
    input rst,
    input [9:0] h_cnt,
    input [9:0] v_cnt,
    output [14:0] pixel_addr
    );

    assign pixel_addr = (h_cnt + v_cnt * 160);  //640*480 --> 160*120 
    
    
endmodule
