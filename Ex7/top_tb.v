//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Lights Selector
// Student Name: Thomas Long
// Date: 17/06/2021
//
// Description: A testbench module to test Ex7 - Lights Selector
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
	);
	
	parameter CLK_PERIOD = 10;

	reg clk;
	reg sel;
	reg rst;
	reg button;
	reg err;
	wire [23:0] light;
  	reg [23:0] light_prev;

	initial begin
		clk = 1'b0;
		forever
			#(CLK_PERIOD/2) clk=~clk;
	end


	initial begin
	err = 0;
	rst = 1;
	sel = 0;
	button = 0;
	light_prev = 24'd10;
	
		forever begin
        light_prev = light;
			#(CLK_PERIOD*5)
			
			if (light != 24'hffffff) begin
				$display("TEST FAILED. Should be white light when sel=1");
				err = 1;
			end

			rst = 0;
		    	sel = 1;
		    	button = 1;
		    	#(CLK_PERIOD*5)


			button = 1;
			#(CLK_PERIOD*5)
			if (light != 24'hffffff) begin
				$display("TEST FAILED");
				err = 1;
			end

			sel = 1;
			rst = 1;
			#(CLK_PERIOD*5)
			
			if (light!= 24'h0000FF) begin
				$display("TEST FAILED");
				err = 1;
			end
			

			rst = 0;
			button = 1;
			#(CLK_PERIOD*5)
			light_prev = light;

			if (light_prev != light) begin
				$display("TEST FAILED light_prev!=light");
				err = 1;

		
			end
			
			light_prev = light;

		end


			





		forever begin
			button = 1;
			#(CLK_PERIOD*10)

			if(light_prev == light)
				begin
				$display("TEST FAILED light_prev=light");
				err = 1;
			end

		end
	end



	initial begin
	  #140
	  if (err == 0)
		$display("***TEST PASSED! :) ***");
   	  $finish;
	end 	



//Todo: Instantiate counter module
	Lights_Selector top(
		.clk (clk),
		.rst(rst),
		.sel(sel),
		.button(button),
		.light(light)
		);
endmodule
