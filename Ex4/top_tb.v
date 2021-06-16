//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Dynamic LED lights
// Student Name: Thomas Long
// Date: 16/06/2021
//
// Description: A testbench module to test Ex4 - Dynamic LED lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
  parameter CLK_PERIOD = 10;

//Todo: Regitsers and wires
reg clk;
reg rst;
reg button;
wire colour;
reg err;

    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end

initial begin
	clk=0;
	rst=0;
	button=0;
	err=0;
	#6

forever begin #6
	$display("The program runs and it can print");
	
end
end

//Todo: Finish test, check for success
      initial begin
        #50 
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
      end

//Todo: Instantiate counter module
light top (
	.clk (clk),
	.rst (rst),
	.button (button),
	.on_off (on_off),
	.colour (colour)
    );
 
endmodule 


