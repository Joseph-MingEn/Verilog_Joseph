`timescale 1ns / 1ps
module FSM_HW(clk, rst, In, Out, Rev);
input clk, rst, In, Rev;
output [3:0] Out;
reg [3:0] Out;

// State machine states
/*
parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;
parameter S3 = 2'b11;
*/
parameter[2:0]
         S0 = 3'b000,
         S1 = 3'b001,
         S2 = 3'b010,
         S3 = 3'b011,
         S4 = 3'b100,
         S5 = 3'b101,
         S6 = 3'b110,
         S7 = 3'b111;

reg [2:0] Org_State;
reg [2:0] New_State;

//==== Org_State ===
always @(posedge rst or posedge clk)
begin
    //always @(posedge clk) begin
    if( (rst == 1'b1))
    begin
        Org_State <= S0;
    end
    else
    begin
        Org_State <= New_State;
    end
end

//==== New_State ===
always @(Org_State or In or Rev)
begin
    case ( {Org_State, In} )
        {S0, 1'b0}:
            New_State = S0;
        {S0, 1'b1}:
        begin
            if(Rev == 1'b1)
            begin
                New_State = S7;
            end
            else
            begin
                New_State = S1;
            end
        end
        {S1, 1'b0}:
        begin
            New_State = S1;
        end
        {S1, 1'b1}:
        begin
            if(Rev == 1'b1)
            begin
                New_State = S0;
            end
            else
            begin
                New_State = S2;
            end
        end
        {S2, 1'b0}:
            New_State = S2;
        {S2, 1'b1}:
        begin
            if(Rev == 1'b1)
            begin
                New_State = S1;
            end
            else
            begin
                New_State = S3;
            end
        end
        {S3, 1'b0}:
            New_State = S3;
        {S3, 1'b1}:
            begin
                if(Rev == 1'b1)
                begin
                    New_State = S2;
                end
                else
                begin
                    New_State = S4;
                end
            end
        {S4, 1'b0}:
            New_State = S4;
        {S4, 1'b1}:
        begin
            if(Rev == 1'b1)
            begin
                New_State = S3;
            end
            else
            begin
                New_State = S5;
            end
        end
        {S5, 1'b0}:
        begin
            New_State = S5;
        end
        {S5, 1'b1}:
        begin
            if(Rev == 1'b1)
            begin
                New_State = S4;
            end
            else
            begin
                New_State = S6;
            end
        end
        {S6, 1'b0}:
            New_State = S6;
        {S6, 1'b1}:
        begin
            if(Rev == 1'b1)
            begin
                New_State = S5;
            end
            else
            begin
                New_State = S7;
            end
        end
        {S7, 1'b0}:
            New_State = S7;
        {S7, 1'b1}:
        begin
            if(Rev == 1'b1)
            begin
                New_State = S6;
            end
            else
            begin
                New_State = S0;
            end
        end
        default:
            New_State = 3'bxxx;
    endcase
end

//==== Out ===
always @(Org_State or In)
begin
    if(rst == 1'b1)
    begin
        Out = 4'b0000;
    end
    else
    case ( {Org_State, Rev} )
        {S0, 1'b0}:
            Out = 4'b0001;
        {S0, 1'b1}:
            Out = 4'b0000;
        {S1, 1'b0}:
            Out = 4'b0011;
        {S1, 1'b1}:
            Out = 4'b0001;
        {S2, 1'b0}:
            Out = 4'b0110;
        {S2, 1'b1}:
            Out = 4'b0011;
        {S3, 1'b0}:
            Out = 4'b1100;
        {S3, 1'b1}:
            Out = 4'b0110;
        {S4, 1'b0}:
            Out = 4'b0000;
        {S4, 1'b1}:
            Out = 4'b1100;
        {S5, 1'b0}:
            Out = 4'b0000;
        {S5, 1'b1}:
            Out = 4'b0000;
        {S6, 1'b0}:
            Out = 4'b1000;
        {S6, 1'b1}:
            Out = 4'b0000;
        {S7, 1'b0}:
            Out = 4'b0000;
        {S7, 1'b1}:
            Out = 4'b1000;
        default:
            Out = 4'bxxxx;
    endcase
end

endmodule

