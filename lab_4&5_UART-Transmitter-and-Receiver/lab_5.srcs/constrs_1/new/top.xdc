#Clock and reset signals:
        set_property PACKAGE_PIN W5 [get_ports CLK]
         set_property IOSTANDARD LVCMOS33 [get_ports CLK]
        set_property PACKAGE_PIN R2 [get_ports RST]
         set_property IOSTANDARD LVCMOS33 [get_ports RST]

#USB-RS232 interface
        set_property PACKAGE_PIN B18 [get_ports input_bit]
         set_property IOSTANDARD LVCMOS33 [get_ports input_bit]
        set_property PACKAGE_PIN A18 [get_ports output_bit]
         set_property IOSTANDARD LVCMOS33 [get_ports output_bit]