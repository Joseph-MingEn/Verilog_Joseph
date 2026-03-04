iverilog -o sim tb/counter_tb.v src/counter.v
vvp sim
gtkwave wave.vcd