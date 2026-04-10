`timescale 1ns / 1ps
module Counter_OK(clk, rst, CountOut, IdOut); 
input clk, rst;
output [2:0] CountOut;
output [3:0] IdOut;

reg [2:0] CountOut;
reg [3:0] IdOut;

always @(*) begin
    case (CountOut)
        3'b000: IdOut = 4'h0;
        3'b001: IdOut = 4'h1;
        3'b010: IdOut = #2 4'h3;
        3'b011: IdOut = 4'h6;
        3'b100: IdOut = #5 4'hC;
        3'b101: IdOut = 4'h0;
        3'b110: IdOut = 4'h0;
        3'b111: IdOut = 4'h8;
        default: IdOut = 4'bxxxx;
    endcase
end

always @(posedge rst or posedge clk) begin
    if( (rst == 1'b1)) begin
	    CountOut <= 3'b000;
	end
	else begin
		CountOut <= CountOut + 1'b1;
		if (CountOut==3'b111) begin
		    CountOut <= 3'b000;
		end
	end
end

endmodule


    /*
    `timescale 1ns / 1ps
    module Counter_OK(clk, rst, stop, CountOut, IdOut);
    input clk, rst, stop;
    output [2:0] CountOut;
    output [3:0] IdOut;
     
    reg [2:0] CountOut;
    reg [3:0] IdOut;
     
    reg count;
     
    initial
        count = 1'b1;
     
    always @(*)
    begin
        case (CountOut)
            3'b000:
                IdOut = 4'h0;
            3'b001:
                IdOut = 4'h1;
            3'b010:
                IdOut = 4'h3;
            3'b011:
                IdOut = 4'h6;
            3'b100:
                IdOut = 4'hC;
            3'b101:
                IdOut = 4'h0;
            3'b110:
                IdOut = 4'h0;
            3'b111:
                IdOut = 4'h8;
            default:
                IdOut = 4'bxxxx;
        endcase
    end
     
    always @(posedge rst or posedge clk or posedge stop)
    begin
        if( (rst == 1'b1))
        begin
            count <= 1'b1;
            CountOut <= 3'b000;
        end
        else if (stop == 1'b1)
        begin
        end
        else if (count == 1'b1)
        begin
            CountOut <= CountOut + 1'b1;
            if (CountOut == 3'b111)
            begin
                count <= 1'b0;
                CountOut <= 3'b110;
            end
        end
        else if (count == 1'b0)
        begin
            CountOut <= CountOut - 1'b1;
            if (CountOut == 3'b000)
            begin
                count <= 1'b1;
                CountOut <= 3'b001;
            end
        end
    end
     
    endmodule
*/