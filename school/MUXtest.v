module D_FF (
    in, out, clk, rst
);
input in, clk, rst;
output out;
reg out;

always @(rst or posedge clk) begin
    if(rst == 1'b1) begin
        out <= 1'b0;
    end
    else begin
        out <= in;
    end
    
end
    
endmodule

module inv_1 (
    in, out
);
input in;
output out;

assign out = ~in;
    
endmodule

module and_2 (
    in_1, in_2, out
);
input in_1, in_2;
output out;

assign out = in_1 & in_2;
    
endmodule

module or_2 (
    in_1, in_2, out
);
input in_1, in_2;
output out;

assign out = in_1 | in_2;
    
endmodule

module mux_2(
    in_1, in_2, sel, out
);
input in_1, in_2, sel;
output out;

wire sel_inv;
wire a_out;
wire b_out;

inv_1 N1(.in(sel), .out(sel_inv));
and_2 A1(.in_1(in_1), .in_2(sel), .out(a_out));
and_2 A2(.in_1(in_2), .in_2(sel_inv), .out(b_out));
or_2 O1(.in_1(a_out), .in_2(b_out), .out(out));
    
endmodule