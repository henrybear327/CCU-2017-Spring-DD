`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:53:16 05/30/2016 
// Design Name: 
// Module Name:    tri_led 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module tri_led(
	 clk100mhz,
	 rst,
	 RGB1_Red,
	 RGB1_Green,
	 RGB1_Blue,
);


input clk100mhz;
input rst;
output RGB1_Red;
output RGB1_Green;
output RGB1_Blue;
reg [31:0] cnt;   
reg [9:0] count_div;
reg [3:0] second;

reg [9:0] red;
reg [9:0] blue;
reg [9:0] green;

reg        Red_OUT1;
reg        Green_OUT2;
reg        Blue_OUT3;

always@(posedge clk100mhz)begin
	if(rst) begin
		cnt <= 32'd0; 
		second <= 4'd0;
	end else if (cnt >= 32'd0 && cnt <= 32'd100000000)
		cnt <= cnt + 32'd1;
	else begin
		cnt <= 32'd0;
		if (second >= 4'd0 && second <= 4'd5)
			second <= second + 4'd1;
		else
			second <= 4'd0;
	end
end

always@(posedge clk100mhz )	
begin
	if(rst)
		count_div <= 9'd0;
	else begin
		count_div <= (count_div<=510) ? count_div + 9'd1 : 9'd0;
		Red_OUT1 <= (count_div<=red) ? 1 : 0;
      Green_OUT2 <= (count_div<=green) ? 1 : 0;
      Blue_OUT3 <= (count_div<=blue) ? 1 : 0;
	end
end

always@(clk100mhz) begin
	case(second)
		4'd0:begin
			red <= 9'd255;
			green <= 9'd0;
			blue <= 9'd0;
		end
		4'd1:begin
			red <= 9'd255;
			green <= 9'd128;
			blue <= 9'd0;
		end
 		4'd2:  begin
			red <= 9'd255;
			green <= 9'd255;
			blue <= 9'd0;
		end
        4'd3:  begin
            red <= 9'd0;
            green <= 9'd255;
            blue <= 9'd0;
        end
        4'd4:  begin
            red <= 9'd0;
            green <= 9'd0;
            blue <= 9'd255;
        end
        4'd5:  begin
            red <= 9'd102;
            green <= 9'd0;
            blue <= 9'd255;
        end
        4'd6:  begin
            red <= 9'd128;
            green <= 9'd0;
            blue <= 9'd128;
        end
	endcase
end

assign RGB1_Red = (second == 4'd0) ? Red_OUT1 : (second == 4'd1)? Red_OUT1 : Red_OUT1;
assign RGB1_Green = (second == 4'd0) ? Green_OUT2 : (second == 4'd1)? Green_OUT2 : Green_OUT2;
assign RGB1_Blue = (second == 4'd0) ? Blue_OUT3 : (second == 4'd1)? Blue_OUT3 : Blue_OUT3;   


endmodule
