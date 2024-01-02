module script_counter (
    input clk,
    input rst, 
    output [7:0] count
);

reg [7:0] temp, count_temp;

assign count = count_temp;

always @(posedge clk or posedge rst) begin
    if(rst) begin
        count_temp <= 0;
    end
    else begin
        count_temp <= temp;
    end
end

always @(*) begin
    if(count < 160) temp = 0;
    else temp = count + 1;
end
    
endmodule