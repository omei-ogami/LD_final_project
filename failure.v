module failure(
    input clk,
    input clk_22,
    input clk_25MHz,
    input rst,
    input ready,
    input keydown,
    input [8:0] last_change, 
    input [9:0] h_cnt,
    input [9:0] v_cnt,
    input [11:0] data,
    output [11:0] pixel,
    output reg return
);

    /////////////////////////////////////////////////////////////////
    // VGA
    /////////////////////////////////////////////////////////////////
    wire [16:0] pixel_addr_fail;
    wire valid;

    reg [2:0] next_level;
    

    parameter KEY_SCOLON = 9'b0_0100_1100;  // ;

    mem_addr_gen_fail addr_fail(
        .clk(clk_22),
        .rst(rst),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .pixel_addr(pixel_addr_fail)
    );
     
 
    blk_mem_gen_3 image_fail(
        .clka(clk_25MHz),
        .wea(0),
        .addra(pixel_addr_fail),
        .dina(data[11:0]),
        .douta(pixel)
    ); 

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            return <= 1'b0;
        end
        else begin
            if(last_change == KEY_SCOLON && ready && keydown) begin
                return <= 1'b1;
            end
            else return <= 1'b0;
        end
    end
    
endmodule

module mem_addr_gen_fail(
   input clk,
   input rst,
   input [9:0] h_cnt,
   input [9:0] v_cnt,
   output [14:0] pixel_addr
   );
  
   assign pixel_addr = ((h_cnt >> 2) + 160 * (v_cnt >> 2));  
    
endmodule