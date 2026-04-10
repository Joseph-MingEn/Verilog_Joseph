`timescale 1ns / 1ps

module TB_Counter;

reg rst, clk;
//reg rst, clk, stop;

wire [2:0] Count_Out;
wire [3:0] ID_out;
//Counter_OK OK_Counter(.clk(clk), .rst(rst), .CountOut(Count_Out), .IdOut(ID_out));
//Counter_OK OK_Counter(.clk(clk), .rst(rst), .stop(stop), .CountOut(Count_Out), .IdOut(ID_out));
Counter_GG GG_Counter(.clk(clk), .rst(rst), .CountOut(Count_Out), .IdOut(ID_out));


always
begin
    #5
     clk=~clk;
end

initial
begin
    rst=1'b1;
    clk=1'b0;
//    stop=1'b0;

    #25 rst=1'b0;

    //#100 $stop;

//    #80 stop=1'b1;

//    #100 stop=1'b0;

    #600  $stop;

end

endmodule
