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
reg [2:0] colour_prev;
wire [2:0] colour;
reg err;

    initial
    begin
       clk = 1'b0;
       forever begin
         #(CLK_PERIOD/2);
         clk=~clk;
     end
     end

initial begin
	err=0;
	clk=0;

	rst=1;
	button=0;

	#(CLK_PERIOD*10)
	rst=0;
	button=1;

	#(CLK_PERIOD*10)
	rst=0;
	button=1;

	#(CLK_PERIOD*10)
	rst=1;
	button=0;
	
		#(CLK_PERIOD>>1);
		forever begin
			colour_prev = colour;
			#CLK_PERIOD;
		end


forever begin #6
	$display("The program runs and it can print");
	
	if (rst) begin
		if (colour == {001}) begin
		$display("Reset function works");
		end 
		else begin
		err = err +1;
		$display("Reset ERROR");
		end
	end
	if (button) begin
		if (colour == colour_prev+3'b1) begin
		$display("Button function works");
		end else begin
		err = err +1;
		$display("Button ERROR");
	end
	
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
lights top (
	.clk (clk),
	.rst (rst),
	.button (button),
	.colour (colour)
    );
 
endmodule 


