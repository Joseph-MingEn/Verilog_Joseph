iverilog -o sim tb/TB_LUT_ID.v src/LUT_ID.v
vvp sim
gtkwave wave.vcd