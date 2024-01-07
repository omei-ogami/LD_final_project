module background(
    input clk,
    input rst,
    input clk_22,
    input clk_25MHz,
    input [9:0] h_cnt,
    input [9:0] v_cnt,
    input [11:0] data,
    output [11:0] pixel
);

    /////////////////////////////////////////////////////////////////
    // VGA
    /////////////////////////////////////////////////////////////////
    wire [14:0] pixel_addr_bg;
    wire valid;

    mem_addr_gen_bg addr_bg(
        .clk(clk_22),
        .rst(rst),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .pixel_addr(pixel_addr_bg)
    );
     
 
    blk_mem_gen_0 image_bg(
        .clka(clk_25MHz),
        .wea(0),
        .addra(pixel_addr_bg),
        .dina(data[11:0]),
        .douta(pixel)
    ); 
    
endmodule

module mem_addr_gen_bg(
   input clk,
   input rst,
   input [9:0] h_cnt,
   input [9:0] v_cnt,
   output [14:0] pixel_addr
   );
  
   assign pixel_addr = ((h_cnt >> 2) + 160 * (v_cnt >> 2));  //640*480 --> 320*240 
    
endmodule
