module composite (
    input clk,
    input rst,
    input [3:0] state,
    input [11:0] background,
    input [11:0] enemyL,
    input [11:0] gamestart,
    output reg [11:0] pixel
);

    reg [11:0] next_pixel;

    always @(posedge clk or posedge rst) begin
        if(rst) pixel <= gamestart;
        else pixel <= next_pixel;
    end

    always @(*) begin
        next_pixel = pixel;
        if(state == 4'd0) next_pixel = gamestart;
        else begin
            if(enemyL == 12'h0) next_pixel = background;
            else next_pixel = enemyL;
        end
    end
    
endmodule