
`timescale 1ns / 1ps
module ClkDiv(clk, rst, CountOut, Duty50, Duty75); 
input clk, rst;
output reg [2:0] CountOut;
output Duty50, Duty75;
reg Duty75;

always@(posedge clk) begin
    if(rst == 1'b1) begin
        CountOut <= 3'b000;
    end
	else begin
        CountOut <= CountOut+1'b1;
	end
end

assign Duty50 = CountOut[2];

always@(posedge clk) begin
    if(rst == 1'b1) begin
        Duty75 <= 1'b0;
    end
	else begin
        if(CountOut==3'b110 || CountOut==3'b111) begin
            Duty75 <= 1'b0;
        end
	    else begin
            Duty75 <= 1'b1;
	    end
	end
end

endmodule



