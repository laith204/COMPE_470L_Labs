#Clock and reset signals:
        set_property PACKAGE_PIN W5 [get_ports CLK]
         set_property IOSTANDARD LVCMOS33 [get_ports CLK]
        set_property PACKAGE_PIN R2 [get_ports RST]
         set_property IOSTANDARD LVCMOS33 [get_ports RST]
    
#led signal:
        set_property PACKAGE_PIN U2 [get_ports {AN0[0]}]
            set_property IOSTANDARD LVCMOS33 [get_ports {AN0[0]}]
        set_property PACKAGE_PIN U4 [get_ports {AN0[1]}]
            set_property IOSTANDARD LVCMOS33 [get_ports {AN0[1]}]
        set_property PACKAGE_PIN V4 [get_ports {AN0[2]}] 
            set_property IOSTANDARD LVCMOS33 [get_ports {AN0[2]}]
        set_property PACKAGE_PIN W4 [get_ports {AN0[3]}]
            set_property IOSTANDARD LVCMOS33 [get_ports {AN0[3]}]
      
      
      
        set_property PACKAGE_PIN W7 [get_ports {LED[6]}]
          set_property IOSTANDARD LVCMOS33 [get_ports {LED[6]}]
        set_property PACKAGE_PIN W6 [get_ports {LED[5]}]
          set_property IOSTANDARD LVCMOS33 [get_ports {LED[5]}]
        set_property PACKAGE_PIN U8 [get_ports {LED[4]}]
          set_property IOSTANDARD LVCMOS33 [get_ports {LED[4]}]
        set_property PACKAGE_PIN V8 [get_ports {LED[3]}]
          set_property IOSTANDARD LVCMOS33 [get_ports {LED[3]}]
        set_property PACKAGE_PIN U5 [get_ports {LED[2]}]
          set_property IOSTANDARD LVCMOS33 [get_ports {LED[2]}]
        set_property PACKAGE_PIN V5 [get_ports {LED[1]}]
          set_property IOSTANDARD LVCMOS33 [get_ports {LED[1]}]
        set_property PACKAGE_PIN U7 [get_ports {LED[0]}]
          set_property IOSTANDARD LVCMOS33 [get_ports {LED[0]}]