`timescale 1ns / 1ps

module TB_LUT_ID;
wire D0, D1, D2, D3;
reg A0, A1, A2;

B_0136C008 LUT_ID(.A0(A0), .A1(A1), .A2(A2), .D0(D0), .D1(D1), .D2(D2), .D3(D3));

initial
begin
    A0=1'b0;
    A1=1'b0;
    A2=1'b0;

    #10
     A0=1'b1;
    A1=1'b0;
    A2=1'b0;

    #10
     A0=1'b0;
    A1=1'b1;
    A2=1'b0;

    #10
     A0=1'b1;
    A1=1'b1;
    A2=1'b0;

    #10
     A0=1'b0;
    A1=1'b0;
    A2=1'b1;

    #10
     A0=1'b1;
    A1=1'b0;
    A2=1'b1;

    #10
     A0=1'b0;
    A1=1'b1;
    A2=1'b1;

    #10
     A0=1'b1;
    A1=1'b1;
    A2=1'b1;

    #10 $finish;

end

endmodule

