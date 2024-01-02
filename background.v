module background(
    input clk,
    input rst,
    input [9:0] h_cnt,
    input [9:0] v_cnt,
    output [11:0] pixel
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
    wire [16:0] pixel_addr_bg;
    wire valid;

    clock_divider clk_div_bg(
        .clk(clk),
        .clk1(clk_25MHz),
        .clk22(clk_22)
    );

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
   output [16:0] pixel_addr
   );
  
   assign pixel_addr = ((h_cnt >> 1) + 320 * (v_cnt >> 1));  //640*480 --> 320*240 
    
endmodule
