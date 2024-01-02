module composite (
    input clk,
    input [11:0] background,
    input [11:0] enemyL,
    output [11:0] pixel
);

assign pixel = (enemyL == 12'h0)? background : enemyL;
    
endmodule