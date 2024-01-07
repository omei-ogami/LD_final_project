module music(
    input clk,
    input clk_22,
    input reset,
    input [3:0]mode,
    output audio_mclk, // master clock
    output audio_lrck, // left-right clock
    output audio_sck,  // serial clock
    output audio_sdin // serial audio data input
);
    wire [15:0] audio_in_left, audio_in_right;
    wire [11:0] ibeatNum;
    wire [31:0] toneL, toneR; 
    wire [21:0] freq_outL, freq_outR;
    
    beat beat(.clk(clk_22), .reset(reset), .mode(mode), .ibeat(ibeatNum));
    music_sheet sheet(.ibeatNum(ibeatNum), .mode(mode), .toneL(toneL), .toneR(toneR));
    
    assign freq_outL = 50000000 / toneL;
    assign freq_outR = 50000000 / toneR;
    
    note_gen noteGen_00(
        .clk(clk), 
        .rst(reset), 
        .note_div_left(freq_outL), 
        .note_div_right(freq_outR), 
        .audio_left(audio_in_left),     // left sound audio
        .audio_right(audio_in_right)    // right sound audio
    );

    // Speaker controller
    speaker_control sc(
        .clk(clk), 
        .rst(reset), 
        .audio_in_left(audio_in_left),      // left channel audio data input
        .audio_in_right(audio_in_right),    // right channel audio data input
        .audio_mclk(audio_mclk),            // master clock
        .audio_lrck(audio_lrck),            // left-right clock
        .audio_sck(audio_sck),              // serial clock
        .audio_sdin(audio_sdin)             // serial audio data input
    );
endmodule
