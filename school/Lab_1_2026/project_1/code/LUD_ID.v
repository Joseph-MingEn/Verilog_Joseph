module LUD_ID (rst, clk, A3, A2, A1, A0, out);
input rst, clk;
input A3, A2, A1, A0;
output [3:0] out;
reg [3:0] out;

always @(*) begin
    case ({A3, A2, A1, A0})
        4'b0000: out = 4'b0000;
        4'b0001: out = 4'b0001;
        4'b0011: out = 4'b0011;
        4'b0111: out = 4'b0110;
        4'b1111: out = 4'b1100;
        4'b1110: out = 4'b0000;
        4'b1100: out = 4'b0000;
        4'b1000: out = 4'b1000;
        default: out = 4'b0000;
    endcase
    
end
    
endmodule