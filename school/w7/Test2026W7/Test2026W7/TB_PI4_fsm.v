
`timescale 1ns / 1ps

`define halfT 12

module TB_PI4_fsm;

reg rst, clk;
reg [3:0] A, B, C, D;
wire clk_o;
wire [7:0] AB;
wire [11:0] ABC; 
wire [15:0] ABCD, EndBuf;

PI4_fsm Utest(.clk(clk), .clk_o(clk_o), .rst(rst), .A(A), .B(B), .C(C), .D(D), .AB(AB), .ABC(ABC), .ABCD(ABCD), .EndBuf(EndBuf));
//PI4_fsm Utest(.clk(clk), .clk_o(clk_o), .rst(rst), .A(A), .B(B), .C(C), .D(D), .EndBuf(EndBuf));

always begin
//#20
# `halfT
clk=~clk;
end

initial begin
    rst= 1'b0;
	clk= 1'b0;
	A = 4'h0;
	B = 4'h0;
	C = 4'h0;
	D = 4'h0;
	
	//#30   rst=1'b1;
	#`halfT
	#`halfT
	#`halfT  rst=1'b1;
	#`halfT
	#`halfT
	#`halfT  rst=1'b0;
	
	#`halfT
	#`halfT
	#`halfT
	#`halfT
	#`halfT
	#`halfT
	#`halfT
	#`halfT  A = 4'h1;
	         B = 4'h2;
	         C = 4'h3;
	         D = 4'h4;

	#`halfT
	#`halfT
	#`halfT
	#`halfT
	#`halfT
	#`halfT
	#`halfT
	#`halfT  A = 4'h5;
	         B = 4'h6;
	         C = 4'h7;
	         D = 4'h8;
	         
	#`halfT
	#`halfT
	#`halfT
	#`halfT
	#`halfT
	#`halfT
	#`halfT
	#`halfT  A = 4'h9;
	         B = 4'hA;
	         C = 4'hB;
	         D = 4'hC;
	
	#`halfT
	#`halfT
	#`halfT
	#`halfT
	#`halfT
	#`halfT
	#`halfT
    #`halfT
	#`halfT	         
	#`halfT
	#`halfT  $stop;
end
endmodule


`timescale 1ns / 1ps
module PI4_fsm(clk, clk_o, rst, A, B, C, D, AB, ABC, ABCD, EndBuf); 
input clk, rst;
output clk_o;
input [3:0] A, B, C, D;

output [7:0] AB;
output [11:0] ABC;
output [15:0] ABCD;

output [15:0] EndBuf;
reg [15:0]    EndBuf;

assign clk_o=clk;

parameter Ini = 2'b00;
parameter Pi2 = 2'b01;
parameter Pi3 = 2'b10;
parameter Pi4 = 2'b11;

reg [1:0] Org_State;
reg [1:0] New_State;

always @(posedge clk) begin
    if( (rst == 1'b1)) begin
	    Org_State <= Ini;
	end
	else begin
		Org_State <= New_State;
	end
end

//==== New_State ===
always @(Org_State) begin
    case ( Org_State )
        Ini: New_State = Pi2;
		Pi2: New_State = Pi3;
        Pi3: New_State = Pi4;
		Pi4: New_State = Ini;
        default: New_State = Ini;
    endcase
end

assign AB = EndBuf[3:0]*B;
assign ABC = EndBuf[7:0]*C;
assign ABCD = EndBuf[11:0]*D;

always @(posedge clk) begin
    case ( Org_State )
        Ini: EndBuf <= {12'h000, A};
		Pi2: EndBuf <= {8'h00, AB};
        Pi3: EndBuf <= {4'h0, ABC};
		Pi4: EndBuf <= ABCD;
        default: EndBuf = EndBuf;
    endcase
end

endmodule



