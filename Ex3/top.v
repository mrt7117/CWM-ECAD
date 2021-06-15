//////////////////////////////////////////////////////////////////////////////////
// Exercise #3 - Active IoT Devices Monitor
// Student Name: Thomas Long
// Date: 15/06/2021
//
//  Description: In this exercise, you need to design a counter of active IoT devices, where 
//  if the rst=1, the counter should be set to zero. If event=0, the value
//  should stay constant. If on-off=1, the counter should count up every
//  clock cycle, otherwise it should count down.
//  Wrap-around values are allowed.
//
//  inputs:
//           clk, rst, change, on_off
//
//  outputs:
//           counter_out[7:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module monitor (
    //Todo: add ports 
	input clk,
	input rst,
	input change,
	input on_off,
	output [7:0] counter_out
    );
                    
    //Todo: add registers and wires, if needed
	reg [7:0] counter;

    //Todo: add user logic
	always @ (posedge clk or posedge rst)
		if(rst)
		 clk<=0;
		else
		 clk<=clk+1;


	always @ (posedge change)
		if(on_off ==1)
		counter = counter[+1];
		else 
		counter = counter[-1];
	  
endmodule
