`timescale 1ns / 1ps

module Lab7_main(
	input [7:0] a, b,
	input rst, opa, ops, opm, clk,
	
	output [6:0] sledctl,
	output [7:0] spctl
	);

	reg signed [15:0] result;
	reg [1:0]op;
	
	ctl7seg ctl7seg1(.clk(clk), .a(a), .b(b), .result(result), .op(op), .sledctl(sledctl), .spctl(spctl));
	
	always@(posedge clk)
	begin
		// Write your design here
	end
endmodule
