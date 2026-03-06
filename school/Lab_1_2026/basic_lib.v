
module and_2(out, in_1, in_2);
input in_1, in_2;
output out;

assign out = in_1 & in_2;

endmodule 



module or_2(out, in_a, in_b);
input in_a, in_b;
output out;

assign out = in_a | in_b;

endmodule 



module inv_1(out, in);
input in;
output out;

assign out = ~in;

endmodule 



module D_FF(out, in, clk, rst);
input in, clk, rst;
output out;
reg    out;

always @(posedge rst or posedge clk) begin
//always @(rst or posedge clk) begin
//always @(posedge clk) begin
    if(rst == 1'b1) begin
        out <= 1'b0;
	end
	else begin
	    out <= in;
	end
	
end

endmodule
