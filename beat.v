module beat(
    input clk,
    input reset,
    input [3:0] mode,
    output reg [11:0] ibeat
);
    parameter GAMESTART = 4'd0;
    parameter EASY = 4'd1;
    parameter NORMAL = 4'd2;
    parameter HARD = 4'd3;
    parameter INFERNO = 4'd4;
    parameter FAILURE = 4'd5; 
    parameter start_LEN = 256;
    parameter stage_LEN = 512;
    parameter fail_LEN = 128;
    
    
	reg [11:0] start_beat;
	reg [11:0] stage_beat;
	reg [11:0] fail_beat;
	reg [11:0] next_start_beat;
	reg [11:0] next_stage_beat;
	reg [11:0] next_fail_beat;
    
    always @(posedge clk or posedge reset) begin
		if (reset) begin
			ibeat <= 0;
			start_beat <= 0;
			stage_beat <= 0;
			fail_beat <= 0;
		end else begin
           case(mode) 
	           GAMESTART: ibeat <= start_beat;
	           EASY: ibeat <= stage_beat;
	           NORMAL: ibeat <= stage_beat;
	           HARD: ibeat <= stage_beat;
	           INFERNO: ibeat <= stage_beat;
	           FAILURE: ibeat <= fail_beat;
               default: ibeat <= ibeat;
            endcase
            start_beat <= next_start_beat;
			stage_beat <= next_stage_beat;
			fail_beat <= next_fail_beat;
		end
	end
	always @(*) begin
	   case(mode) 
	       GAMESTART: begin
			   if(start_beat < start_LEN) next_start_beat = start_beat + 1;
			   else next_start_beat = 0;
	           next_stage_beat = 0;
	           next_fail_beat = 0;
	       end
	       EASY: begin
			   if(stage_beat < stage_LEN) next_stage_beat = stage_beat + 1;
			   else next_stage_beat = 0;
	           next_start_beat = 0;
	           next_fail_beat = 0;
	       end
	       NORMAL: begin
			   if(stage_beat < stage_LEN) next_stage_beat = stage_beat + 1;
			   else next_stage_beat = 0;
	           next_start_beat = 0;
	           next_fail_beat = 0;
	       end
	       HARD: begin
			   if(stage_beat < stage_LEN) next_stage_beat = stage_beat + 1;
			   else next_stage_beat = 0;
	           next_start_beat = 0;
	           next_fail_beat = 0;
	       end
	       INFERNO: begin
			   if(stage_beat < stage_LEN) next_stage_beat = stage_beat + 1;
			   else next_stage_beat = 0;
	           next_stage_beat = (stage_beat + 1 < stage_LEN) ? (stage_beat + 1) : 0;
	           next_start_beat = 0;
	           next_fail_beat = 0;
	       end
	       FAILURE: begin
			   if(fail_beat < fail_LEN) next_fail_beat = fail_beat + 1;
			   else next_fail_beat = 0;
	           next_start_beat = 0;
	           next_stage_beat = 0;
	       end
	   default: begin
	       next_start_beat = start_beat;
	       next_stage_beat = stage_beat;
	       next_fail_beat = fail_beat;
	   end
	   endcase
    end

endmodule
