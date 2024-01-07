module judge (
    input clk, 
    input rst,
    input ready,
    input keydown,
    input [8:0] last_change,
    input [3:0] pos_0,
    input [3:0] pos_1,
    input [3:0] pos_2,
    output reg hit_0,
    output reg hit_1,
    output reg hit_2
);

    reg [3:0] pos_hit;
    reg flag_0 = 0, flag_1 = 0, flag_2 = 0;

    // keycodes
    parameter KEY_Q = 9'b0_0001_0101;
    parameter KEY_W = 9'b0_0001_1101;
    parameter KEY_E = 9'b0_0010_0100;
    parameter KEY_A = 9'b0_0001_1100;
    parameter KEY_S = 9'b0_0001_1011;
    parameter KEY_D = 9'b0_0010_0011;
    parameter KEY_Z = 9'b0_0001_1010;
    parameter KEY_X = 9'b0_0010_0010;
    parameter KEY_C = 9'b0_0010_0001;

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            flag_0 <= 1'b0;
            flag_1 <= 1'b0;
            hit_0 <= 1'b0;
            hit_1 <= 1'b0;
        end
        else begin
            // judge_0
            if(pos_0 == 11) begin
                flag_0 <= 1'b0;
                hit_0 <= 1'b0;
            end
            if(!flag_0 && pos_0 != 0 && pos_0 == pos_hit && keydown && ready) begin
                hit_0 <= 1'b1;
                flag_0 <= 1'b1;
            end 
            else if(flag_0) hit_0 <= 1'b1;
            else hit_0 <= 1'b0;
            // judge_1
            if(pos_1 == 11) begin
                flag_1 <= 1'b0;
                hit_1 <= 1'b0;
            end
            if(!flag_1 && pos_1 != 0 && pos_1 == pos_hit && keydown && ready) begin
                hit_1 <= 1'b1;
                flag_1 <= 1'b1;
            end 
            else if(flag_1) hit_1 <= 1'b1;
            else hit_1 <= 1'b0;
            // judge_2
            if(pos_2 == 11) begin
                flag_2 <= 1'b0;
                hit_2 <= 1'b0;
            end
            if(!flag_2 && pos_2 != 0 && pos_2 == pos_hit + 11 && keydown && ready) begin
                hit_2 <= 1'b1;
                flag_2 <= 1'b1;
            end 
            else if(flag_2) hit_2 <= 1'b1;
            else hit_2 <= 1'b0;
        end
    end

    // decode
    always @(*) begin
        case(last_change) 
            KEY_Q: pos_hit = 1;
            KEY_W: pos_hit = 2;
            KEY_E: pos_hit = 3;
            KEY_A: pos_hit = 4;
            KEY_S: pos_hit = 5;
            KEY_D: pos_hit = 6;
            KEY_Z: pos_hit = 7;
            KEY_X: pos_hit = 8;
            KEY_C: pos_hit = 9;
            default: pos_hit = 0;
        endcase
    end
    
endmodule