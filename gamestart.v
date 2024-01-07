module gamestart(
    input clk,
    input rst,
    input clk_22,
    input clk_25MHz,
    input ready,
    input keydown,
    input [6:0] money,
    input [8:0] last_change, 
    input [9:0] h_cnt,
    input [9:0] v_cnt,
    input [11:0] data,
    output [11:0] pixel,
    output reg [2:0] level,
    output reg ticket
);

    /////////////////////////////////////////////////////////////////
    // VGA
    /////////////////////////////////////////////////////////////////
    wire [14:0] pixel_addr_gs;
    wire valid;

    reg [2:0] next_level;
    reg next_ticket;
    

    parameter KEY_1 = 9'b0_0001_0110; // 1
    parameter KEY_2 = 9'b0_0001_1110; // 2
    parameter KEY_3 = 9'b0_0010_0110; // 3
    parameter KEY_QMARK = 9'b0_0100_1010; // ?

    mem_addr_gen_gs addr_gs(
        .clk(clk_22),
        .rst(rst),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .pixel_addr(pixel_addr_gs)
    );
     
 
    blk_mem_gen_2 image_gs(
        .clka(clk_25MHz),
        .wea(0),
        .addra(pixel_addr_gs),
        .dina(data[11:0]),
        .douta(pixel)
    ); 

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            level <= 3'd0;
            ticket <= 1'b0;
        end
        else begin
            if(keydown && ready) begin
                if(money >= 10) begin
                    level <= next_level;
                    ticket <= next_ticket;
                end
                else begin
                    level <= 3'd0;
                    ticket <= 1'b0;
                end
            end
        end
    end

    // decode
    always @(*) begin
        case (last_change)
            KEY_1: begin
                next_level = 3'd1;
                next_ticket = 1'b1;
            end
            KEY_2: begin
                next_level = 3'd2;
                next_ticket = 1'b1;
            end
            KEY_3: next_level = 3'd3;
            KEY_QMARK: next_level = 3'd4;
            default: begin
                next_level = 3'd0;
                next_ticket = 1'b0;
            end
        endcase
    end
    
endmodule

module mem_addr_gen_gs(
   input clk,
   input rst,
   input [9:0] h_cnt,
   input [9:0] v_cnt,
   output [14:0] pixel_addr
   );
  
   assign pixel_addr = ((h_cnt >> 2) + 160 * (v_cnt >> 2));  
    
endmodule