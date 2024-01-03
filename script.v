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

reg [9:0] counter = 0;

always @(posedge clk or posedge rst) begin
    if(rst) counter <= 0;
    else begin
        if(counter < 840) counter <= counter + 1;
        else counter <= 0;
    end
end

always @(*) begin
        case(counter)
            12'd0: pos_0 = pos_Q;   12'd1: pos_0 = pos_Q;
            12'd2: pos_0 = pos_Q;   12'd3: pos_0 = pos_Q;
            12'd4: pos_0 = pos_Q;   12'd5: pos_0 = pos_Q;
            12'd6: pos_0 = pos_Q;   12'd7: pos_0 = pos_Q;
            12'd8: pos_0 = pos_Q;   12'd9: pos_0 = pos_Q;
            12'd10: pos_0 = pos_Q;  12'd11: pos_0 = pos_Q;
            12'd12: pos_0 = pos_Q;  12'd13: pos_0 = pos_Q;
            12'd14: pos_0 = pos_Q;  12'd15: pos_0 = pos_Q;
            12'd16: pos_0 = pos_Q;  12'd17: pos_0 = pos_Q;
            12'd18: pos_0 = pos_Q;  12'd19: pos_0 = pos_Q;
            12'd20: pos_0 = none;   12'd21: pos_0 = none;
            12'd22: pos_0 = none;   12'd23: pos_0 = none;
            12'd24: pos_0 = none;   12'd25: pos_0 = none;
            12'd26: pos_0 = none;   12'd27: pos_0 = none;
            12'd28: pos_0 = pos_W;  12'd29: pos_0 = pos_W;
            12'd30: pos_0 = pos_W;  12'd31: pos_0 = pos_W;
            12'd32: pos_0 = pos_W;  12'd33: pos_0 = pos_W;
            12'd34: pos_0 = pos_W;  12'd35: pos_0 = pos_W;
            12'd36: pos_0 = pos_W;  12'd37: pos_0 = pos_W;
            12'd38: pos_0 = pos_W;  12'd39: pos_0 = pos_W;
            12'd40: pos_0 = pos_W;  12'd41: pos_0 = pos_W;
            12'd42: pos_0 = pos_W;  12'd43: pos_0 = pos_W;
            12'd44: pos_0 = pos_W;  12'd45: pos_0 = pos_W;
            12'd46: pos_0 = pos_W;  12'd47: pos_0 = pos_W;
            12'd48: pos_0 = none;   12'd49: pos_0 = none;
            12'd50: pos_0 = none;   12'd51: pos_0 = none;
            12'd52: pos_0 = none;   12'd53: pos_0 = none;
            12'd54: pos_0 = none;   12'd55: pos_0 = none;
            12'd56: pos_0 = pos_E;  12'd57: pos_0 = pos_E;
            12'd58: pos_0 = pos_E;  12'd59: pos_0 = pos_E;
            12'd60: pos_0 = pos_E;  12'd61: pos_0 = pos_E;
            12'd62: pos_0 = pos_E;  12'd63: pos_0 = pos_E;
            12'd64: pos_0 = pos_E;  12'd65: pos_0 = pos_E;
            12'd66: pos_0 = pos_E;  12'd67: pos_0 = pos_E;
            12'd68: pos_0 = pos_E;  12'd69: pos_0 = pos_E;
            12'd70: pos_0 = pos_E;  12'd71: pos_0 = pos_E;
            12'd72: pos_0 = pos_E;  12'd73: pos_0 = pos_E;
            12'd74: pos_0 = pos_E;  12'd75: pos_0 = pos_E;
            12'd76: pos_0 = none;   12'd77: pos_0 = none;
            12'd78: pos_0 = none;   12'd79: pos_0 = none;
            12'd80: pos_0 = none;   12'd81: pos_0 = none;
            12'd82: pos_0 = none;   12'd83: pos_0 = none;
            12'd84: pos_0 = pos_A;  12'd85: pos_0 = pos_A;
            12'd86: pos_0 = pos_A;  12'd87: pos_0 = pos_A;
            12'd88: pos_0 = pos_A;  12'd89: pos_0 = pos_A;
            12'd90: pos_0 = pos_A;  12'd91: pos_0 = pos_A;
            12'd92: pos_0 = pos_A;  12'd93: pos_0 = pos_A;
            12'd94: pos_0 = pos_A;  12'd95: pos_0 = pos_A;
            12'd96: pos_0 = pos_A;  12'd97: pos_0 = pos_A;
            12'd98: pos_0 = pos_A;  12'd99: pos_0 = pos_A;
            12'd100: pos_0 = pos_A; 12'd101: pos_0 = pos_A;
            12'd102: pos_0 = pos_A; 12'd103: pos_0 = pos_A;
            12'd104: pos_0 = none;  12'd105: pos_0 = none;
            12'd106: pos_0 = none;  12'd107: pos_0 = none;
            12'd108: pos_0 = none;  12'd109: pos_0 = none;
            12'd110: pos_0 = none;  12'd111: pos_0 = none;
            12'd112: pos_0 = pos_S; 12'd113: pos_0 = pos_S;
            12'd114: pos_0 = pos_S; 12'd115: pos_0 = pos_S;
            12'd116: pos_0 = pos_S; 12'd117: pos_0 = pos_S;
            12'd118: pos_0 = pos_S; 12'd119: pos_0 = pos_S;
            12'd120: pos_0 = pos_S; 12'd121: pos_0 = pos_S;
            12'd122: pos_0 = pos_S; 12'd123: pos_0 = pos_S;
            12'd124: pos_0 = pos_S; 12'd125: pos_0 = pos_S;
            12'd126: pos_0 = pos_S; 12'd127: pos_0 = pos_S;
            12'd128: pos_0 = pos_S; 12'd129: pos_0 = pos_S;
            12'd130: pos_0 = pos_S; 12'd131: pos_0 = pos_S;
            12'd132: pos_0 = none;  12'd133: pos_0 = none;
            12'd134: pos_0 = none;  12'd135: pos_0 = none;
            12'd136: pos_0 = none;  12'd137: pos_0 = none;
            12'd138: pos_0 = none;  12'd139: pos_0 = none;
            12'd140: pos_0 = pos_D; 12'd141: pos_0 = pos_D;
            12'd142: pos_0 = pos_D; 12'd143: pos_0 = pos_D;
            12'd144: pos_0 = pos_D; 12'd145: pos_0 = pos_D;
            12'd146: pos_0 = pos_D; 12'd147: pos_0 = pos_D;
            12'd148: pos_0 = pos_D; 12'd149: pos_0 = pos_D;
            12'd150: pos_0 = pos_D; 12'd151: pos_0 = pos_D;
            12'd152: pos_0 = pos_D; 12'd153: pos_0 = pos_D;
            12'd154: pos_0 = pos_D; 12'd155: pos_0 = pos_D;
            12'd156: pos_0 = pos_D; 12'd157: pos_0 = pos_D;
            12'd158: pos_0 = pos_D; 12'd159: pos_0 = pos_D;
            12'd160: pos_0 = none;  12'd161: pos_0 = none;
            12'd162: pos_0 = none;  12'd163: pos_0 = none;
            12'd164: pos_0 = none;  12'd165: pos_0 = none;
            12'd166: pos_0 = none;  12'd167: pos_0 = none;
            12'd168: pos_0 = pos_Z; 12'd169: pos_0 = pos_Z;
            12'd170: pos_0 = pos_Z; 12'd171: pos_0 = pos_Z;
            12'd172: pos_0 = pos_Z; 12'd173: pos_0 = pos_Z;
            12'd174: pos_0 = pos_Z; 12'd175: pos_0 = pos_Z;
            12'd176: pos_0 = pos_Z; 12'd177: pos_0 = pos_Z;
            12'd178: pos_0 = pos_Z; 12'd179: pos_0 = pos_Z;
            12'd180: pos_0 = pos_Z; 12'd181: pos_0 = pos_Z;
            12'd182: pos_0 = pos_Z; 12'd183: pos_0 = pos_Z;
            12'd184: pos_0 = pos_Z; 12'd185: pos_0 = pos_Z;
            12'd186: pos_0 = pos_Z; 12'd187: pos_0 = pos_Z;
            12'd188: pos_0 = none;  12'd189: pos_0 = none;
            12'd190: pos_0 = none;  12'd191: pos_0 = none;
            12'd192: pos_0 = none;  12'd193: pos_0 = none;
            12'd194: pos_0 = none;  12'd195: pos_0 = none;
            12'd196: pos_0 = pos_X; 12'd197: pos_0 = pos_X;
            12'd198: pos_0 = pos_X; 12'd199: pos_0 = pos_X;
            12'd200: pos_0 = pos_X; 12'd201: pos_0 = pos_X;
            12'd202: pos_0 = pos_X; 12'd203: pos_0 = pos_X;
            12'd204: pos_0 = pos_X; 12'd205: pos_0 = pos_X;
            12'd206: pos_0 = pos_X; 12'd207: pos_0 = pos_X;
            12'd208: pos_0 = pos_X; 12'd209: pos_0 = pos_X;
            12'd210: pos_0 = pos_X; 12'd211: pos_0 = pos_X;
            12'd212: pos_0 = pos_X; 12'd213: pos_0 = pos_X;
            12'd214: pos_0 = pos_X; 12'd215: pos_0 = pos_X;
            12'd216: pos_0 = none;  12'd217: pos_0 = none;
            12'd218: pos_0 = none;  12'd219: pos_0 = none;
            12'd220: pos_0 = none;  12'd221: pos_0 = none;
            12'd222: pos_0 = none;  12'd223: pos_0 = none;
            12'd224: pos_0 = pos_C; 12'd225: pos_0 = pos_C;
            12'd226: pos_0 = pos_C; 12'd227: pos_0 = pos_C;
            12'd228: pos_0 = pos_C; 12'd229: pos_0 = pos_C;
            12'd230: pos_0 = pos_C; 12'd231: pos_0 = pos_C;
            12'd232: pos_0 = pos_C; 12'd233: pos_0 = pos_C;
            12'd234: pos_0 = pos_C; 12'd235: pos_0 = pos_C;
            12'd236: pos_0 = pos_C; 12'd237: pos_0 = pos_C;
            12'd238: pos_0 = pos_C; 12'd239: pos_0 = pos_C;
            12'd240: pos_0 = pos_C; 12'd241: pos_0 = pos_C;
            12'd242: pos_0 = pos_C; 12'd243: pos_0 = pos_C;
            12'd244: pos_0 = none;  12'd245: pos_0 = none;
            12'd246: pos_0 = none;  12'd247: pos_0 = none;
            12'd248: pos_0 = none;  12'd249: pos_0 = none;
            12'd250: pos_0 = none;  12'd251: pos_0 = none;
            12'd252: pos_0 = pos_S; 12'd253: pos_0 = pos_S;
            12'd254: pos_0 = pos_S; 12'd255: pos_0 = pos_S;
            12'd256: pos_0 = pos_S; 12'd257: pos_0 = pos_S;
            12'd258: pos_0 = pos_S; 12'd259: pos_0 = pos_S;
            12'd260: pos_0 = pos_S; 12'd261: pos_0 = pos_S;
            12'd262: pos_0 = pos_S; 12'd263: pos_0 = pos_S;
            12'd264: pos_0 = pos_S; 12'd265: pos_0 = pos_S;
            12'd266: pos_0 = pos_S; 12'd267: pos_0 = pos_S;
            12'd268: pos_0 = pos_S; 12'd269: pos_0 = pos_S;
            12'd270: pos_0 = pos_S; 12'd271: pos_0 = pos_S;
            12'd272: pos_0 = none;  12'd273: pos_0 = none;
            12'd274: pos_0 = none;  12'd275: pos_0 = none;
            12'd276: pos_0 = none;  12'd277: pos_0 = none;
            12'd278: pos_0 = none;  12'd279: pos_0 = none;
            12'd280: pos_0 = pos_E; 12'd281: pos_0 = pos_E;
            12'd282: pos_0 = pos_E; 12'd283: pos_0 = pos_E;
            12'd284: pos_0 = pos_E; 12'd285: pos_0 = pos_E;
            12'd286: pos_0 = pos_E; 12'd287: pos_0 = pos_E;
            12'd288: pos_0 = pos_E; 12'd289: pos_0 = pos_E;
            12'd290: pos_0 = pos_E; 12'd291: pos_0 = pos_E;
            12'd292: pos_0 = pos_E; 12'd293: pos_0 = pos_E;
            12'd294: pos_0 = pos_E; 12'd295: pos_0 = pos_E;
            12'd296: pos_0 = pos_E; 12'd297: pos_0 = pos_E;
            12'd298: pos_0 = pos_E; 12'd299: pos_0 = pos_E;
            12'd300: pos_0 = none;  12'd301: pos_0 = none;
            12'd302: pos_0 = none;  12'd303: pos_0 = none;
            12'd304: pos_0 = none;  12'd305: pos_0 = none;
            12'd306: pos_0 = none;  12'd307: pos_0 = none;
            12'd308: pos_0 = pos_C; 12'd309: pos_0 = pos_C;
            12'd310: pos_0 = pos_C; 12'd311: pos_0 = pos_C;
            12'd312: pos_0 = pos_C; 12'd313: pos_0 = pos_C;
            12'd314: pos_0 = pos_C; 12'd315: pos_0 = pos_C;
            12'd316: pos_0 = pos_C; 12'd317: pos_0 = pos_C;
            12'd318: pos_0 = pos_C; 12'd319: pos_0 = pos_C;
            12'd320: pos_0 = pos_C; 12'd321: pos_0 = pos_C;
            12'd322: pos_0 = pos_C; 12'd323: pos_0 = pos_C;
            12'd324: pos_0 = pos_C; 12'd325: pos_0 = pos_C;
            12'd326: pos_0 = pos_C; 12'd327: pos_0 = pos_C;
            12'd328: pos_0 = none;  12'd329: pos_0 = none;
            12'd330: pos_0 = none;  12'd331: pos_0 = none;
            12'd332: pos_0 = none;  12'd333: pos_0 = none;
            12'd334: pos_0 = none;  12'd335: pos_0 = none;
            12'd336: pos_0 = pos_W; 12'd337: pos_0 = pos_W;
            12'd338: pos_0 = pos_W; 12'd339: pos_0 = pos_W;
            12'd340: pos_0 = pos_W; 12'd341: pos_0 = pos_W;
            12'd342: pos_0 = pos_W; 12'd343: pos_0 = pos_W;
            12'd344: pos_0 = pos_W; 12'd345: pos_0 = pos_W;
            12'd346: pos_0 = pos_W; 12'd347: pos_0 = pos_W;
            12'd348: pos_0 = pos_W; 12'd349: pos_0 = pos_W;
            12'd350: pos_0 = pos_W; 12'd351: pos_0 = pos_W;
            12'd352: pos_0 = pos_W; 12'd353: pos_0 = pos_W;
            12'd354: pos_0 = pos_W; 12'd355: pos_0 = pos_W;
            12'd356: pos_0 = none;  12'd357: pos_0 = none;
            12'd358: pos_0 = none;  12'd359: pos_0 = none;
            12'd360: pos_0 = none;  12'd361: pos_0 = none;
            12'd362: pos_0 = none;  12'd363: pos_0 = none;
            12'd364: pos_0 = pos_Q; 12'd365: pos_0 = pos_Q;
            12'd366: pos_0 = pos_Q; 12'd367: pos_0 = pos_Q;
            12'd368: pos_0 = pos_Q; 12'd369: pos_0 = pos_Q;
            12'd370: pos_0 = pos_Q; 12'd371: pos_0 = pos_Q;
            12'd372: pos_0 = pos_Q; 12'd373: pos_0 = pos_Q;
            12'd374: pos_0 = pos_Q; 12'd375: pos_0 = pos_Q;
            12'd376: pos_0 = pos_Q; 12'd377: pos_0 = pos_Q;
            12'd378: pos_0 = pos_Q; 12'd379: pos_0 = pos_Q;
            12'd380: pos_0 = pos_Q; 12'd381: pos_0 = pos_Q;
            12'd382: pos_0 = pos_Q; 12'd383: pos_0 = pos_Q;
            12'd384: pos_0 = none;  12'd385: pos_0 = none;
            12'd386: pos_0 = none;  12'd387: pos_0 = none;
            12'd388: pos_0 = none;  12'd389: pos_0 = none;
            12'd390: pos_0 = none;  12'd391: pos_0 = none;
            12'd392: pos_0 = pos_S; 12'd393: pos_0 = pos_S;
            12'd394: pos_0 = pos_S; 12'd395: pos_0 = pos_S;
            12'd396: pos_0 = pos_S; 12'd397: pos_0 = pos_S;
            12'd398: pos_0 = pos_S; 12'd399: pos_0 = pos_S;
            12'd400: pos_0 = pos_S; 12'd401: pos_0 = pos_S;
            12'd402: pos_0 = pos_S; 12'd403: pos_0 = pos_S;
            12'd404: pos_0 = pos_S; 12'd405: pos_0 = pos_S;
            12'd406: pos_0 = pos_S; 12'd407: pos_0 = pos_S;
            12'd408: pos_0 = pos_S; 12'd409: pos_0 = pos_S;
            12'd410: pos_0 = pos_S; 12'd411: pos_0 = pos_S;
            12'd412: pos_0 = none;  12'd413: pos_0 = none;
            12'd414: pos_0 = none;  12'd415: pos_0 = none;
            12'd416: pos_0 = none;  12'd417: pos_0 = none;
            12'd418: pos_0 = none;  12'd419: pos_0 = none;
            12'd420: pos_0 = pos_Q; 12'd421: pos_0 = pos_Q;
            12'd422: pos_0 = pos_Q; 12'd423: pos_0 = pos_Q;
            12'd424: pos_0 = pos_Q; 12'd425: pos_0 = pos_Q;
            12'd426: pos_0 = pos_Q; 12'd427: pos_0 = pos_Q;
            12'd428: pos_0 = pos_Q; 12'd429: pos_0 = pos_Q;
            12'd430: pos_0 = pos_Q; 12'd431: pos_0 = pos_Q;
            12'd432: pos_0 = pos_Q; 12'd433: pos_0 = pos_Q;
            12'd434: pos_0 = pos_Q; 12'd435: pos_0 = pos_Q;
            12'd436: pos_0 = pos_Q; 12'd437: pos_0 = pos_Q;
            12'd438: pos_0 = pos_Q; 12'd439: pos_0 = pos_Q;
            12'd440: pos_0 = none;  12'd441: pos_0 = none;
            12'd442: pos_0 = none;  12'd443: pos_0 = none;
            12'd444: pos_0 = none;  12'd445: pos_0 = none;
            12'd446: pos_0 = none;  12'd447: pos_0 = none;
            12'd448: pos_0 = pos_A; 12'd449: pos_0 = pos_A;
            12'd450: pos_0 = pos_A; 12'd451: pos_0 = pos_A;
            12'd452: pos_0 = pos_A; 12'd453: pos_0 = pos_A;
            12'd454: pos_0 = pos_A; 12'd455: pos_0 = pos_A;
            12'd456: pos_0 = pos_A; 12'd457: pos_0 = pos_A;
            12'd458: pos_0 = pos_A; 12'd459: pos_0 = pos_A;
            12'd460: pos_0 = pos_A; 12'd461: pos_0 = pos_A;
            12'd462: pos_0 = pos_A; 12'd463: pos_0 = pos_A;
            12'd464: pos_0 = pos_A; 12'd465: pos_0 = pos_A;
            12'd466: pos_0 = pos_A; 12'd467: pos_0 = pos_A;
            12'd468: pos_0 = none;  12'd469: pos_0 = none;
            12'd470: pos_0 = none;  12'd471: pos_0 = none;
            12'd472: pos_0 = none;  12'd473: pos_0 = none;
            12'd474: pos_0 = none;  12'd475: pos_0 = none;
            12'd476: pos_0 = pos_Z; 12'd477: pos_0 = pos_Z;
            12'd478: pos_0 = pos_Z; 12'd479: pos_0 = pos_Z;
            12'd480: pos_0 = pos_Z; 12'd481: pos_0 = pos_Z;
            12'd482: pos_0 = pos_Z; 12'd483: pos_0 = pos_Z;
            12'd484: pos_0 = pos_Z; 12'd485: pos_0 = pos_Z;
            12'd486: pos_0 = pos_Z; 12'd487: pos_0 = pos_Z;
            12'd488: pos_0 = pos_Z; 12'd489: pos_0 = pos_Z;
            12'd490: pos_0 = pos_Z; 12'd491: pos_0 = pos_Z;
            12'd492: pos_0 = pos_Z; 12'd493: pos_0 = pos_Z;
            12'd494: pos_0 = pos_Z; 12'd495: pos_0 = pos_Z;
            12'd496: pos_0 = none;  12'd497: pos_0 = none;
            12'd498: pos_0 = none;  12'd499: pos_0 = none;
            12'd500: pos_0 = none;  12'd501: pos_0 = none;
            12'd502: pos_0 = none;  12'd503: pos_0 = none;
            12'd504: pos_0 = pos_W; 12'd505: pos_0 = pos_W;
            12'd506: pos_0 = pos_W; 12'd507: pos_0 = pos_W;
            12'd508: pos_0 = pos_W; 12'd509: pos_0 = pos_W;
            12'd510: pos_0 = pos_W; 12'd511: pos_0 = pos_W;
            12'd512: pos_0 = pos_W; 12'd513: pos_0 = pos_W;
            12'd514: pos_0 = pos_W; 12'd515: pos_0 = pos_W;
            12'd516: pos_0 = pos_W; 12'd517: pos_0 = pos_W;
            12'd518: pos_0 = pos_W; 12'd519: pos_0 = pos_W;
            12'd520: pos_0 = pos_W; 12'd521: pos_0 = pos_W;
            12'd522: pos_0 = pos_W; 12'd523: pos_0 = pos_W;
            12'd524: pos_0 = none;  12'd525: pos_0 = none;
            12'd526: pos_0 = none;  12'd527: pos_0 = none;
            12'd528: pos_0 = none;  12'd529: pos_0 = none;
            12'd530: pos_0 = none;  12'd531: pos_0 = none;
            12'd532: pos_0 = pos_S; 12'd533: pos_0 = pos_S;
            12'd534: pos_0 = pos_S; 12'd535: pos_0 = pos_S;
            12'd536: pos_0 = pos_S; 12'd537: pos_0 = pos_S;
            12'd538: pos_0 = pos_S; 12'd539: pos_0 = pos_S;
            12'd540: pos_0 = pos_S; 12'd541: pos_0 = pos_S;
            12'd542: pos_0 = pos_S; 12'd543: pos_0 = pos_S;
            12'd544: pos_0 = pos_S; 12'd545: pos_0 = pos_S;
            12'd546: pos_0 = pos_S; 12'd547: pos_0 = pos_S;
            12'd548: pos_0 = pos_S; 12'd549: pos_0 = pos_S;
            12'd550: pos_0 = pos_S; 12'd551: pos_0 = pos_S;
            12'd552: pos_0 = none;  12'd553: pos_0 = none;
            12'd554: pos_0 = none;  12'd555: pos_0 = none;
            12'd556: pos_0 = none;  12'd557: pos_0 = none;
            12'd558: pos_0 = none;  12'd559: pos_0 = none;
            12'd560: pos_0 = pos_X; 12'd561: pos_0 = pos_X;
            12'd562: pos_0 = pos_X; 12'd563: pos_0 = pos_X;
            12'd564: pos_0 = pos_X; 12'd565: pos_0 = pos_X;
            12'd566: pos_0 = pos_X; 12'd567: pos_0 = pos_X;
            12'd568: pos_0 = pos_X; 12'd569: pos_0 = pos_X;
            12'd570: pos_0 = pos_X; 12'd571: pos_0 = pos_X;
            12'd572: pos_0 = pos_X; 12'd573: pos_0 = pos_X;
            12'd574: pos_0 = pos_X; 12'd575: pos_0 = pos_X;
            12'd576: pos_0 = pos_X; 12'd577: pos_0 = pos_X;
            12'd578: pos_0 = pos_X; 12'd579: pos_0 = pos_X;
            12'd580: pos_0 = none;  12'd581: pos_0 = none;
            12'd582: pos_0 = none;  12'd583: pos_0 = none;
            12'd584: pos_0 = none;  12'd585: pos_0 = none;
            12'd586: pos_0 = none;  12'd587: pos_0 = none;
            12'd588: pos_0 = pos_E; 12'd589: pos_0 = pos_E;
            12'd590: pos_0 = pos_E; 12'd591: pos_0 = pos_E;
            12'd592: pos_0 = pos_E; 12'd593: pos_0 = pos_E;
            12'd594: pos_0 = pos_E; 12'd595: pos_0 = pos_E;
            12'd596: pos_0 = pos_E; 12'd597: pos_0 = pos_E;
            12'd598: pos_0 = pos_E; 12'd599: pos_0 = pos_E;
            12'd600: pos_0 = pos_E; 12'd601: pos_0 = pos_E;
            12'd602: pos_0 = pos_E; 12'd603: pos_0 = pos_E;
            12'd604: pos_0 = pos_E; 12'd605: pos_0 = pos_E;
            12'd606: pos_0 = pos_E; 12'd607: pos_0 = pos_E;
            12'd608: pos_0 = none;  12'd609: pos_0 = none;
            12'd610: pos_0 = none;  12'd611: pos_0 = none;
            12'd612: pos_0 = none;  12'd613: pos_0 = none;
            12'd614: pos_0 = none;  12'd615: pos_0 = none;
            12'd616: pos_0 = pos_C; 12'd617: pos_0 = pos_C;
            12'd618: pos_0 = pos_C; 12'd619: pos_0 = pos_C;
            12'd620: pos_0 = pos_C; 12'd621: pos_0 = pos_C;
            12'd622: pos_0 = pos_C; 12'd623: pos_0 = pos_C;
            12'd624: pos_0 = pos_C; 12'd625: pos_0 = pos_C;
            12'd626: pos_0 = pos_C; 12'd627: pos_0 = pos_C;
            12'd628: pos_0 = pos_C; 12'd629: pos_0 = pos_C;
            12'd630: pos_0 = pos_C; 12'd631: pos_0 = pos_C;
            12'd632: pos_0 = pos_C; 12'd633: pos_0 = pos_C;
            12'd634: pos_0 = pos_C; 12'd635: pos_0 = pos_C;
            12'd636: pos_0 = none;  12'd637: pos_0 = none;
            12'd638: pos_0 = none;  12'd639: pos_0 = none;
            12'd640: pos_0 = none;  12'd641: pos_0 = none;
            12'd642: pos_0 = none;  12'd643: pos_0 = none;
            12'd644: pos_0 = pos_C; 12'd645: pos_0 = pos_C;
            12'd646: pos_0 = pos_C; 12'd647: pos_0 = pos_C;
            12'd648: pos_0 = pos_C; 12'd649: pos_0 = pos_C;
            12'd650: pos_0 = pos_C; 12'd651: pos_0 = pos_C;
            12'd652: pos_0 = pos_C; 12'd653: pos_0 = pos_C;
            12'd654: pos_0 = pos_C; 12'd655: pos_0 = pos_C;
            12'd656: pos_0 = pos_C; 12'd657: pos_0 = pos_C;
            12'd658: pos_0 = pos_C; 12'd659: pos_0 = pos_C;
            12'd660: pos_0 = pos_C; 12'd661: pos_0 = pos_C;
            12'd662: pos_0 = pos_C; 12'd663: pos_0 = pos_C;
            12'd664: pos_0 = none;  12'd665: pos_0 = none;
            12'd666: pos_0 = none;  12'd667: pos_0 = none;
            12'd668: pos_0 = none;  12'd669: pos_0 = none;
            12'd670: pos_0 = none;  12'd671: pos_0 = none;
            12'd672: pos_0 = pos_D; 12'd673: pos_0 = pos_D;
            12'd674: pos_0 = pos_D; 12'd675: pos_0 = pos_D;
            12'd676: pos_0 = pos_D; 12'd677: pos_0 = pos_D;
            12'd678: pos_0 = pos_D; 12'd679: pos_0 = pos_D;
            12'd680: pos_0 = pos_D; 12'd681: pos_0 = pos_D;
            12'd682: pos_0 = pos_D; 12'd683: pos_0 = pos_D;
            12'd684: pos_0 = pos_D; 12'd685: pos_0 = pos_D;
            12'd686: pos_0 = pos_D; 12'd687: pos_0 = pos_D;
            12'd688: pos_0 = pos_D; 12'd689: pos_0 = pos_D;
            12'd690: pos_0 = pos_D; 12'd691: pos_0 = pos_D;
            12'd692: pos_0 = none;  12'd693: pos_0 = none;
            12'd694: pos_0 = none;  12'd695: pos_0 = none;
            12'd696: pos_0 = none;  12'd697: pos_0 = none;
            12'd698: pos_0 = none;  12'd699: pos_0 = none;
            12'd700: pos_0 = pos_X; 12'd701: pos_0 = pos_X;
            12'd702: pos_0 = pos_X; 12'd703: pos_0 = pos_X;
            12'd704: pos_0 = pos_X; 12'd705: pos_0 = pos_X;
            12'd706: pos_0 = pos_X; 12'd707: pos_0 = pos_X;
            12'd708: pos_0 = pos_X; 12'd709: pos_0 = pos_X;
            12'd710: pos_0 = pos_X; 12'd711: pos_0 = pos_X;
            12'd712: pos_0 = pos_X; 12'd713: pos_0 = pos_X;
            12'd714: pos_0 = pos_X; 12'd715: pos_0 = pos_X;
            12'd716: pos_0 = pos_X; 12'd717: pos_0 = pos_X;
            12'd718: pos_0 = pos_X; 12'd719: pos_0 = pos_X;
            12'd720: pos_0 = none;  12'd721: pos_0 = none;
            12'd722: pos_0 = none;  12'd723: pos_0 = none;
            12'd724: pos_0 = none;  12'd725: pos_0 = none;
            12'd726: pos_0 = none;  12'd727: pos_0 = none;
            12'd728: pos_0 = pos_Z; 12'd729: pos_0 = pos_Z;
            12'd730: pos_0 = pos_Z; 12'd731: pos_0 = pos_Z;
            12'd732: pos_0 = pos_Z; 12'd733: pos_0 = pos_Z;
            12'd734: pos_0 = pos_Z; 12'd735: pos_0 = pos_Z;
            12'd736: pos_0 = pos_Z; 12'd737: pos_0 = pos_Z;
            12'd738: pos_0 = pos_Z; 12'd739: pos_0 = pos_Z;
            12'd740: pos_0 = pos_Z; 12'd741: pos_0 = pos_Z;
            12'd742: pos_0 = pos_Z; 12'd743: pos_0 = pos_Z;
            12'd744: pos_0 = pos_Z; 12'd745: pos_0 = pos_Z;
            12'd746: pos_0 = pos_Z; 12'd747: pos_0 = pos_Z;
            12'd748: pos_0 = none;  12'd749: pos_0 = none;
            12'd750: pos_0 = none;  12'd751: pos_0 = none;
            12'd752: pos_0 = none;  12'd753: pos_0 = none;
            12'd754: pos_0 = none;  12'd755: pos_0 = none;
            12'd756: pos_0 = pos_A; 12'd757: pos_0 = pos_A;
            12'd758: pos_0 = pos_A; 12'd759: pos_0 = pos_A;
            12'd760: pos_0 = pos_A; 12'd761: pos_0 = pos_A;
            12'd762: pos_0 = pos_A; 12'd763: pos_0 = pos_A;
            12'd764: pos_0 = pos_A; 12'd765: pos_0 = pos_A;
            12'd766: pos_0 = pos_A; 12'd767: pos_0 = pos_A;
            12'd768: pos_0 = pos_A; 12'd769: pos_0 = pos_A;
            12'd770: pos_0 = pos_A; 12'd771: pos_0 = pos_A;
            12'd772: pos_0 = pos_A; 12'd773: pos_0 = pos_A;
            12'd774: pos_0 = pos_A; 12'd775: pos_0 = pos_A;
            12'd776: pos_0 = none;  12'd777: pos_0 = none;
            12'd778: pos_0 = none;  12'd779: pos_0 = none;
            12'd780: pos_0 = none;  12'd781: pos_0 = none;
            12'd782: pos_0 = none;  12'd783: pos_0 = none;
            12'd784: pos_0 = pos_Q; 12'd785: pos_0 = pos_Q;
            12'd786: pos_0 = pos_Q; 12'd787: pos_0 = pos_Q;
            12'd788: pos_0 = pos_Q; 12'd789: pos_0 = pos_Q;
            12'd790: pos_0 = pos_Q; 12'd791: pos_0 = pos_Q;
            12'd792: pos_0 = pos_Q; 12'd793: pos_0 = pos_Q;
            12'd794: pos_0 = pos_Q; 12'd795: pos_0 = pos_Q;
            12'd796: pos_0 = pos_Q; 12'd797: pos_0 = pos_Q;
            12'd798: pos_0 = pos_Q; 12'd799: pos_0 = pos_Q;
            12'd800: pos_0 = pos_Q; 12'd801: pos_0 = pos_Q;
            12'd802: pos_0 = pos_Q; 12'd803: pos_0 = pos_Q;
            12'd804: pos_0 = none;  12'd805: pos_0 = none;
            12'd806: pos_0 = none;  12'd807: pos_0 = none;
            12'd808: pos_0 = none;  12'd809: pos_0 = none;
            12'd810: pos_0 = none;  12'd811: pos_0 = none;
            12'd812: pos_0 = pos_A; 12'd813: pos_0 = pos_A;
            12'd814: pos_0 = pos_A; 12'd815: pos_0 = pos_A;
            12'd816: pos_0 = pos_A; 12'd817: pos_0 = pos_A;
            12'd818: pos_0 = pos_A; 12'd819: pos_0 = pos_A;
            12'd820: pos_0 = pos_A; 12'd821: pos_0 = pos_A;
            12'd822: pos_0 = pos_A; 12'd823: pos_0 = pos_A;
            12'd824: pos_0 = pos_A; 12'd825: pos_0 = pos_A;
            12'd826: pos_0 = pos_A; 12'd827: pos_0 = pos_A;
            12'd828: pos_0 = pos_A; 12'd829: pos_0 = pos_A;
            12'd830: pos_0 = pos_A; 12'd831: pos_0 = pos_A;
            12'd832: pos_0 = none;  12'd833: pos_0 = none;
            12'd834: pos_0 = none;  12'd835: pos_0 = none;
            12'd836: pos_0 = none;  12'd837: pos_0 = none;
            12'd838: pos_0 = none;  12'd839: pos_0 = none;
        endcase
end
    
endmodule