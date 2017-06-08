`timescale 1ns / 1ps

module Lab7_main(
	input rst, clk,
	
	output [6:0] sledctl,
	output [7:0] spctl
	);

	reg [31:0] result;
	
	ctl7seg ctl7seg1(.clk(clk), .result(result), .sledctl(sledctl), .spctl(spctl));
	
	always@(posedge clk)
	begin
		// result = 8'd12345678; // -> this is NOT correct, Fuck You!! Wasted 2 hours on this.
		result = 12345678;
	end
endmodule
