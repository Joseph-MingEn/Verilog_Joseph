module B_0136C008(A0, A1, A2, D0, D1, D2, D3);
input A0, A1, A2;
output D0, D1, D2, D3;
reg D0, D1, D2, D3;

wire A0_inv, A1_inv, A2_inv;
wire and_001, and_010, and_011, and_100,and_111;

inv_1 inv_A0(.out(A0_inv), .in(A0));
inv_1 inv_A1(.out(A1_inv), .in(A1));
inv_1 inv_A2(.out(A2_inv), .in(A2));

and_3 A_1(.in_1(A0_inv), .in_2(A1_inv), .in_3(A2_inv), .out(and_001));
and_3 A_2(.in_1(A0_inv), .in_2(A1), .in_3(A2_inv), .out(and_010));
and_3 A_3(.in_1(A0_inv), .in_2(A1), .in_3(A2), .out(and_011));
and_3 A_4(.in_1(A0), .in_2(A1_inv), .in_3(A2_inv), .out(and_100));
and_3 A_5(.in_1(A0), .in_2(A1), .in_3(A2), .out(and_111));

or_2 or_D0(.out(D0), .in_a(and_001), .in_b(and_010));
or_2 or_D1(.out(D1), .in_a(and_010), .in_b(and_011));
or_2 or_D2(.out(D2), .in_a(and_011), .in_b(and_100));
or_2 or_D3(.out(D3), .in_a(and_100), .in_b(and_111));
endmodule