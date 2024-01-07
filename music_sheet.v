`define c   32'd261
`define d   32'd293
`define e   32'd329
`define f   32'd349 
`define g   32'd392 
`define a   32'd440
`define b   32'd493   
`define hc  32'd523   
`define hd  32'd587   
`define he  32'd659   
`define hf  32'd698   
`define hg  32'd783
`define ha  32'd880
`define hb  32'd987 
`define hhc  32'd1046 
  

`define sil 32'd50000000 // slience
module music_sheet(
    input [11:0] ibeatNum,
	input [3:0] mode,
	output reg [31:0] toneL,
    output reg [31:0] toneR
    );
    
    always@(*)begin
        if(mode == 4'd0) begin
            case(ibeatNum)
                12'd0: toneR = `he;      12'd1: toneR = `he; // HG (half-beat)
                12'd2: toneR = `he;      12'd3: toneR = `he;
                12'd4: toneR = `he;      12'd5: toneR = `he;
                12'd6: toneR = `he;      12'd7: toneR = `he;
                12'd8: toneR = `hg;      12'd9: toneR = `hg; // HE (half-beat)
                12'd10: toneR = `hg;     12'd11: toneR = `hg;
                12'd12: toneR = `ha;     12'd13: toneR = `ha;
                12'd14: toneR = `ha;     12'd15: toneR = `ha; // (Short break for repetitive notes: high E)

                12'd16: toneR = `sil;    12'd17: toneR = `sil; // HE (one-beat)
                12'd18: toneR = `sil;    12'd19: toneR = `sil;
                12'd20: toneR = `hg;     12'd21: toneR = `hg;
                12'd22: toneR = `hg;     12'd23: toneR = `hg;
                12'd24: toneR = `sil;    12'd25: toneR = `sil;
                12'd26: toneR = `sil;    12'd27: toneR = `sil;
                12'd28: toneR = `he;     12'd29: toneR = `he;
                12'd30: toneR = `he;     12'd31: toneR = `he;

                12'd32: toneR = `hg;     12'd33: toneR = `hg; // HF (half-beat)
                12'd34: toneR = `hg;     12'd35: toneR = `hg;
                12'd36: toneR = `sil;    12'd37: toneR = `sil;
                12'd38: toneR = `sil;    12'd39: toneR = `sil;
                12'd40: toneR = `hg;     12'd41: toneR = `hg; // HD (half-beat)
                12'd42: toneR = `hg;     12'd43: toneR = `hg;
                12'd44: toneR = `sil;    12'd45: toneR = `sil;
                12'd46: toneR = `sil;    12'd47: toneR = `sil; // (Short break for repetitive notes: high D)

                12'd48: toneR = `sil;    12'd49: toneR = `sil; // HD (one-beat)
                12'd50: toneR = `sil;    12'd51: toneR = `sil;
                12'd52: toneR = `sil;    12'd53: toneR = `sil;
                12'd54: toneR = `sil;    12'd55: toneR = `sil;
                12'd56: toneR = `sil;    12'd57: toneR = `sil;
                12'd58: toneR = `sil;    12'd59: toneR = `sil;
                12'd60: toneR = `sil;    12'd61: toneR = `sil;
                12'd62: toneR = `sil;    12'd63: toneR = `sil;

                // --- Measure 2 ---
                12'd64: toneR = `ha;     12'd65: toneR = `ha; // HC (half-beat)
                12'd66: toneR = `ha;     12'd67: toneR = `ha;
                12'd68: toneR = `hg;     12'd69: toneR = `hg;
                12'd70: toneR = `hg;     12'd71: toneR = `hg;
                12'd72: toneR = `he;     12'd73: toneR = `he; // HD (half-beat)
                12'd74: toneR = `he;     12'd75: toneR = `he;
                12'd76: toneR = `sil;    12'd77: toneR = `sil;
                12'd78: toneR = `sil;    12'd79: toneR = `sil;

                12'd80: toneR = `he;     12'd81: toneR = `he; // HE (half-beat)
                12'd82: toneR = `he;     12'd83: toneR = `he;
                12'd84: toneR = `sil;    12'd85: toneR = `sil;
                12'd86: toneR = `sil;    12'd87: toneR = `sil;
                12'd88: toneR = `he;     12'd89: toneR = `he; // HF (half-beat)
                12'd90: toneR = `he;     12'd91: toneR = `he;
                12'd92: toneR = `sil;    12'd93: toneR = `sil;
                12'd94: toneR = `sil;    12'd95: toneR = `sil;

                12'd96: toneR = `he;     12'd97: toneR = `he; // HG (half-beat)
                12'd98: toneR = `he;     12'd99: toneR = `he;
                12'd100: toneR = `hg;    12'd101: toneR = `hg;
                12'd102: toneR = `hg;    12'd103: toneR = `sil; // (Short break for repetitive notes: high D)
                12'd104: toneR = `sil;   12'd105: toneR = `sil; // HG (half-beat)
                12'd106: toneR = `sil;   12'd107: toneR = `sil;
                12'd108: toneR = `ha;    12'd109: toneR = `ha;
                12'd110: toneR = `ha;    12'd111: toneR = `ha; // (Short break for repetitive notes: high D)

                12'd112: toneR = `sil;    12'd113: toneR = `sil; // HG (one-beat)
                12'd114: toneR = `sil;    12'd115: toneR = `sil;
                12'd116: toneR = `sil;    12'd117: toneR = `sil;
                12'd118: toneR = `sil;    12'd119: toneR = `sil;
                12'd120: toneR = `sil;    12'd121: toneR = `sil;
                12'd122: toneR = `sil;    12'd123: toneR = `sil;
                12'd124: toneR = `sil;    12'd125: toneR = `sil;
                12'd126: toneR = `sil;    12'd127: toneR = `sil;
                
                // ----Measure 3----
                12'd128: toneR = `hhc;    12'd129: toneR = `hhc;
                12'd130: toneR = `hhc;    12'd131: toneR = `hhc;
                12'd132: toneR = `hc;     12'd133: toneR = `hc;
                12'd134: toneR = `hc;     12'd135: toneR = `hc;

                12'd136: toneR = `hg;     12'd137: toneR = `hg;
                12'd138: toneR = `hg;     12'd139: toneR = `hg;
                12'd140: toneR = `sil;    12'd141: toneR = `sil;
                12'd142: toneR = `sil;    12'd143: toneR = `sil;

                12'd144: toneR = `he;     12'd145: toneR = `he;
                12'd146: toneR = `he;     12'd147: toneR = `he;
                12'd148: toneR = `sil;    12'd149: toneR = `sil;
                12'd150: toneR = `sil;    12'd151: toneR = `sil;

                12'd152: toneR = `he;     12'd153: toneR = `he;
                12'd154: toneR = `he;     12'd155: toneR = `he;
                12'd156: toneR = `sil;    12'd157: toneR = `sil;
                12'd158: toneR = `sil;    12'd159: toneR = `sil;

                12'd160: toneR = `ha;     12'd161: toneR = `ha;
                12'd162: toneR = `ha;     12'd163: toneR = `ha;
                12'd164: toneR = `hg;     12'd165: toneR = `hg;
                12'd166: toneR = `hg;     12'd167: toneR = `hg;

                12'd168: toneR = `he;     12'd169: toneR = `he;
                12'd170: toneR = `he;     12'd171: toneR = `he;
                12'd172: toneR = `sil;    12'd173: toneR = `sil;
                12'd174: toneR = `sil;    12'd175: toneR = `sil;

                12'd176: toneR = `hd;     12'd177: toneR = `hd;
                12'd178: toneR = `hd;     12'd179: toneR = `hd;
                12'd180: toneR = `sil;    12'd181: toneR = `sil;
                12'd182: toneR = `sil;    12'd183: toneR = `sil;

                12'd184: toneR = `hd;     12'd185: toneR = `hd;
                12'd186: toneR = `hd;     12'd187: toneR = `hd;
                12'd188: toneR = `sil;    12'd189: toneR = `sil;
                12'd190: toneR = `sil;    12'd191: toneR = `sil;

                // ----Measure 4----
                12'd192: toneR = `hhc;    12'd193: toneR = `hhc;
                12'd194: toneR = `hhc;    12'd195: toneR = `hhc;
                12'd196: toneR = `ha;     12'd197: toneR = `ha;
                12'd198: toneR = `ha;     12'd199: toneR = `ha;

                12'd200: toneR = `hg;     12'd201: toneR = `hg;
                12'd202: toneR = `hg;     12'd203: toneR = `hg;
                12'd204: toneR = `he;     12'd205: toneR = `he;
                12'd206: toneR = `he;     12'd207: toneR = `he;

                12'd208: toneR = `hd;     12'd209: toneR = `hd;
                12'd210: toneR = `hd;     12'd211: toneR = `hd;
                12'd212: toneR = `sil;    12'd213: toneR = `sil;
                12'd214: toneR = `sil;    12'd215: toneR = `sil;

                12'd216: toneR = `hc;     12'd217: toneR = `hc;
                12'd218: toneR = `hc;     12'd219: toneR = `hc;
                12'd220: toneR = `sil;    12'd221: toneR = `sil;
                12'd222: toneR = `sil;    12'd223: toneR = `sil;

                12'd224: toneR = `hc;     12'd225: toneR = `hc;
                12'd226: toneR = `hc;     12'd227: toneR = `hc;
                12'd228: toneR = `hd;     12'd229: toneR = `hd;
                12'd230: toneR = `hd;     12'd231: toneR = `hd;

                12'd232: toneR = `sil;    12'd233: toneR = `sil;
                12'd234: toneR = `sil;    12'd235: toneR = `sil;
                12'd236: toneR = `hc;     12'd237: toneR = `hc;
                12'd238: toneR = `hc;     12'd239: toneR = `hc;

                12'd240: toneR = `sil;    12'd241: toneR = `sil;
                12'd242: toneR = `sil;    12'd243: toneR = `sil;
                12'd244: toneR = `sil;    12'd245: toneR = `sil;
                12'd246: toneR = `sil;    12'd247: toneR = `sil;

                12'd248: toneR = `sil;    12'd249: toneR = `sil;
                12'd250: toneR = `sil;    12'd251: toneR = `sil;
                12'd252: toneR = `sil;    12'd253: toneR = `sil;
                12'd254: toneR = `sil;    12'd255: toneR = `sil;
            default: toneR = `sil;
            endcase
        end
        else if(mode == 4'd5) begin
            case(ibeatNum)
                12'd0: toneR = `hd;      12'd1: toneR = `hd; // HG (half-beat)
                12'd2: toneR = `hd;      12'd3: toneR = `hd;
                12'd4: toneR = `he;      12'd5: toneR = `he;
                12'd6: toneR = `he;      12'd7: toneR = `he;
                12'd8: toneR = `sil;      12'd9: toneR = `sil; // HE (half-beat)
                12'd10: toneR = `sil;     12'd11: toneR = `sil;
                12'd12: toneR = `hd;     12'd13: toneR = `hd;
                12'd14: toneR = `hd;     12'd15: toneR = `hd; // (Short break for repetitive notes: high E)

                12'd16: toneR = `hc;     12'd17: toneR = `hc; // HE (one-beat)
                12'd18: toneR = `hc;     12'd19: toneR = `hc;
                12'd20: toneR = `sil;    12'd21: toneR = `sil;
                12'd22: toneR = `sil;    12'd23: toneR = `sil;
                12'd24: toneR = `hd;     12'd25: toneR = `hd;
                12'd26: toneR = `hd;     12'd27: toneR = `hd;
                12'd28: toneR = `hc;     12'd29: toneR = `hc;
                12'd30: toneR = `hc;     12'd31: toneR = `hc;

                12'd32: toneR = `a;     12'd33: toneR = `a; // HF (half-beat)
                12'd34: toneR = `a;     12'd35: toneR = `a;
                12'd36: toneR = `g;     12'd37: toneR = `g;
                12'd38: toneR = `g;     12'd39: toneR = `g;
                12'd40: toneR = `d;     12'd41: toneR = `d; // HD (half-beat)
                12'd42: toneR = `d;     12'd43: toneR = `d;
                12'd44: toneR = `sil;     12'd45: toneR = `sil;
                12'd46: toneR = `sil;     12'd47: toneR = `sil; // (Short break for repetitive notes: high D)

                12'd48: toneR = `e;     12'd49: toneR = `e; // HD (one-beat)
                12'd50: toneR = `e;     12'd51: toneR = `e;
                12'd52: toneR = `sil;     12'd53: toneR = `sil;
                12'd54: toneR = `sil;     12'd55: toneR = `sil;
                12'd56: toneR = `g;     12'd57: toneR = `g;
                12'd58: toneR = `g;     12'd59: toneR = `g;
                12'd60: toneR = `sil;     12'd61: toneR = `sil;
                12'd62: toneR = `sil;     12'd63: toneR = `sil;

                // --- Measure 2 ---
                12'd64: toneR = `e;     12'd65: toneR = `e; // HC (half-beat)
                12'd66: toneR = `e;     12'd67: toneR = `e;
                12'd68: toneR = `d;     12'd69: toneR = `d;
                12'd70: toneR = `d;     12'd71: toneR = `d;
                12'd72: toneR = `sil;     12'd73: toneR = `sil; // HD (half-beat)
                12'd74: toneR = `sil;     12'd75: toneR = `sil;
                12'd76: toneR = `c;     12'd77: toneR = `c;
                12'd78: toneR = `c;     12'd79: toneR = `c;

                12'd80: toneR = `c;     12'd81: toneR = `c; // HE (half-beat)
                12'd82: toneR = `c;     12'd83: toneR = `c;
                12'd84: toneR = `c;     12'd85: toneR = `c;
                12'd86: toneR = `c;     12'd87: toneR = `c;
                12'd88: toneR = `c;     12'd89: toneR = `c; // HF (half-beat)
                12'd90: toneR = `c;     12'd91: toneR = `c;
                12'd92: toneR = `sil;     12'd93: toneR = `sil;
                12'd94: toneR = `sil;     12'd95: toneR = `sil;

                12'd96: toneR = `sil;     12'd97: toneR = `sil; // HG (half-beat)
                12'd98: toneR = `sil;     12'd99: toneR = `sil;
                12'd100: toneR = `sil;    12'd101: toneR = `sil;
                12'd102: toneR = `sil;    12'd103: toneR = `sil; // (Short break for repetitive notes: high D)
                12'd104: toneR = `sil;    12'd105: toneR = `sil; // HG (half-beat)
                12'd106: toneR = `sil;    12'd107: toneR = `sil;
                12'd108: toneR = `sil;    12'd109: toneR = `sil;
                12'd110: toneR = `sil;    12'd111: toneR = `sil; // (Short break for repetitive notes: high D)

                12'd112: toneR = `sil;    12'd113: toneR = `sil; // HG (one-beat)
                12'd114: toneR = `sil;    12'd115: toneR = `sil;
                12'd116: toneR = `sil;    12'd117: toneR = `sil;
                12'd118: toneR = `sil;    12'd119: toneR = `sil;
                12'd120: toneR = `sil;    12'd121: toneR = `sil;
                12'd122: toneR = `sil;    12'd123: toneR = `sil;
                12'd124: toneR = `sil;    12'd125: toneR = `sil;
                12'd126: toneR = `sil;    12'd127: toneR = `sil;
            default: toneR = `sil;
            endcase
        end
        else begin
            case(ibeatNum)
                12'd0: toneR = `sil;     12'd1: toneR = `sil; // HG (half-beat)
                12'd2: toneR = `sil;     12'd3: toneR = `sil;
                12'd4: toneR = `ha;      12'd5: toneR = `ha;
                12'd6: toneR = `ha;      12'd7: toneR = `ha;
                12'd8: toneR = `sil;     12'd9: toneR = `sil; // HE (half-beat)
                12'd10: toneR = `sil;    12'd11: toneR = `sil;
                12'd12: toneR = `ha;     12'd13: toneR = `ha;
                12'd14: toneR = `ha;     12'd15: toneR = `ha; // (Short break for repetitive notes: high E)

                12'd16: toneR = `ha;     12'd17: toneR = `ha; // HE (one-beat)
                12'd18: toneR = `ha;     12'd19: toneR = `ha;
                12'd20: toneR = `sil;    12'd21: toneR = `sil;
                12'd22: toneR = `sil;    12'd23: toneR = `sil;
                12'd24: toneR = `sil;    12'd25: toneR = `sil;
                12'd26: toneR = `sil;    12'd27: toneR = `sil;
                12'd28: toneR = `ha;     12'd29: toneR = `ha;
                12'd30: toneR = `ha;     12'd31: toneR = `ha;

                12'd32: toneR = `sil;    12'd33: toneR = `sil; // HF (half-beat)
                12'd34: toneR = `sil;    12'd35: toneR = `sil;
                12'd36: toneR = `ha;     12'd37: toneR = `ha;
                12'd38: toneR = `ha;     12'd39: toneR = `ha;
                12'd40: toneR = `sil;    12'd41: toneR = `sil; // HD (half-beat)
                12'd42: toneR = `sil;    12'd43: toneR = `sil;
                12'd44: toneR = `ha;     12'd45: toneR = `ha;
                12'd46: toneR = `ha;     12'd47: toneR = `ha; // (Short break for repetitive notes: high D)

                12'd48: toneR = `ha;     12'd49: toneR = `ha; // HD (one-beat)
                12'd50: toneR = `ha;     12'd51: toneR = `ha;
                12'd52: toneR = `ha;     12'd53: toneR = `ha;
                12'd54: toneR = `ha;     12'd55: toneR = `ha;
                12'd56: toneR = `sil;    12'd57: toneR = `sil;
                12'd58: toneR = `sil;    12'd59: toneR = `sil;
                12'd60: toneR = `sil;    12'd61: toneR = `sil;
                12'd62: toneR = `sil;    12'd63: toneR = `sil;

                // --- Measure 2 ---
                12'd64: toneR = `hg;     12'd65: toneR = `hg; // HC (half-beat)
                12'd66: toneR = `hg;     12'd67: toneR = `hg;
                12'd68: toneR = `sil;    12'd69: toneR = `sil;
                12'd70: toneR = `sil;    12'd71: toneR = `sil;
                12'd72: toneR = `hg;     12'd73: toneR = `hg; // HD (half-beat)
                12'd74: toneR = `hg;     12'd75: toneR = `hg;
                12'd76: toneR = `hg;     12'd77: toneR = `hg;
                12'd78: toneR = `hg;     12'd79: toneR = `hg;

                12'd80: toneR = `sil;    12'd81: toneR = `sil; // HE (half-beat)
                12'd82: toneR = `sil;    12'd83: toneR = `sil;
                12'd84: toneR = `sil;    12'd85: toneR = `sil;
                12'd86: toneR = `sil;    12'd87: toneR = `sil;
                12'd88: toneR = `hg;     12'd89: toneR = `hg; // HF (half-beat)
                12'd90: toneR = `hg;     12'd91: toneR = `hg;
                12'd92: toneR = `sil;    12'd93: toneR = `sil;
                12'd94: toneR = `sil;    12'd95: toneR = `sil;

                12'd96: toneR = `hg;     12'd97: toneR = `hg; // HG (half-beat)
                12'd98: toneR = `hg;     12'd99: toneR = `hg;
                12'd100: toneR = `sil;   12'd101: toneR = `sil;
                12'd102: toneR = `sil;   12'd103: toneR = `sil; // (Short break for repetitive notes: high D)
                12'd104: toneR = `hg;    12'd105: toneR = `hg; // HG (half-beat)
                12'd106: toneR = `hg;    12'd107: toneR = `hg;
                12'd108: toneR = `hg;    12'd109: toneR = `hg;
                12'd110: toneR = `hg;    12'd111: toneR = `hg; // (Short break for repetitive notes: high D)

                12'd112: toneR = `hg;    12'd113: toneR = `hg; // HG (one-beat)
                12'd114: toneR = `hg;    12'd115: toneR = `hg;
                12'd116: toneR = `sil;   12'd117: toneR = `sil;
                12'd118: toneR = `sil;   12'd119: toneR = `sil;
                12'd120: toneR = `sil;   12'd121: toneR = `sil;
                12'd122: toneR = `sil;   12'd123: toneR = `sil;
                12'd124: toneR = `sil;   12'd125: toneR = `sil;
                12'd126: toneR = `sil;   12'd127: toneR = `sil;
                
                // ----Measure 3----
                12'd128: toneR = `hd;    12'd129: toneR = `hd;
                12'd130: toneR = `hd;    12'd131: toneR = `hd;
                12'd132: toneR = `sil;    12'd133: toneR = `sil;
                12'd134: toneR = `sil;    12'd135: toneR = `sil;

                12'd136: toneR = `hd;    12'd137: toneR = `hd;
                12'd138: toneR = `hd;    12'd139: toneR = `hd;
                12'd140: toneR = `hd;    12'd141: toneR = `hd;
                12'd142: toneR = `hd;    12'd143: toneR = `hd;

                12'd144: toneR = `hd;    12'd145: toneR = `hd;
                12'd146: toneR = `hd;    12'd147: toneR = `hd;
                12'd148: toneR = `sil;    12'd149: toneR = `sil;
                12'd150: toneR = `sil;    12'd151: toneR = `sil;

                12'd152: toneR = `hd;    12'd153: toneR = `hd;
                12'd154: toneR = `hd;    12'd155: toneR = `hd;
                12'd156: toneR = `sil;    12'd157: toneR = `sil;
                12'd158: toneR = `sil;    12'd159: toneR = `sil;

                12'd160: toneR = `hd;    12'd161: toneR = `hd;
                12'd162: toneR = `hd;    12'd163: toneR = `hd;
                12'd164: toneR = `sil;    12'd165: toneR = `sil;
                12'd166: toneR = `sil;    12'd167: toneR = `sil;

                12'd168: toneR = `hd;    12'd169: toneR = `hd;
                12'd170: toneR = `hd;    12'd171: toneR = `hd;
                12'd172: toneR = `sil;    12'd173: toneR = `sil;
                12'd174: toneR = `sil;    12'd175: toneR = `sil;

                12'd176: toneR = `hd;    12'd177: toneR = `hd;
                12'd178: toneR = `hd;    12'd179: toneR = `hd;
                12'd180: toneR = `sil;    12'd181: toneR = `sil;
                12'd182: toneR = `sil;    12'd183: toneR = `sil;

                12'd184: toneR = `hd;    12'd185: toneR = `hd;
                12'd186: toneR = `hd;    12'd187: toneR = `hd;
                12'd188: toneR = `he;    12'd189: toneR = `he;
                12'd190: toneR = `he;    12'd191: toneR = `he;

                // ----Measure 4----
                12'd192: toneR = `hg;    12'd193: toneR = `hg;
                12'd194: toneR = `hg;    12'd195: toneR = `hg;
                12'd196: toneR = `he;    12'd197: toneR = `he;
                12'd198: toneR = `he;    12'd199: toneR = `he;

                12'd200: toneR = `hd;    12'd201: toneR = `hd;
                12'd202: toneR = `hd;    12'd203: toneR = `hd;
                12'd204: toneR = `hc;    12'd205: toneR = `hc;
                12'd206: toneR = `hc;    12'd207: toneR = `hc;

                12'd208: toneR = `hd;    12'd209: toneR = `hd;
                12'd210: toneR = `hd;    12'd211: toneR = `hd;
                12'd212: toneR = `he;    12'd213: toneR = `he;
                12'd214: toneR = `he;    12'd215: toneR = `he;

                12'd216: toneR = `hg;    12'd217: toneR = `hg;
                12'd218: toneR = `hg;    12'd219: toneR = `hg;
                12'd220: toneR = `he;    12'd221: toneR = `he;
                12'd222: toneR = `he;    12'd223: toneR = `he;

                12'd224: toneR = `hd;    12'd225: toneR = `hd;
                12'd226: toneR = `hd;    12'd227: toneR = `hd;
                12'd228: toneR = `hc;    12'd229: toneR = `hc;
                12'd230: toneR = `hc;    12'd231: toneR = `hc;

                12'd232: toneR = `sil;    12'd233: toneR = `sil;
                12'd234: toneR = `sil;    12'd235: toneR = `sil;
                12'd236: toneR = `hd;    12'd237: toneR = `hd;
                12'd238: toneR = `hd;    12'd239: toneR = `hd;

                12'd240: toneR = `sil;    12'd241: toneR = `sil;
                12'd242: toneR = `sil;    12'd243: toneR = `sil;
                12'd244: toneR = `he;    12'd245: toneR = `he;
                12'd246: toneR = `he;    12'd247: toneR = `he;

                12'd248: toneR = `he;    12'd249: toneR = `he;
                12'd250: toneR = `he;    12'd251: toneR = `he;
                12'd252: toneR = `he;    12'd253: toneR = `he;
                12'd254: toneR = `he;    12'd255: toneR = `he;

                // ----Measure 5----
                12'd256: toneR = `sil;    12'd257: toneR = `sil;
                12'd258: toneR = `sil;    12'd259: toneR = `sil;
                12'd260: toneR = `ha;     12'd261: toneR = `ha; 
                12'd262: toneR = `ha;     12'd263: toneR = `ha; 
                12'd264: toneR = `sil;    12'd265: toneR = `sil;
                12'd266: toneR = `sil;   12'd267: toneR = `sil;  
                12'd268: toneR = `ha;    12'd269: toneR = `ha;   
                12'd270: toneR = `ha;    12'd271: toneR = `ha; 

                12'd272: toneR = `ha;    12'd273: toneR = `ha; 
                12'd274: toneR = `ha;    12'd275: toneR = `ha;   
                12'd276: toneR = `sil;   12'd277: toneR = `sil;  
                12'd278: toneR = `sil;   12'd279: toneR = `sil;  
                12'd280: toneR = `sil;   12'd281: toneR = `sil;  
                12'd282: toneR = `sil;   12'd283: toneR = `sil;  
                12'd284: toneR = `ha;    12'd285: toneR = `ha;   
                12'd286: toneR = `ha;    12'd287: toneR = `ha;   

                12'd288: toneR = `sil;   12'd289: toneR = `sil; 
                12'd290: toneR = `sil;   12'd291: toneR = `sil;  
                12'd292: toneR = `ha;    12'd293: toneR = `ha;   
                12'd294: toneR = `ha;    12'd295: toneR = `ha;   
                12'd296: toneR = `sil;   12'd297: toneR = `sil; 
                12'd298: toneR = `sil;   12'd299: toneR = `sil;  
                12'd300: toneR = `ha;    12'd301: toneR = `ha;   
                12'd302: toneR = `ha;    12'd303: toneR = `ha; 

                12'd304: toneR = `ha;    12'd305: toneR = `ha; 
                12'd306: toneR = `ha;    12'd307: toneR = `ha;   
                12'd308: toneR = `ha;    12'd309: toneR = `ha;   
                12'd310: toneR = `ha;    12'd311: toneR = `ha;   
                12'd312: toneR = `sil;   12'd313: toneR = `sil;  
                12'd314: toneR = `sil;   12'd315: toneR = `sil;  
                12'd316: toneR = `sil;   12'd317: toneR = `sil;  
                12'd318: toneR = `sil;   12'd319: toneR = `sil;  

                // ----Measure 6- ---  
                12'd320: toneR = `hg;    12'd321: toneR = `hg; 
                12'd322: toneR = `hg;    12'd323: toneR = `hg;   
                12'd324: toneR = `sil;   12'd325: toneR = `sil;  
                12'd326: toneR = `sil;   12'd327: toneR = `sil;  
                12'd328: toneR = `hg;    12'd329: toneR = `hg; 
                12'd330: toneR = `hg;    12'd331: toneR = `hg;   
                12'd332: toneR = `hg;    12'd333: toneR = `hg;   
                12'd334: toneR = `hg;    12'd335: toneR = `hg;   

                12'd336: toneR = `sil;   12'd337: toneR = `sil; 
                12'd338: toneR = `sil;   12'd339: toneR = `sil;  
                12'd340: toneR = `sil;   12'd341: toneR = `sil;  
                12'd342: toneR = `sil;   12'd343: toneR = `sil;  
                12'd344: toneR = `hg;    12'd345: toneR = `hg; 
                12'd346: toneR = `hg;    12'd347: toneR = `hg;   
                12'd348: toneR = `sil;   12'd349: toneR = `sil;  
                12'd350: toneR = `sil;   12'd351: toneR = `sil;  

                12'd352: toneR = `hg;    12'd353: toneR = `hg; 
                12'd354: toneR = `hg;    12'd355: toneR = `hg;   
                12'd356: toneR =  `sil;  12'd357: toneR =  `sil; 
                12'd358: toneR =  `sil;  12'd359: toneR =  `sil; 
                12'd360: toneR =  `hg;   12'd361: toneR =  `hg; 
                12'd362: toneR =  `hg;   12'd363: toneR =  `hg;  
                12'd364: toneR =  `hg;   12'd365: toneR =  `hg;  
                12'd366: toneR =  `hg;   12'd367: toneR =  `hg; 

                12'd368: toneR =  `hg;   12'd369: toneR =  `hg; 
                12'd370: toneR =  `hg;   12'd371: toneR =  `hg;  
                12'd372: toneR =  `sil;  12'd373: toneR =  `sil; 
                12'd374: toneR =  `sil;  12'd375: toneR =  `sil; 
                12'd376: toneR =  `sil;  12'd377: toneR =  `sil; 
                12'd378: toneR =  `sil;  12'd379: toneR =  `sil; 
                12'd380: toneR =  `sil;  12'd381: toneR =  `sil; 
                12'd382: toneR =  `sil;  12'd383: toneR =  `sil; 

                // ----Measure 7----
                12'd384: toneR = `hd;    12'd385: toneR = `hd;
                12'd386: toneR = `hd;    12'd387: toneR = `hd;
                12'd388: toneR = `sil;    12'd389: toneR = `sil;
                12'd390: toneR = `sil;    12'd391: toneR = `sil;

                12'd392: toneR = `hd;    12'd393: toneR = `hd;
                12'd394: toneR = `hd;    12'd395: toneR = `hd;
                12'd396: toneR = `hd;    12'd397: toneR = `hd;
                12'd398: toneR = `hd;    12'd399: toneR = `hd;

                12'd400: toneR = `hd;    12'd401: toneR = `hd;
                12'd402: toneR = `hd;    12'd403: toneR = `hd;
                12'd404: toneR = `sil;    12'd405: toneR = `sil;
                12'd406: toneR = `sil;    12'd407: toneR = `sil;

                12'd408: toneR = `hd;    12'd409: toneR = `hd;
                12'd410: toneR = `hd;    12'd411: toneR = `hd;
                12'd412: toneR = `sil;    12'd413: toneR = `sil;
                12'd414: toneR = `sil;    12'd415: toneR = `sil;

                12'd416: toneR = `hd;    12'd417: toneR = `hd;
                12'd418: toneR = `hd;    12'd419: toneR = `hd;
                12'd420: toneR = `sil;    12'd421: toneR = `sil;
                12'd422: toneR = `sil;    12'd423: toneR = `sil;

                12'd424: toneR = `hd;    12'd425: toneR = `hd;
                12'd426: toneR = `hd;    12'd427: toneR = `hd;
                12'd428: toneR = `sil;    12'd429: toneR = `sil;
                12'd430: toneR = `sil;    12'd431: toneR = `sil;

                12'd432: toneR = `hd;    12'd433: toneR = `hd;
                12'd434: toneR = `hd;    12'd435: toneR = `hd;
                12'd436: toneR = `sil;    12'd437: toneR = `sil;
                12'd438: toneR = `sil;    12'd439: toneR = `sil;

                12'd440: toneR = `he;    12'd441: toneR = `he;
                12'd442: toneR = `he;    12'd443: toneR = `he;
                12'd444: toneR = `hg;    12'd445: toneR = `hg;
                12'd446: toneR = `hg;    12'd447: toneR = `hg;

                // ----Measure 8----
                12'd448: toneR = `ha;    12'd449: toneR = `ha;
                12'd450: toneR = `ha;    12'd451: toneR = `ha;
                12'd452: toneR = `hg;    12'd453: toneR = `hg;
                12'd454: toneR = `hg;    12'd455: toneR = `hg;

                12'd456: toneR = `he;    12'd457: toneR = `he;
                12'd458: toneR = `he;    12'd459: toneR = `he;
                12'd460: toneR = `hd;    12'd461: toneR = `hd;
                12'd462: toneR = `hd;    12'd463: toneR = `hd;

                12'd464: toneR = `hc;    12'd465: toneR = `hc;
                12'd466: toneR = `hc;    12'd467: toneR = `hc;
                12'd468: toneR = `hd;    12'd469: toneR = `hd;
                12'd470: toneR = `hd;    12'd471: toneR = `hd;

                12'd472: toneR = `ha;    12'd473: toneR = `ha;
                12'd474: toneR = `ha;    12'd475: toneR = `ha;
                12'd476: toneR = `he;    12'd477: toneR = `he;
                12'd478: toneR = `he;    12'd479: toneR = `he;

                12'd480: toneR = `hd;    12'd481: toneR = `hd;
                12'd482: toneR = `hd;    12'd483: toneR = `hd;
                12'd484: toneR = `hc;    12'd485: toneR = `hc;
                12'd486: toneR = `hc;    12'd487: toneR = `hc;

                12'd488: toneR = `sil;    12'd489: toneR = `sil;
                12'd490: toneR = `sil;    12'd491: toneR = `sil;
                12'd492: toneR = `hd;    12'd493: toneR = `hd;
                12'd494: toneR = `hd;    12'd495: toneR = `hd;

                12'd496: toneR = `sil;    12'd497: toneR = `sil;
                12'd498: toneR = `sil;    12'd499: toneR = `sil;
                12'd500: toneR = `hc;    12'd501: toneR = `hc;
                12'd502: toneR = `hc;    12'd503: toneR = `hc;

                12'd504: toneR = `hc;    12'd505: toneR = `hc;
                12'd506: toneR = `hc;    12'd507: toneR = `hc;
                12'd508: toneR = `hc;    12'd509: toneR = `hc;
                12'd510: toneR = `hc;    12'd511: toneR = `hc;
                
            default: toneR = `sil;
            endcase
        end
    end
   
    always@(*)begin
        toneL = toneR;
//        if(mode == 4'd0) begin
//            case(ibeatNum)
//                12'd0: toneL = `he;      12'd1: toneL = `he; // HG (half-beat)
//                12'd2: toneL = `he;      12'd3: toneL = `he;
//                12'd4: toneL = `he;      12'd5: toneL = `he;
//                12'd6: toneL = `he;      12'd7: toneL = `he;
//                12'd8: toneL = `hg;      12'd9: toneL = `hg; // HE (half-beat)
//                12'd10: toneL = `hg;     12'd11: toneL = `hg;
//                12'd12: toneL = `ha;     12'd13: toneL = `ha;
//                12'd14: toneL = `ha;     12'd15: toneL = `ha; // (Short break for repetitive notes: high E)

//                12'd16: toneL = `sil;    12'd17: toneL = `sil; // HE (one-beat)
//                12'd18: toneL = `sil;    12'd19: toneL = `sil;
//                12'd20: toneL = `hg;     12'd21: toneL = `hg;
//                12'd22: toneL = `hg;     12'd23: toneL = `hg;
//                12'd24: toneL = `sil;    12'd25: toneL = `sil;
//                12'd26: toneL = `sil;    12'd27: toneL = `sil;
//                12'd28: toneL = `he;     12'd29: toneL = `he;
//                12'd30: toneL = `he;     12'd31: toneL = `he;

//                12'd32: toneL = `hg;     12'd33: toneL = `hg; // HF (half-beat)
//                12'd34: toneL = `hg;     12'd35: toneL = `hg;
//                12'd36: toneL = `sil;    12'd37: toneL = `sil;
//                12'd38: toneL = `sil;    12'd39: toneL = `sil;
//                12'd40: toneL = `hg;     12'd41: toneL = `hg; // HD (half-beat)
//                12'd42: toneL = `hg;     12'd43: toneL = `hg;
//                12'd44: toneL = `sil;    12'd45: toneL = `sil;
//                12'd46: toneL = `sil;    12'd47: toneL = `sil; // (Short break for repetitive notes: high D)

//                12'd48: toneL = `sil;    12'd49: toneL = `sil; // HD (one-beat)
//                12'd50: toneL = `sil;    12'd51: toneL = `sil;
//                12'd52: toneL = `sil;    12'd53: toneL = `sil;
//                12'd54: toneL = `sil;    12'd55: toneL = `sil;
//                12'd56: toneL = `sil;    12'd57: toneL = `sil;
//                12'd58: toneL = `sil;    12'd59: toneL = `sil;
//                12'd60: toneL = `sil;    12'd61: toneL = `sil;
//                12'd62: toneL = `sil;    12'd63: toneL = `sil;

//                // --- Measure 2 ---
//                12'd64: toneL = `ha;     12'd65: toneL = `ha; // HC (half-beat)
//                12'd66: toneL = `ha;     12'd67: toneL = `ha;
//                12'd68: toneL = `hg;     12'd69: toneL = `hg;
//                12'd70: toneL = `hg;     12'd71: toneL = `hg;
//                12'd72: toneL = `he;     12'd73: toneL = `he; // HD (half-beat)
//                12'd74: toneL = `he;     12'd75: toneL = `he;
//                12'd76: toneL = `sil;    12'd77: toneL = `sil;
//                12'd78: toneL = `sil;    12'd79: toneL = `sil;

//                12'd80: toneL = `he;     12'd81: toneL = `he; // HE (half-beat)
//                12'd82: toneL = `he;     12'd83: toneL = `he;
//                12'd84: toneL = `sil;    12'd85: toneL = `sil;
//                12'd86: toneL = `sil;    12'd87: toneL = `sil;
//                12'd88: toneL = `he;     12'd89: toneL = `he; // HF (half-beat)
//                12'd90: toneL = `he;     12'd91: toneL = `he;
//                12'd92: toneL = `sil;    12'd93: toneL = `sil;
//                12'd94: toneL = `sil;    12'd95: toneL = `sil;

//                12'd96: toneL = `he;     12'd97: toneL = `he; // HG (half-beat)
//                12'd98: toneL = `he;     12'd99: toneL = `he;
//                12'd100: toneL = `hg;    12'd101: toneL = `hg;
//                12'd102: toneL = `hg;    12'd103: toneL = `sil; // (Short break for repetitive notes: high D)
//                12'd104: toneL = `sil;   12'd105: toneL = `sil; // HG (half-beat)
//                12'd106: toneL = `sil;   12'd107: toneL = `sil;
//                12'd108: toneL = `ha;    12'd109: toneL = `ha;
//                12'd110: toneL = `ha;    12'd111: toneL = `ha; // (Short break for repetitive notes: high D)

//                12'd112: toneL = `sil;    12'd113: toneL = `sil; // HG (one-beat)
//                12'd114: toneL = `sil;    12'd115: toneL = `sil;
//                12'd116: toneL = `sil;    12'd117: toneL = `sil;
//                12'd118: toneL = `sil;    12'd119: toneL = `sil;
//                12'd120: toneL = `sil;    12'd121: toneL = `sil;
//                12'd122: toneL = `sil;    12'd123: toneL = `sil;
//                12'd124: toneL = `sil;    12'd125: toneL = `sil;
//                12'd126: toneL = `sil;    12'd127: toneL = `sil;
                
//                // ----Measure 3----
//                12'd128: toneL = `hhc;    12'd129: toneL = `hhc;
//                12'd130: toneL = `hhc;    12'd131: toneL = `hhc;
//                12'd132: toneL = `hc;     12'd133: toneL = `hc;
//                12'd134: toneL = `hc;     12'd135: toneL = `hc;

//                12'd136: toneL = `hg;     12'd137: toneL = `hg;
//                12'd138: toneL = `hg;     12'd139: toneL = `hg;
//                12'd140: toneL = `sil;    12'd141: toneL = `sil;
//                12'd142: toneL = `sil;    12'd143: toneL = `sil;

//                12'd144: toneL = `he;     12'd145: toneL = `he;
//                12'd146: toneL = `he;     12'd147: toneL = `he;
//                12'd148: toneL = `sil;    12'd149: toneL = `sil;
//                12'd150: toneL = `sil;    12'd151: toneL = `sil;

//                12'd152: toneL = `he;     12'd153: toneL = `he;
//                12'd154: toneL = `he;     12'd155: toneL = `he;
//                12'd156: toneL = `sil;    12'd157: toneL = `sil;
//                12'd158: toneL = `sil;    12'd159: toneL = `sil;

//                12'd160: toneL = `ha;     12'd161: toneL = `ha;
//                12'd162: toneL = `ha;     12'd163: toneL = `ha;
//                12'd164: toneL = `hg;     12'd165: toneL = `hg;
//                12'd166: toneL = `hg;     12'd167: toneL = `hg;

//                12'd168: toneL = `he;     12'd169: toneL = `he;
//                12'd170: toneL = `he;     12'd171: toneL = `he;
//                12'd172: toneL = `sil;    12'd173: toneL = `sil;
//                12'd174: toneL = `sil;    12'd175: toneL = `sil;

//                12'd176: toneL = `hd;     12'd177: toneL = `hd;
//                12'd178: toneL = `hd;     12'd179: toneL = `hd;
//                12'd180: toneL = `sil;    12'd181: toneL = `sil;
//                12'd182: toneL = `sil;    12'd183: toneL = `sil;

//                12'd184: toneL = `hd;     12'd185: toneL = `hd;
//                12'd186: toneL = `hd;     12'd187: toneL = `hd;
//                12'd188: toneL = `sil;    12'd189: toneL = `sil;
//                12'd190: toneL = `sil;    12'd191: toneL = `sil;

//                // ----Measure 4----
//                12'd192: toneL = `hhc;    12'd193: toneL = `hhc;
//                12'd194: toneL = `hhc;    12'd195: toneL = `hhc;
//                12'd196: toneL = `ha;     12'd197: toneL = `ha;
//                12'd198: toneL = `ha;     12'd199: toneL = `ha;

//                12'd200: toneL = `hg;     12'd201: toneL = `hg;
//                12'd202: toneL = `hg;     12'd203: toneL = `hg;
//                12'd204: toneL = `he;     12'd205: toneL = `he;
//                12'd206: toneL = `he;     12'd207: toneL = `he;

//                12'd208: toneL = `hd;     12'd209: toneL = `hd;
//                12'd210: toneL = `hd;     12'd211: toneL = `hd;
//                12'd212: toneL = `sil;    12'd213: toneL = `sil;
//                12'd214: toneL = `sil;    12'd215: toneL = `sil;

//                12'd216: toneL = `hc;     12'd217: toneL = `hc;
//                12'd218: toneL = `hc;     12'd219: toneL = `hc;
//                12'd220: toneL = `sil;    12'd221: toneL = `sil;
//                12'd222: toneL = `sil;    12'd223: toneL = `sil;

//                12'd224: toneL = `hc;     12'd225: toneL = `hc;
//                12'd226: toneL = `hc;     12'd227: toneL = `hc;
//                12'd228: toneL = `hd;     12'd229: toneL = `hd;
//                12'd230: toneL = `hd;     12'd231: toneL = `hd;

//                12'd232: toneL = `sil;    12'd233: toneL = `sil;
//                12'd234: toneL = `sil;    12'd235: toneL = `sil;
//                12'd236: toneL = `hc;     12'd237: toneL = `hc;
//                12'd238: toneL = `hc;     12'd239: toneL = `hc;

//                12'd240: toneL = `sil;    12'd241: toneL = `sil;
//                12'd242: toneL = `sil;    12'd243: toneL = `sil;
//                12'd244: toneL = `sil;    12'd245: toneL = `sil;
//                12'd246: toneL = `sil;    12'd247: toneL = `sil;

//                12'd248: toneL = `sil;    12'd249: toneL = `sil;
//                12'd250: toneL = `sil;    12'd251: toneL = `sil;
//                12'd252: toneL = `sil;    12'd253: toneL = `sil;
//                12'd254: toneL = `sil;    12'd255: toneL = `sil;
//            default: toneL = `sil;
//            endcase
//        end
//        else if(mode == 4'd5) begin
//            case(ibeatNum)
//                12'd0: toneL = `hd;      12'd1: toneL = `hd; // HG (half-beat)
//                12'd2: toneL = `hd;      12'd3: toneL = `hd;
//                12'd4: toneL = `he;      12'd5: toneL = `he;
//                12'd6: toneL = `he;      12'd7: toneL = `he;
//                12'd8: toneL = `sil;     12'd9: toneL = `sil; // HE (half-beat)
//                12'd10: toneL = `sil;    12'd11: toneL = `sil;
//                12'd12: toneL = `hd;     12'd13: toneL = `hd;
//                12'd14: toneL = `hd;     12'd15: toneL = `hd; // (Short break for repetitive notes: high E)

//                12'd16: toneL = `hc;     12'd17: toneL = `hc; // HE (one-beat)
//                12'd18: toneL = `hc;     12'd19: toneL = `hc;
//                12'd20: toneL = `sil;    12'd21: toneL = `sil;
//                12'd22: toneL = `sil;    12'd23: toneL = `sil;
//                12'd24: toneL = `hd;     12'd25: toneL = `hd;
//                12'd26: toneL = `hd;     12'd27: toneL = `hd;
//                12'd28: toneL = `hc;     12'd29: toneL = `hc;
//                12'd30: toneL = `hc;     12'd31: toneL = `hc;

//                12'd32: toneL = `a;     12'd33: toneR = `a; // HF (half-beat)
//                12'd34: toneL = `a;     12'd35: toneR = `a;
//                12'd36: toneL = `g;     12'd37: toneR = `g;
//                12'd38: toneL = `g;     12'd39: toneR = `g;
//                12'd40: toneL = `d;     12'd41: toneR = `d; // HD (half-beat)
//                12'd42: toneL = `d;     12'd43: toneR = `d;
//                12'd44: toneL = `sil;   12'd45: toneR = `sil;
//                12'd46: toneL = `sil;   12'd47: toneR = `sil; // (Short break for repetitive notes: high D)

//                12'd48: toneR = `e;     12'd49: toneR = `e; // HD (one-beat)
//                12'd50: toneR = `e;     12'd51: toneR = `e;
//                12'd52: toneR = `sil;     12'd53: toneR = `sil;
//                12'd54: toneR = `sil;     12'd55: toneR = `sil;
//                12'd56: toneR = `g;     12'd57: toneR = `g;
//                12'd58: toneR = `g;     12'd59: toneR = `g;
//                12'd60: toneR = `sil;     12'd61: toneR = `sil;
//                12'd62: toneR = `sil;     12'd63: toneR = `sil;

//                // --- Measure 2 ---
//                12'd64: toneR = `e;     12'd65: toneR = `e; // HC (half-beat)
//                12'd66: toneR = `e;     12'd67: toneR = `e;
//                12'd68: toneR = `d;     12'd69: toneR = `d;
//                12'd70: toneR = `d;     12'd71: toneR = `d;
//                12'd72: toneR = `sil;     12'd73: toneR = `sil; // HD (half-beat)
//                12'd74: toneR = `sil;     12'd75: toneR = `sil;
//                12'd76: toneR = `c;     12'd77: toneR = `c;
//                12'd78: toneR = `c;     12'd79: toneR = `c;

//                12'd80: toneR = `c;     12'd81: toneR = `c; // HE (half-beat)
//                12'd82: toneR = `c;     12'd83: toneR = `c;
//                12'd84: toneR = `c;     12'd85: toneR = `c;
//                12'd86: toneR = `c;     12'd87: toneR = `c;
//                12'd88: toneR = `c;     12'd89: toneR = `c; // HF (half-beat)
//                12'd90: toneR = `c;     12'd91: toneR = `c;
//                12'd92: toneR = `sil;     12'd93: toneR = `sil;
//                12'd94: toneR = `sil;     12'd95: toneR = `sil;

//                12'd96: toneR = `sil;     12'd97: toneR = `sil; // HG (half-beat)
//                12'd98: toneR = `sil;     12'd99: toneR = `sil;
//                12'd100: toneR = `sil;    12'd101: toneR = `sil;
//                12'd102: toneR = `sil;    12'd103: toneR = `sil; // (Short break for repetitive notes: high D)
//                12'd104: toneR = `sil;    12'd105: toneR = `sil; // HG (half-beat)
//                12'd106: toneR = `sil;    12'd107: toneR = `sil;
//                12'd108: toneR = `sil;    12'd109: toneR = `sil;
//                12'd110: toneR = `sil;    12'd111: toneR = `sil; // (Short break for repetitive notes: high D)

//                12'd112: toneR = `sil;    12'd113: toneR = `sil; // HG (one-beat)
//                12'd114: toneR = `sil;    12'd115: toneR = `sil;
//                12'd116: toneR = `sil;    12'd117: toneR = `sil;
//                12'd118: toneR = `sil;    12'd119: toneR = `sil;
//                12'd120: toneR = `sil;    12'd121: toneR = `sil;
//                12'd122: toneR = `sil;    12'd123: toneR = `sil;
//                12'd124: toneR = `sil;    12'd125: toneR = `sil;
//                12'd126: toneR = `sil;    12'd127: toneR = `sil;
            
//            default: toneL = `sil;
//            endcase
//        end
//        else begin
//            case(ibeatNum)
//            12'd0: toneL = `hc;  	12'd1: toneL = `hc; // HC (two-beat)
//                12'd2: toneL = `hc;  	12'd3: toneL = `hc;
//                12'd4: toneL = `hc;	    12'd5: toneL = `hc;
//                12'd6: toneL = `hc;  	12'd7: toneL = `hc;
//                12'd8: toneL = `hc;	    12'd9: toneL = `hc;
//                12'd10: toneL = `hc;	12'd11: toneL = `hc;
//                12'd12: toneL = `hc;	12'd13: toneL = `hc;
//                12'd14: toneL = `hc;	12'd15: toneL = `hc;

//                12'd16: toneL = `hc;	12'd17: toneL = `hc;
//                12'd18: toneL = `hc;	12'd19: toneL = `hc;
//                12'd20: toneL = `hc;	12'd21: toneL = `hc;
//                12'd22: toneL = `hc;	12'd23: toneL = `hc;
//                12'd24: toneL = `hc;	12'd25: toneL = `hc;
//                12'd26: toneL = `hc;	12'd27: toneL = `hc;
//                12'd28: toneL = `hc;	12'd29: toneL = `hc;
//                12'd30: toneL = `hc;	12'd31: toneL = `hc;

//                12'd32: toneL = `g;	    12'd33: toneL = `g; // G (one-beat)
//                12'd34: toneL = `g;	    12'd35: toneL = `g;
//                12'd36: toneL = `g;	    12'd37: toneL = `g;
//                12'd38: toneL = `g;	    12'd39: toneL = `g;
//                12'd40: toneL = `g;	    12'd41: toneL = `g;
//                12'd42: toneL = `g;	    12'd43: toneL = `g;
//                12'd44: toneL = `g;	    12'd45: toneL = `g;
//                12'd46: toneL = `g;	    12'd47: toneL = `g;

//                12'd48: toneL = `b;	    12'd49: toneL = `b; // B (one-beat)
//                12'd50: toneL = `b;	    12'd51: toneL = `b;
//                12'd52: toneL = `b;	    12'd53: toneL = `b;
//                12'd54: toneL = `b;	    12'd55: toneL = `b;
//                12'd56: toneL = `b;	    12'd57: toneL = `b;
//                12'd58: toneL = `b;	    12'd59: toneL = `b;
//                12'd60: toneL = `b;	    12'd61: toneL = `b;
//                12'd62: toneL = `b;	    12'd63: toneL = `b;

//                12'd64: toneL = `hc;	12'd65: toneL = `hc; // HC (two-beat)
//                12'd66: toneL = `hc;    12'd67: toneL = `hc;
//                12'd68: toneL = `hc;	12'd69: toneL = `hc;
//                12'd70: toneL = `hc;	12'd71: toneL = `hc;
//                12'd72: toneL = `hc;	12'd73: toneL = `hc;
//                12'd74: toneL = `hc;	12'd75: toneL = `hc;
//                12'd76: toneL = `hc;	12'd77: toneL = `hc;
//                12'd78: toneL = `hc;	12'd79: toneL = `hc;

//                12'd80: toneL = `hc;	12'd81: toneL = `hc;
//                12'd82: toneL = `hc;    12'd83: toneL = `hc;
//                12'd84: toneL = `hc;    12'd85: toneL = `hc;
//                12'd86: toneL = `hc;    12'd87: toneL = `hc;
//                12'd88: toneL = `hc;    12'd89: toneL = `hc;
//                12'd90: toneL = `hc;    12'd91: toneL = `hc;
//                12'd92: toneL = `hc;    12'd93: toneL = `hc;
//                12'd94: toneL = `hc;    12'd95: toneL = `hc;

//                12'd96: toneL = `g;	    12'd97: toneL = `g; // G (one-beat)
//                12'd98: toneL = `g; 	    12'd99: toneL = `g;
//                12'd100: toneL = `g;    	12'd101: toneL = `g;
//                12'd102: toneL = `g;    	12'd103: toneL = `g;
//                12'd104: toneL = `g;	    12'd105: toneL = `g;
//                12'd106: toneL = `g;	    12'd107: toneL = `g;
//                12'd108: toneL = `g;	    12'd109: toneL = `g;
//                12'd110: toneL = `g;	    12'd111: toneL = `g;

//                12'd112: toneL = `b;	12'd113: toneL = `b; // B (one-beat)
//                12'd114: toneL = `b;	12'd115: toneL = `b;
//                12'd116: toneL = `b;	12'd117: toneL = `b;
//                12'd118: toneL = `b;	12'd119: toneL = `b;
//                12'd120: toneL = `b;	12'd121: toneL = `b;
//                12'd122: toneL = `b;	12'd123: toneL = `b;
//                12'd124: toneL = `b;	12'd125: toneL = `b;
//                12'd126: toneL = `b;	12'd127: toneL = `b;
//            default: toneL = `sil;
//            endcase
//        end
    end
   
endmodule
