//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 - Dynamic LED lights
// Student Name: Thomas Long
// Date: 16/06/2021
//
//  Description: In this exercise, you need to design a LED based lighting solution, 
//  following the diagram provided in the exercises documentation. The lights change 
//  as long as a button is pressed, and stay the same when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           colour [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module lights(
    //define inputs here
	input clk,
	input rst,
	input button,
	output [2:0] colour
    );

	reg [2:0] colour;

    //Todo: add user logic
	always @ (posedge clk or posedge rst) begin
		if(rst) begin
		colour = {000}		
		end

		if (colour == {000}) || (colour ==  {111}) || (colour == {001}) begin #10
			colour = {001};
		end

		if(button) begin
			if (colour = {001} begin #10
			colour = {010};
			end
			else if (colour = {010} begin #10			
			colour = {011};
			end
			else if (colour = {011} begin #10			
			colour = {100};
			end
			else if (colour = {100} begin #10			
			colour = {101};
			end
			else if (colour = {110} begin #10			
			colour = {011};
			end
			else if (colour = {110} begin #10			
			colour = {001};
			end
		end else begin
		colour = colour;
		end
	end
end module
	  
