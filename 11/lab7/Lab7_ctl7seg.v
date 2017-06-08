`timescale 1ns / 1ps

module ctl7seg(
	input clk,
	input [31:0] result,
	
	output [7:0] spctl,
	output [6:0] sledctl
	);
	
	reg [7:0] spctl;
	reg [6:0] sledctl;
	reg [11:0] count;
	reg [3:0] tmpin;
	
	reg [31:0] number;
	
	always@(posedge clk)
	begin
		case (count)
			12'b111111111111 : begin
				count <= 12'b0;
				number <= number + 1;
			end
			
			default : 
			count <= count + 1;
		endcase
	end
	
	// set digit 
	always@(posedge clk)
	begin
			case (count[11:9])
			/*
			3'b000 : tmpin = result % 10;
			3'b001 : tmpin = result / 10 % 10;
			3'b010 : tmpin = result / 100 % 10;
			3'b011 : tmpin = result / 1000 % 10;
			3'b100 : tmpin = result / 10000 % 10;
			3'b101 : tmpin = result / 100000 % 10;
			3'b110 : tmpin = result / 1000000 % 10;
			3'b111 : tmpin = result / 10000000 % 10;
			*/
			3'b000 : tmpin = number % 10;
			3'b001 : tmpin = number / 10 % 10;
			3'b010 : tmpin = number / 100 % 10;
			3'b011 : tmpin = number / 1000 % 10;
			3'b100 : tmpin = number / 10000 % 10;
			3'b101 : tmpin = number / 100000 % 10;
			3'b110 : tmpin = number / 1000000 % 10;
			3'b111 : tmpin = number / 10000000 % 10;
			
			default : tmpin = 4'b1111;
			endcase
	end
	
	//configure the digit lighting for a 7-segment display
	always@(posedge clk)
		begin
			case(tmpin)
			0 : sledctl <= 7'b1000000;
			1 : sledctl <= 7'b1111001;
			2 : sledctl <= 7'b0100100;
			3 : sledctl <= 7'b0110000;
			4 : sledctl <= 7'b0011001;
			5 : sledctl <= 7'b0010010;
			6 : sledctl <= 7'b0000010;
			7 : sledctl <= 7'b1111000;
			8 : sledctl <= 7'b0000000;
			9 : sledctl <= 7'b0010000;
			default : sledctl <= 7'b1111111;
		endcase
		
		// Place the digits one by one onto the 7-segment display
		case(count[11:9])
			3'b000 : spctl <= 8'b11111110;
			3'b001 : spctl <= 8'b11111101;
			3'b010 : spctl <= 8'b11111011;
			3'b011 : spctl <= 8'b11110111;
			3'b100 : spctl <= 8'b11101111;
			3'b101 : spctl <= 8'b11011111;
			3'b110 : spctl <= 8'b10111111;
			3'b111 : spctl <= 8'b01111111;
			default : spctl <= 8'b11111111;
		endcase
	end
endmodule
