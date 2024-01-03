module judge (
    input clk, 
    input rst,
    inout wire PS2_DATA,
	inout wire PS2_CLK,
    input [3:0] pos_0,
    output reg hit
);

    /////////////////////////////////////////////////////////////////
    // keyboard
    /////////////////////////////////////////////////////////////////
    wire [511:0] key_down;
    wire [8:0] last_change;
	wire been_ready, op_ready, op_keydown;

    reg [3:0] pos_hit;
    reg flag = 0;

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

    KeyboardDecoder key_de (
		.key_down(key_down),
		.last_change(last_change),
		.key_valid(been_ready),
		.PS2_DATA(PS2_DATA),
		.PS2_CLK(PS2_CLK),
		.rst(op_rst),
		.clk(clk)
	);

    onepulse op1(.clk(clk), .signal(been_ready), .op(op_ready));
    onepulse op2(.clk(clk), .signal(key_down[last_change]), .op(op_keydown));

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            flag <= 1'b0;
            hit <= 1'b0;
        end
        else begin
            if(pos_0 == 0) begin
                flag <= 1'b0;
                hit <= 1'b0;
            end
            if(!flag && pos_0 != 0 && pos_0 == pos_hit && op_keydown && op_ready) begin
                hit <= 1'b1;
                flag <= 1'b1;
            end 
            else if(flag) hit <= 1'b1;
            else hit <= 1'b0;
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