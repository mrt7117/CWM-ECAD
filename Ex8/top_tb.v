//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #8  - Simple End-to-End Design
// Student Name: Thomas Long
// Date: 18/06/2021
//
// Description: A testbench module to test Ex8
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
	parameter CLK_PERIOD = 10;
 	
//Todo: Regitsers and wires
	reg clk_p;
	reg rst_n;
	reg [4:0] temperature;
	reg [2:0] colour;

	wire heating;
	wire cooling;
	wire clk_n;
	
//Todo: Clock generation
	initial begin
		clk_n = 1'b0;
   		clk_p = 1'b1;

		forever
		      #(CLK_PERIOD/2) clk=~clk;
	
		end
	end


//logic

initial begin
    err = 0;
    temperature = 5'b01111;
    rst_n = 0;

	forever begin

		#(CLK_PERIOD*5)
		if(temp<18 && heating ==0)
			begin
			$display("TEST FAILED. Heating error");
			err = 1;
			end

		if(temp>22 && cooling ==0)
			begin
			$display("TEST FAILED. Cooling error");
			err = 1;
			end

		if(cooling==1 && heating ==1)
			begin
			$display("TEST FAILED. Invalid state");
			err = 1;
			end

		forever begin
			#CLK_PERIOD;
			temperature = temperature + 5'b1;
			if (temperature == 5'b11110) begin
				temperature = 5'b10011;
			end
		end
end

//Todo: Finish test, check for success
	initial begin
	  #500
	  if (err == 0)
		$display("***TEST PASSED! :) ***");
   	  $finish;
	end 	

//Todo: Instantiate counter module
	AC top(
		.clk_p (clk_p),
		.clk_n (clk_n),
		.rst_n (rst_n),
		.temperature_0(temp[0]),
		.temperature_1(temp[1]),
		.temperature_2(temp[2]),
		.temperature_3(temp[3]),
		.temperature_4(temp[4]),
		.heating (heating),
		.cooling (cooling)
		);
endmodule
