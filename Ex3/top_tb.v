//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Active IoT Devices Monitor
// Student Name: Thomas Long
// Date: 15/06/2021
//
// Description: A testbench module to test Ex3 - Active IoT Devices Monitor
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
parameter

//Todo: Regitsers and wires
reg clk, rst, change, on_off, counter_out;

//Todo: Clock generation
initial begin
	clk=0;
	forever
		#(CLK_PERIOD/2) clk=~clk;
	end

//Todo: User logic
    
//Todo: Finish test, check for success
	always @ (rst) begin
	if (counter_out == 0)
	display("Reset working correctly")
	else
	display("Reset ERROR")
	end

//Todo: Instantiate counter module
 
endmodule 
