module FSM_MealyModel (clk, rst, In, Out, rev);
input clk, rst, In, rev;
output [3:0] Out;
reg [2:0] Org_State, New_State;
parameter S0 = 3'b000;
parameter S1 = 3'b001;
parameter S2 = 3'b010;
parameter S3 = 3'b011;
parameter S4 = 3'b100;
parameter S5 = 3'b101;
parameter S6 = 3'b110;
parameter S7 = 3'b111;

always @(posedge clk or posedge rst)
begin
    if(rst == 1'b1)
    begin
        Org_State <= S0;
    end
    else
    begin
        Org_State <= New_State;
    end
end

always @(*)
begin
    if (In == 1'b1)
    begin
        case ({Org_State, rev})
            {S0, 1'b0}:
                New_State = S1;
            {S0, 1'b1}:
                New_State = S7;
            {S1, 1'b0}:
                New_State = S2;
            {S1, 1'b1}:
                New_State = S0;
            {S2, 1'b0}:
                New_State = S3;
            {S2, 1'b1}:
                New_State = S1;
            {S3, 1'b0}:
                New_State = S4;
            {S3, 1'b1}:
                New_State = S2;
            {S4, 1'b0}:
                New_State = S5;
            {S4, 1'b1}:
                New_State = S3;
            {S5, 1'b0}:
                New_State = S6;
            {S5, 1'b1}:
                New_State = S4;
            {S6, 1'b0}:
                New_State = S7;
            {S6, 1'b1}:
                New_State = S5;
            {S7, 1'b0}:
                New_State = S0;
            {S7, 1'b1}:
                New_State = S6;
        endcase
    end
    else
    begin
        New_State = Org_State;
    end

end

assign Out = ({Org_State, In} == {S0, 1'b1}) ? 4'b0000 :
       ({Org_State, In} == {S1, 1'b1}) ? 4'b0001 :
       ({Org_State, In} == {S2, 1'b1}) ? 4'b0011 :
       ({Org_State, In} == {S3, 1'b1}) ? 4'b0110 :
       ({Org_State, In} == {S4, 1'b1}) ? 4'b1100 :
       ({Org_State, In} == {S5, 1'b1}) ? 4'b0000 :
       ({Org_State, In} == {S6, 1'b1}) ? 4'b0000 :
       ({Org_State, In} == {S7, 1'b1}) ? 4'b1000 :
       (In == 1'b0) ? Out :
       4'bxxxx;

endmodule
