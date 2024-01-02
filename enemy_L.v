module enemyL(
    input clk,
    input rst,
    input [9:0] h_cnt,
    input [9:0] v_cnt,
    input [11:0] data,
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
    wire [14:0] pixel_addr_eL;
    reg [9:0] H, V, next_H, next_V;

    clock_divider clk_div_eL(
        .clk(clk),
        .clk1(clk_25MHz),
        .clk22(clk_22)
    );

    mem_addr_gen_eL addr_eL(
        .clk(clk_22),
        .rst(rst),
        .h_cnt(H),
        .v_cnt(V),
        .pixel_addr(pixel_addr_eL)
    );
     
 
    blk_mem_gen_1 image_eL(
        .clka(clk_25MHz),
        .wea(0),
        .addra(pixel_addr_eL),
        .dina(data[11:0]),
        .douta(pixel)
    ); 

    always @(posedge clk) begin
        H <= next_H;
        V <= next_V;
    end

    always @(*) begin
        // Q
        if(h_cnt > 40 && h_cnt < 200 && v_cnt > 50 && v_cnt < 170) begin
            next_H = h_cnt - 40;
            next_V = v_cnt - 50;
        end
        // W
        else if(h_cnt > 210 && h_cnt < 370 && v_cnt > 50 && v_cnt < 170) begin
            next_H = h_cnt - 210;
            next_V = v_cnt - 50;
        end
        // E
        else if(h_cnt > 380 && h_cnt < 540 && v_cnt > 50 && v_cnt < 170) begin
            next_H = h_cnt - 380;
            next_V = v_cnt - 50;
        end
        // A
        else if(h_cnt > 60 && h_cnt < 220 && v_cnt > 180 && v_cnt < 300) begin
            next_H = h_cnt - 60;
            next_V = v_cnt - 180;
        end
        // S
        else if(h_cnt > 230 && h_cnt < 390 && v_cnt > 180 && v_cnt < 300) begin
            next_H = h_cnt - 230;
            next_V = v_cnt - 180;
        end
        // D
        else if(h_cnt > 400 && h_cnt < 560 && v_cnt > 180 && v_cnt < 300) begin
            next_H = h_cnt - 400;
            next_V = v_cnt - 180;
        end
        // Z
        else if(h_cnt > 90 && h_cnt < 250 && v_cnt > 310 && v_cnt < 430) begin
            next_H = h_cnt - 90;
            next_V = v_cnt - 310;
        end
        // X
        else if(h_cnt > 260 && h_cnt < 420 && v_cnt > 310 && v_cnt < 430) begin
            next_H = h_cnt - 260;
            next_V = v_cnt - 310;
        end
        // C
        else if(h_cnt > 430 && h_cnt < 590 && v_cnt > 310 && v_cnt < 430) begin
            next_H = h_cnt - 430;
            next_V = v_cnt - 310;
        end
        else begin
            next_H = 0;
            next_V = 0;
        end
    end
    
endmodule



module mem_addr_gen_eL(
    input clk,
    input rst,
    input [9:0] h_cnt,
    input [9:0] v_cnt,
    output [14:0] pixel_addr
    );

    assign pixel_addr = (h_cnt + v_cnt * 160) % 19200;  //640*480 --> 160*120 
    
    
endmodule
