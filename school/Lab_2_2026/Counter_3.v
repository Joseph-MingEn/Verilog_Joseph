
module Counter_3(clk, rst, CountOut, IdOut); 
input clk, rst;
output [1:0] CountOut;
output [2:0] IdOut;

reg [1:0] CountOut;
reg [2:0] IdOut;

    always @(*) begin
        case (CountOut)
            2'b00: IdOut = 3'b101;
            2'b01: IdOut = 3'b111;
            2'b10: IdOut = 3'b110;
            2'b11: IdOut = 3'b100;
            default: IdOut = 3'bxxx;
        endcase
    end

    always @(posedge rst or posedge clk) begin
        if( (rst == 1'b1) || (CountOut >= 2'd2) ) begin
    	    CountOut <= 2'b00;
    	end
    	else begin
    		CountOut <= CountOut + 1'b1;
    	end
    end

endmodule

