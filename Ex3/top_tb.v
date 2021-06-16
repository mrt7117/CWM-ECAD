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
  parameter CLK_PERIOD = 10;

//Todo: Regitsers and wires
reg clk;
reg rst;
reg change;
reg on_off;
wire [7:0] counter_out;
reg [7:0] counter_out_prev;
reg err;

//Todo: Clock generation
    initial
    begin
       clk = 1'b0;
       forever begin
         #(CLK_PERIOD/2) clk=~clk;
     end
     end
	

//Todo: User logic
initial begin
	clk=0;
	rst=0;
	change=0;
	on_off=0;
	err=0;
	#CLK_PERIOD

forever begin
	$display("The program runs and it can print");
	#CLK_PERIOD	
	
	counter_out_prev = on_off? counter_out_prev + 1: counter_out_prev -1;
	
	if (counter_out_prev!= counter_out) begin
  		$display("***TEST FAILED! :( ***");
  		err=1;
  	end

	if (counter_out== 8'hf0) begin
    	on_off = ~on_off;
	end



end
end

//Todo: Finish test, check for success
      initial begin
        #500 
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
      end

//Todo: Instantiate counter module
monitor top (
	.clk (clk),
	.rst (rst),
	.change (change),
	.on_off (on_off),
	.counter_out (counter_out)
    );
 
endmodule 
