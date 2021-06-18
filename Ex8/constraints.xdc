##############################################
# Part         - xcvu9p
# Package      - fsgd2104
# Speed grade  - -2L
# Xilinx Reference Board is VCU1525
###############################################################################

# General configuration - Do not modify
set_property CFGBVS GND                                [current_design]
set_property CONFIG_VOLTAGE 1.8                        [current_design]
set_property BITSTREAM.GENERAL.COMPRESS true           [current_design]
set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN {DIV-1} [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES       [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4           [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES        [current_design]

#############################################################################################################


## Timing Assertions Section
# Primary clocks
create_clock -name clk -period 10 [get_ports clk_p]
# Virtual Clocks
# Generated clocks
# Clock Groups
set_clock_groups -asynchronous -group [get_clocks <clk_name> -include_generated_clocks]
# Input and output delay constraints


## Timing Exceptions Section
# False Paths
# Max and Min Delay
# Multicycle Paths
# Case Analysis
# Disable Timing


## Physical Constraints Section
# Mandatory Constraints
set_property PACKAGE_PIN AY38 [get_ports clk_n]
set_property PACKAGE_PIN AY37 [get_ports clk_p]
set_property PACKAGE_PIN BD21 [get_ports rst_n]
set_property PACKAGE_PIN AU22 [get_ports heating]
set_property PACKAGE_PIN AT22 [get_ports cooling]
set_property PACKAGE_PIN BC21 [get_ports temperature_0]
set_property PACKAGE_PIN BB21 [get_ports temperature_1]
set_property PACKAGE_PIN BA20 [get_ports temperature_2]
set_property PACKAGE_PIN AL20 [get_ports temperature_3]
set_property PACKAGE_PIN AT20 [get_ports temperature_4]

# Port Constraint type
set_porperty IOSTANDARD DIFF_SSTL12 [get_ports clk_n]
set_porperty IOSTANDARD DIFF_SSTL12 [get_ports clk_p]
set_porperty IOSTANDARD LVCMOS18 [get_ports rst_n]
set_porperty IOSTANDARD LVCMOS18 [get_ports heating]
set_porperty IOSTANDARD LVCMOS18 [get_ports cooling
set_porperty IOSTANDARD LVCMOS18 [get_ports temperature_0]
set_porperty IOSTANDARD LVCMOS18 [get_ports temperature_1]
set_porperty IOSTANDARD LVCMOS18 [get_ports temperature_2]
set_porperty IOSTANDARD LVCMOS18 [get_ports temperature_3]
set_porperty IOSTANDARD LVCMOS18 [get_ports temperature_4]


