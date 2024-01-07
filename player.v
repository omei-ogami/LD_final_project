module player (
    input clk,
    input rst,
    input damage_0,
    input damage_1,
    input hit_0,
    input hit_1,
    input ticket,
    input [3:0] state,
    output reg fail,
    output [9:0] life,
    output [6:0] total_money,
    output [6:0] display,
	output [3:0] digit
);

    parameter FULL_LIFE = 10'b1111111111;
    parameter NONLIFE = 10'b0000000000;

    /////////////////////////////////////////////////////////////////
    // life system
    /////////////////////////////////////////////////////////////////
    reg [3:0] total_damage = 0, next_damage;
    reg next_fail;
    /////////////////////////////////////////////////////////////////
    // money system
    /////////////////////////////////////////////////////////////////
    reg [6:0] money = 20, next_money;
    reg [15:0] nums = 0, next_nums;
    wire [3:0] money_10, money_1;

    assign total_money = money;

    SevenSegment seg(
        .display(display),
        .digit(digit),
        .nums(nums),
        .rst(rst),
        .clk(clk)
    );

    divider money_div(
        .BCD(money),
        .digit_ten(money_10),
        .digit_one(money_1)
    );

    assign life = (state == 4'd0)? NONLIFE : FULL_LIFE >> total_damage;

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            total_damage <= 0;
            money <= 7'd20;
            fail <= 1'b0;
        end
        else begin
            total_damage <= next_damage;
            money <= next_money;
            nums <= next_nums;
            fail <= next_fail;
        end
    end

    always @(*) begin
        next_damage = total_damage;
        if(total_damage >= 10) begin
            next_fail = 1'b1;
        end
        else next_fail = 1'b0;
        if(state == 4'd0 || state == 4'd5) next_damage = 0;
        else begin
            if(damage_0) next_damage = next_damage + 1;
            if(damage_1) next_damage = next_damage + 2;
        end
    end

    always @(*) begin
        next_money = money;
        next_nums = {state, 4'd0, money_10, money_1};
        if(ticket) begin
            if(money > 10) next_money = money - 10;
            else next_money = 0;
        end
        else next_money = money;
        // state 1-4 : play
        if(state == 4'd1 || state == 4'd2 || state == 4'd3 || state == 4'd4) begin
            if(total_damage == 10) begin
                if(money > 7'd10) next_money = money - 5;
                else next_money = 0;
            end
            else begin
                if(hit_0 && money < 7'd99) next_money = next_money + 1;
                if(hit_1 && money < 7'd99) next_money = next_money + 1;
            end
        end
        // state 5 : failure
        else if(state == 4'd5)begin
            next_money = money;
        end
    end
endmodule

module divider (
    input [6:0] BCD,
    output [3:0] digit_ten,
    output [3:0] digit_one
);

    assign digit_ten = BCD / 10;
    assign digit_one = BCD - 10 * digit_ten;
    
endmodule