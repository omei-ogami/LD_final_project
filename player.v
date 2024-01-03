module player (
    input clk,
    input rst,
    input damage,
    output [9:0] life
);

    parameter FULL_LIFE = 10'b1111111111;
    reg [3:0] total_damage = 0, next_damage;

    assign life = FULL_LIFE >> total_damage;

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            total_damage <= 0;
        end
        else begin
            total_damage <= next_damage;
        end
    end

    always @(*) begin
        next_damage = total_damage;
        if(damage && total_damage < 10) next_damage = total_damage + 1;
    end

    
endmodule