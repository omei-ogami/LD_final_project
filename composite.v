module composite (
    input clk,
    input rst,
    input [3:0] state,
    input [11:0] background,
    input [11:0] enemy0,
    input [11:0] enemy1,
    input [11:0] enemy2,
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
            if(enemy0 == 12'h0 && enemy1 == 12'h0 && enemy2 == 12'h0) next_pixel = background;
            else begin
                if(enemy0 != 12'h0) next_pixel = enemy0;
                else if(enemy1 != 12'h0) next_pixel = enemy1;
                else next_pixel = enemy2;
            end
        end
    end
    
endmodule