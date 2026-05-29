`timescale 1ns / 1ps
module TB_STUDENT_ROM;
reg [2:0] addr;
wire [3:0] data;

STUDENT_ROM U0(
    .addr(addr),
    .data(data)
    );

initial begin
    addr = 3'd0; #10;
    addr = 3'd1; #10;
    addr = 3'd2; #10;
    addr = 3'd3; #10;
    addr = 3'd4; #10;
    addr = 3'd5; #10;
    addr = 3'd6; #10;
    addr = 3'd7; #10;
    $stop;
end

endmodule
