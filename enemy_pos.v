module enemy_pos (
    input clk,
    input [9:0] h_cnt,
    input [9:0] v_cnt,
    input [4:0] pos,
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
        if(h_cnt > 40 && h_cnt < 200 && v_cnt > 50 && v_cnt < 170 && pos == 1 && !hit) begin
            next_H = h_cnt - 40;
            next_V = v_cnt - 50;
        end
        // W
        else if(h_cnt > 210 && h_cnt < 370 && v_cnt > 50 && v_cnt < 170 && pos == 2 && !hit) begin
            next_H = h_cnt - 210;
            next_V = v_cnt - 50;
        end
        // E
        else if(h_cnt > 380 && h_cnt < 540 && v_cnt > 50 && v_cnt < 170 && pos == 3 && !hit) begin
            next_H = h_cnt - 380;
            next_V = v_cnt - 50;
        end
        // A
        else if(h_cnt > 60 && h_cnt < 220 && v_cnt > 180 && v_cnt < 300 && pos == 4 && !hit) begin
            next_H = h_cnt - 60;
            next_V = v_cnt - 180;
        end
        // S
        else if(h_cnt > 230 && h_cnt < 390 && v_cnt > 180 && v_cnt < 300 && pos == 5 && !hit) begin
            next_H = h_cnt - 230;
            next_V = v_cnt - 180;
        end
        // D
        else if(h_cnt > 400 && h_cnt < 560 && v_cnt > 180 && v_cnt < 300 && pos == 6 && !hit) begin
            next_H = h_cnt - 400;
            next_V = v_cnt - 180;
        end
        // Z
        else if(h_cnt > 90 && h_cnt < 250 && v_cnt > 310 && v_cnt < 430 && pos == 7 && !hit) begin
            next_H = h_cnt - 90;
            next_V = v_cnt - 310;
        end
        // X
        else if(h_cnt > 260 && h_cnt < 420 && v_cnt > 310 && v_cnt < 430 && pos == 8 && !hit) begin
            next_H = h_cnt - 260;
            next_V = v_cnt - 310;
        end
        // C
        else if(h_cnt > 430 && h_cnt < 590 && v_cnt > 310 && v_cnt < 430 && pos == 9 && !hit) begin
            next_H = h_cnt - 430;
            next_V = v_cnt - 310;
        end
        else begin
            next_H = 0;
            next_V = 0;
        end
    end
    
endmodule