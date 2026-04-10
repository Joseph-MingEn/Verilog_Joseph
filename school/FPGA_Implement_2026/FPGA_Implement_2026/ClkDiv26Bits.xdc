set_property -dict {PACKAGE_PIN F14 IOSTANDARD LVCMOS33} [get_ports CLK]
create_clock -period 83.333 -name sys_clk_pin -waveform {0.000 41.667} -add [get_ports CLK]

set_property -dict {PACKAGE_PIN E18 IOSTANDARD LVCMOS33} [get_ports D0]
set_property -dict {PACKAGE_PIN F13 IOSTANDARD LVCMOS33} [get_ports D1]
set_property -dict {PACKAGE_PIN E13 IOSTANDARD LVCMOS33} [get_ports D2]
set_property -dict {PACKAGE_PIN H15 IOSTANDARD LVCMOS33} [get_ports D3]


