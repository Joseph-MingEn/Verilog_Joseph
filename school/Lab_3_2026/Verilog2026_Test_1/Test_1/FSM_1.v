
`timescale 1ns / 1ps
module FSM_1(clk, rst, In, Out); 
input clk, rst, In;
output [1:0] Out;
reg [1:0] Out;

// State machine states
/*
parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;
parameter S3 = 2'b11;
*/
parameter[1:0] 
S0 = 2'b00,
S1 = 2'b01,
S2 = 2'b10,
S3 = 2'b11;

reg [1:0] Org_State;
reg [1:0] New_State;

//==== Org_State ===
always @(posedge rst or posedge clk) begin
//always @(posedge clk) begin
    if( (rst == 1'b1)) begin
	    Org_State <= S0;
	end
	else begin
		Org_State <= New_State;
	end
end

//==== New_State ===
always @(Org_State or In) begin
    case ( {Org_State, In} )
        {S0, 1'b0}: New_State = S0;
		{S0, 1'b1}: New_State = S1;
        {S1, 1'b0}: New_State = S2;
		{S1, 1'b1}: New_State = S3;
        {S2, 1'b0}: New_State = S0;
		{S2, 1'b1}: New_State = S1;
        {S3, 1'b0}: New_State = S3;
		{S3, 1'b1}: New_State = S2;
        default: New_State = 2'bxx;
    endcase
end

//==== Out ===
always @(Org_State or In) begin
    case ( {Org_State, In} )
        {S0, 1'b0}: Out = 2'b00;
		{S0, 1'b1}: Out = 2'b11;
        {S1, 1'b0}: Out = 2'b10;
		{S1, 1'b1}: Out = 2'b01;
        {S2, 1'b0}: Out = 2'b01;
		{S2, 1'b1}: Out = 2'b01;
        {S3, 1'b0}: Out = 2'b11;
		{S3, 1'b1}: Out = 2'b00;
        default: Out = 2'bxx;
    endcase
end

endmodule

