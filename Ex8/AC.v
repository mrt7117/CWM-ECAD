//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 - Air Conditioning
// Student Name: Thomas Long
// Date: 16/06/2021
//
//  Description: In this exercise, you need to an air conditioning control system
//  According to the state diagram provided in the exercise.
//
//  inputs:
//           clk, temperature [4:0]
//
//  outputs:
//           heating, cooling
//////////////////////////////////////////////////////////////////////////////////
// 18 = 10010
// 20 = 10100
// 22 = 10110

`timescale 1ns / 100ps

module AC(
    input clk,
    input [4:0] temperature,
    output heating,
    output cooling
    );

reg [1:0] state;
wire heating, cooling;

  assign heating = (state == 2'b10); 
  assign cooling = (state == 2'b01);
  assign idle = (state == 2'b00);


	always @ (posedge clk) begin
		if (state == 2'b00) begin //idle
			state <= (temperature <= 5'b10010) ? 2'b10: 2'b00;
			state <= (temperature >= 5'b10110) ? 2'b01: 2'b00;
		end

  		else if (state== 2'b01) begin		// cooling
       		state <= (temperature <= 5'b10100) ? 2'b00: 2'b01;
      	end

  		else if (temperature < 5'b10010) begin	// heating state
       		state <= (temperature >= 5'b10100) ? 2'b00: 2'b10;	//turn off heating if T>= 20
      	end

		else begin   			// forbidden state
		state= 2'b00;
		end
	end

endmodule

