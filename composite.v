module composite (
    input clk,
    input rst,
    input [3:0] state,
    input [11:0] background,
    input [11:0] enemyL,
    input [11:0] gamestart,
    input [11:0] failure,
    output reg [11:0] pixel
);

    parameter GAMESTART = 4'd0;
    parameter EASY = 4'd1;
    parameter NORMAL = 4'd2;
    parameter HARD = 4'd3;
    parameter INFERNO = 4'd4;
    parameter FAILURE = 4'd5; 

    reg [11:0] next_pixel;

    always @(posedge clk or posedge rst) begin
        if(rst) pixel <= gamestart;
        else pixel <= next_pixel;
    end

    always @(*) begin
        next_pixel = pixel;
        if(state == GAMESTART) next_pixel = gamestart;
        else if(state == FAILURE) next_pixel = failure;
        else begin
            if(enemyL == 12'h0) next_pixel = background;
            else next_pixel = enemyL;
        end
    end
    
endmodule