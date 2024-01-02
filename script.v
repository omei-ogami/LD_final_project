module script (
    input clk,
    input rst,
    output reg [3:0] pos_0
);

parameter none = 4'd0;
parameter pos_Q = 4'd1;
parameter pos_W = 4'd2;
parameter pos_E = 4'd3;
parameter pos_A = 4'd4;
parameter pos_S = 4'd5;
parameter pos_D = 4'd6;
parameter pos_Z = 4'd7;
parameter pos_X = 4'd8;
parameter pos_C = 4'd9;

reg [7:0] counter = 0;

always @(posedge clk or posedge rst) begin
    if(rst) counter <= 0;
    else begin
        if(counter < 160) counter <= counter + 1;
        else counter <= 0;
    end
end

always @(*) begin
        case(counter)
            12'd0: pos_0 = pos_Q;   12'd1: pos_0 = pos_Q;
            12'd2: pos_0 = pos_Q;   12'd3: pos_0 = pos_Q;
            12'd4: pos_0 = pos_Q;   12'd5: pos_0 = pos_Q;
            12'd6: pos_0 = pos_Q;   12'd7: pos_0 = pos_Q;
            12'd8: pos_0 = pos_W;   12'd9: pos_0 = pos_W;
            12'd10: pos_0 = pos_W;  12'd11: pos_0 = pos_W;
            12'd12: pos_0 = pos_W;  12'd13: pos_0 = pos_W;
            12'd14: pos_0 = pos_W;  12'd15: pos_0 = pos_W;
            12'd16: pos_0 = pos_E;  12'd17: pos_0 = pos_E;
            12'd18: pos_0 = pos_E;  12'd19: pos_0 = pos_E;
            12'd20: pos_0 = pos_E;  12'd21: pos_0 = pos_E;
            12'd22: pos_0 = pos_E;  12'd23: pos_0 = pos_E;
            12'd24: pos_0 = pos_A;  12'd25: pos_0 = pos_A;
            12'd26: pos_0 = pos_A;  12'd27: pos_0 = pos_A;
            12'd28: pos_0 = pos_A;  12'd29: pos_0 = pos_A;
            12'd30: pos_0 = pos_A;  12'd31: pos_0 = pos_A;
            12'd32: pos_0 = pos_S;  12'd33: pos_0 = pos_S;
            12'd34: pos_0 = pos_S;  12'd35: pos_0 = pos_S;
            12'd36: pos_0 = pos_S;  12'd37: pos_0 = pos_S;
            12'd38: pos_0 = pos_S;  12'd39: pos_0 = pos_S;
            12'd40: pos_0 = pos_D;  12'd41: pos_0 = pos_D;
            12'd42: pos_0 = pos_D;  12'd43: pos_0 = pos_D;
            12'd44: pos_0 = pos_D;  12'd45: pos_0 = pos_D;
            12'd46: pos_0 = pos_D;  12'd47: pos_0 = pos_D;
            12'd48: pos_0 = pos_Z;  12'd49: pos_0 = pos_Z;
            12'd50: pos_0 = pos_Z;  12'd51: pos_0 = pos_Z;
            12'd52: pos_0 = pos_Z;  12'd53: pos_0 = pos_Z;
            12'd54: pos_0 = pos_Z;  12'd55: pos_0 = pos_Z;
            12'd56: pos_0 = pos_X;  12'd57: pos_0 = pos_X;
            12'd58: pos_0 = pos_X;  12'd59: pos_0 = pos_X;
            12'd60: pos_0 = pos_X;  12'd61: pos_0 = pos_X;
            12'd62: pos_0 = pos_X;  12'd63: pos_0 = pos_X;
            12'd64: pos_0 = pos_C;  12'd65: pos_0 = pos_C;
            12'd66: pos_0 = pos_C;  12'd67: pos_0 = pos_C;
            12'd68: pos_0 = pos_C;  12'd69: pos_0 = pos_C;
            12'd70: pos_0 = pos_C;  12'd71: pos_0 = pos_C;
            12'd72: pos_0 = none;   12'd73: pos_0 = none;
            12'd74: pos_0 = none;   12'd75: pos_0 = none;
            12'd76: pos_0 = none;   12'd77: pos_0 = none;
            12'd78: pos_0 = none;   12'd79: pos_0 = none;
            12'd80: pos_0 = pos_Q;  12'd81: pos_0 = pos_Q;
            12'd82: pos_0 = pos_Q;  12'd83: pos_0 = pos_Q;
            12'd84: pos_0 = pos_Q;  12'd85: pos_0 = pos_Q;
            12'd86: pos_0 = pos_Q;  12'd87: pos_0 = pos_Q;
            12'd88: pos_0 = pos_A;  12'd89: pos_0 = pos_A;
            12'd90: pos_0 = pos_A;  12'd91: pos_0 = pos_A;
            12'd92: pos_0 = pos_A;  12'd93: pos_0 = pos_A;
            12'd94: pos_0 = pos_A;  12'd95: pos_0 = pos_A;
            12'd96: pos_0 = pos_Z;  12'd97: pos_0 = pos_Z;
            12'd98: pos_0 = pos_Z;  12'd99: pos_0 = pos_Z;
            12'd100: pos_0 = pos_Z; 12'd101: pos_0 = pos_Z;
            12'd102: pos_0 = pos_Z; 12'd103: pos_0 = pos_Z;
            12'd104: pos_0 = pos_W; 12'd105: pos_0 = pos_W;
            12'd106: pos_0 = pos_W; 12'd107: pos_0 = pos_W;
            12'd108: pos_0 = pos_W; 12'd109: pos_0 = pos_W;
            12'd110: pos_0 = pos_W; 12'd111: pos_0 = pos_W;
            12'd112: pos_0 = pos_S; 12'd113: pos_0 = pos_S;
            12'd114: pos_0 = pos_S; 12'd115: pos_0 = pos_S;
            12'd116: pos_0 = pos_S; 12'd117: pos_0 = pos_S;
            12'd118: pos_0 = pos_S; 12'd119: pos_0 = pos_S;
            12'd120: pos_0 = pos_X; 12'd121: pos_0 = pos_X;
            12'd122: pos_0 = pos_X; 12'd123: pos_0 = pos_X;
            12'd124: pos_0 = pos_X; 12'd125: pos_0 = pos_X;
            12'd126: pos_0 = pos_X; 12'd127: pos_0 = pos_X;
            12'd128: pos_0 = pos_E; 12'd129: pos_0 = pos_E;
            12'd130: pos_0 = pos_E; 12'd131: pos_0 = pos_E;
            12'd132: pos_0 = pos_E; 12'd133: pos_0 = pos_E;
            12'd134: pos_0 = pos_E; 12'd135: pos_0 = pos_E;
            12'd136: pos_0 = pos_D; 12'd137: pos_0 = pos_D;
            12'd138: pos_0 = pos_D; 12'd139: pos_0 = pos_D;
            12'd140: pos_0 = pos_D; 12'd141: pos_0 = pos_D;
            12'd142: pos_0 = pos_D; 12'd143: pos_0 = pos_D;
            12'd144: pos_0 = pos_C; 12'd145: pos_0 = pos_C;
            12'd146: pos_0 = pos_C; 12'd147: pos_0 = pos_C;
            12'd148: pos_0 = pos_C; 12'd149: pos_0 = pos_C;
            12'd150: pos_0 = pos_C; 12'd151: pos_0 = pos_C;
            12'd152: pos_0 = none;  12'd153: pos_0 = none;
            12'd154: pos_0 = none;  12'd155: pos_0 = none;
            12'd156: pos_0 = none;  12'd157: pos_0 = none;
            12'd158: pos_0 = none;  12'd159: pos_0 = none;
        endcase
end
    
endmodule