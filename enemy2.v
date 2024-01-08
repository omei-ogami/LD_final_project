module enemy2(
    input clk,
    input rst,
    input clk_22,
    input clk_25MHz,
    input hit_3,
    input [4:0] pos_3,
    input [9:0] h_cnt,
    input [9:0] v_cnt,
    input [11:0] data,
    output [11:0] pixel,
    output reg damage
);

    /////////////////////////////////////////////////////////////////
    // VGA
    /////////////////////////////////////////////////////////////////
    wire [14:0] pixel_addr_e2;
    wire [9:0] H, V;

    reg next_damage;

    mem_addr_gen_e2 addr_e2(
        .clk(clk_22),
        .rst(rst),
        .h_cnt(H),
        .v_cnt(V),
        .pixel_addr(pixel_addr_e2)
    );
     
 
    blk_mem_gen_5 image_e2(
        .clka(clk_25MHz),
        .wea(0),
        .addra(pixel_addr_e2),
        .dina(data[11:0]),
        .douta(pixel)
    ); 

    always @(posedge clk) begin
        damage <= next_damage;
    end

    always @(*) begin
        next_damage = damage;
        if((pos_3 != 0 && pos_3 != 10) || hit_3) next_damage = 1'b0;
        else if(!hit_3) next_damage = 1'b1;
        
    //    if((pos_1 != 0 && pos_1 != 10 || (pos_1 >= 12 && pos_1 <= 20)) || hit_1) next_damage = 1'b0;
    //    else if(!hit_1) next_damage = 1'b1; 
    end

    enemy_pos Pos_2(
        .clk(clk),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .pos_0(5'd0),
        .pos_1(5'd0),
        .pos_2(5'd0),
        .pos_3(pos_3),
        .hit(hit_3),
        .H(H),
        .V(V)
    );


    
endmodule



module mem_addr_gen_e2(
    input clk,
    input rst,
    input [9:0] h_cnt,
    input [9:0] v_cnt,
    output [14:0] pixel_addr
    );

    assign pixel_addr = (h_cnt + v_cnt * 160);  //640*480 --> 160*120 
    
    
endmodule
