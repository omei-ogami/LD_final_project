module enemy_pos (
    input clk,
    input [9:0] h_cnt,
    input [9:0] v_cnt,
    input [4:0] pos_0,
    input [4:0] pos_1,
    input [4:0] pos_2,
    input [4:0] pos_3,
    input hit,
    output reg [9:0] H,
    output reg [9:0] V
);

    reg [9:0] next_H, next_V;

    always @(posedge clk) begin
        H <= next_H;
        V <= next_V;
    end

    always @(*) begin
        // Q
        if(h_cnt > 40 && h_cnt < 200 && v_cnt > 50 && v_cnt < 170 && (pos_0 == 1 || pos_1 == 1 || pos_2 == 12 || pos_3 == 21) && !hit) begin
            next_H = h_cnt - 40;
            next_V = v_cnt - 50;
        end
        // W
        else if(h_cnt > 210 && h_cnt < 370 && v_cnt > 50 && v_cnt < 170 && (pos_0 == 2 || pos_1 == 2 || pos_2 == 13 || pos_3 == 22) && !hit) begin
            next_H = h_cnt - 210;
            next_V = v_cnt - 50;
        end
        // E
        else if(h_cnt > 380 && h_cnt < 540 && v_cnt > 50 && v_cnt < 170 && (pos_0 == 3 || pos_1 == 3 || pos_2 == 14 || pos_3 == 23) && !hit) begin
            next_H = h_cnt - 380;
            next_V = v_cnt - 50;
        end
        // A
        else if(h_cnt > 60 && h_cnt < 220 && v_cnt > 180 && v_cnt < 300 && (pos_0 == 4 || pos_1 == 4 || pos_2 == 15 || pos_3 == 24) && !hit) begin
            next_H = h_cnt - 60;
            next_V = v_cnt - 180;
        end
        // S
        else if(h_cnt > 230 && h_cnt < 390 && v_cnt > 180 && v_cnt < 300 && (pos_0 == 5 || pos_1 == 5 || pos_2 == 16 || pos_3 == 25) && !hit) begin
            next_H = h_cnt - 230;
            next_V = v_cnt - 180;
        end
        // D
        else if(h_cnt > 400 && h_cnt < 560 && v_cnt > 180 && v_cnt < 300 && (pos_0 == 6 || pos_1 == 6 || pos_2 == 17 || pos_3 == 26) && !hit) begin
            next_H = h_cnt - 400;
            next_V = v_cnt - 180;
        end
        // Z
        else if(h_cnt > 90 && h_cnt < 250 && v_cnt > 310 && v_cnt < 430 && (pos_0 == 7 || pos_1 == 7 || pos_2 == 18 || pos_3 == 27) && !hit) begin
            next_H = h_cnt - 90;
            next_V = v_cnt - 310;
        end
        // X
        else if(h_cnt > 260 && h_cnt < 420 && v_cnt > 310 && v_cnt < 430 && (pos_0 == 8 || pos_1 == 8 || pos_2 == 19 || pos_3 == 28) && !hit) begin
            next_H = h_cnt - 260;
            next_V = v_cnt - 310;
        end
        // C
        else if(h_cnt > 430 && h_cnt < 590 && v_cnt > 310 && v_cnt < 430 && (pos_0 == 9 || pos_1 == 9 || pos_2 == 20 || pos_3 == 29) && !hit) begin
            next_H = h_cnt - 430;
            next_V = v_cnt - 310;
        end
        else begin
            next_H = 0;
            next_V = 0;
        end
    end
    
endmodule