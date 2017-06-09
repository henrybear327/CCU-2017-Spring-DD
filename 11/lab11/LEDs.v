`timescale 1ns / 1ps

module FFT_main(
    input clk, 
	 input rst,
	 
	 /*
	 output reg [15:0] led,
    output rfd,
    output busy,
    output dv,
    output done,
    output d0,
    output d1,
    output d2,
    output d3,
    output d4,
    output d5,
    output d6,	 	 
    output d7,
	 */
	 
	 output led0,
	 output led1,
	 output led2,
	 output led3,
	 output led4,
	 
	 output [6:0] sledctl,
	 output [7:0] spctl
	 
    );
	
reg [15:0] led;
reg [5:0] number;
reg [17:0] counter; 
reg [2:0] state;
reg [6:0] seg_number,seg_data;
reg [7:0] scan;

reg [31:0] result;

reg led0,led1,led2,led3,led4;
reg sw5,sw4,sw3,sw2,sw1,sw0;

wire signed [15:0] data_in [0:31];
reg signed [15:0] fft_in;
wire rfd,busy,edone,done,dv;
 
reg signed [31:0] re_temp,im_temp;
reg signed [32:0] sum,out_sum;
reg [4:0] data_cnt;
////////////////////////////////////////////
wire signed [21:0] xk_re,xk_im;
reg [4:0] out_index;
wire [4:0] xk_index,xn_index;
//////////////////////////////////////////////


// A 10010

assign data_in[0] = 16'h00FB;  
assign data_in[1] = 16'hFF03; 
assign data_in[2] = 16'h00FB;  
assign data_in[3] = 16'hFF03;
assign data_in[4] = 16'h00FB;  
assign data_in[5] = 16'hFF03; 
assign data_in[6] = 16'h00FB;  
assign data_in[7] = 16'hFF03; 
assign data_in[8] = 16'h00FB;  
assign data_in[9] = 16'hFF03; 
assign data_in[10] = 16'h00FB;  
assign data_in[11] = 16'hFF03; 
assign data_in[12] = 16'h00FB;  
assign data_in[13] = 16'hFF03; 
assign data_in[14] = 16'h00FB;  
assign data_in[15] = 16'hFF03; 
assign data_in[16] = 16'h00FB;  
assign data_in[17] = 16'hFF03;
assign data_in[18] = 16'h00FB;  
assign data_in[19] = 16'hFF03; 
assign data_in[20] = 16'h00FB;  
assign data_in[21] = 16'hFF03; 
assign data_in[22] = 16'h00FB;  
assign data_in[23] = 16'hFF03; 
assign data_in[24] = 16'h00FB;  
assign data_in[25] = 16'hFF03; 
assign data_in[26] = 16'h00FB;  
assign data_in[27] = 16'hFF03;
assign data_in[28] = 16'h00FB;  
assign data_in[29] = 16'hFF03; 
assign data_in[30] = 16'h00FB;  
assign data_in[31] = 16'hFF03;  



// B 01010
/*
assign data_in[0] = 16'h00FB; 
assign data_in[1] = 16'h0009; 
assign data_in[2] = 16'hFF03; 
assign data_in[3] = 16'h0028; 
assign data_in[4] = 16'h00FB; 
assign data_in[5] = 16'h0009; 
assign data_in[6] = 16'hFF03; 
assign data_in[7] = 16'h0028; 
assign data_in[8] = 16'h00FB; 
assign data_in[9] = 16'h0009; 
assign data_in[10] = 16'hFF03; 
assign data_in[11] = 16'h0028; 
assign data_in[12] = 16'h00FB; 
assign data_in[13] = 16'h0009; 
assign data_in[14] = 16'hFF03; 
assign data_in[15] = 16'h0028; 
assign data_in[16] = 16'h00FB; 
assign data_in[17] = 16'h0009; 
assign data_in[18] = 16'hFF03; 
assign data_in[19] = 16'h0028; 
assign data_in[20] = 16'h00FB; 
assign data_in[21] = 16'h0009; 
assign data_in[22] = 16'hFF03; 
assign data_in[23] = 16'h0028; 
assign data_in[24] = 16'h00FB; 
assign data_in[25] = 16'h0009; 
assign data_in[26] = 16'hFF03; 
assign data_in[27] = 16'h0028; 
assign data_in[28] = 16'h00FB; 
assign data_in[29] = 16'h0009; 
assign data_in[30] = 16'hFF03; 
assign data_in[31] = 16'h0028; 
*/

/*
// C 00110

assign data_in[0] = 16'h00FB; 
assign data_in[1] = 16'h00C2; 
assign data_in[2] = 16'h0009; 
assign data_in[3] = 16'hFF4B; 
assign data_in[4] = 16'hFF03; 
assign data_in[5] = 16'hFF62;
assign data_in[6] = 16'h0028;
assign data_in[7] = 16'h00D5;
assign data_in[8] = 16'h00FB; 
assign data_in[9] = 16'h00C2; 
assign data_in[10] = 16'h0009; 
assign data_in[11] = 16'hFF4B; 
assign data_in[12] = 16'hFF03; 
assign data_in[13] = 16'hFF62;
assign data_in[14] = 16'h0028;
assign data_in[15] = 16'h00D5;
assign data_in[16] = 16'h00FB; 
assign data_in[17] = 16'h00C2; 
assign data_in[18] = 16'h0009; 
assign data_in[19] = 16'hFF4B; 
assign data_in[20] = 16'hFF03; 
assign data_in[21] = 16'hFF62;
assign data_in[22] = 16'h0028;
assign data_in[23] = 16'h00D5;
assign data_in[24] = 16'h00FB; 
assign data_in[25] = 16'h00C2; 
assign data_in[26] = 16'h0009; 
assign data_in[27] = 16'hFF4B; 
assign data_in[28] = 16'hFF03; 
assign data_in[29] = 16'hFF62;
assign data_in[30] = 16'h0028;
assign data_in[31] = 16'h00D5;
*/

/*
// D 00100

assign data_in[0] = 16'h00FB; 
assign data_in[1] = 16'h00F4; 
assign data_in[2] = 16'h00C2; 
assign data_in[3] = 16'h006F; 
assign data_in[4] = 16'h0009; 
assign data_in[5] = 16'hFFA2; 
assign data_in[6] = 16'hFF4B; 
assign data_in[7] = 16'hFF12; 
assign data_in[8] = 16'hFF03; 
assign data_in[9] = 16'hFF1F; 
assign data_in[10] = 16'hFF62;
assign data_in[11] = 16'hFFC0;
assign data_in[12] = 16'h0028;
assign data_in[13] = 16'h008A;
assign data_in[14] = 16'h00D5;
assign data_in[15] = 16'h00FA;
assign data_in[16] = 16'h00FB; 
assign data_in[17] = 16'h00F4; 
assign data_in[18] = 16'h00C2; 
assign data_in[19] = 16'h006F; 
assign data_in[20] = 16'h0009; 
assign data_in[21] = 16'hFFA2; 
assign data_in[22] = 16'hFF4B; 
assign data_in[23] = 16'hFF12; 
assign data_in[24] = 16'hFF03; 
assign data_in[25] = 16'hFF1F; 
assign data_in[26] = 16'hFF62;
assign data_in[27] = 16'hFFC0;
assign data_in[28] = 16'h0028;
assign data_in[29] = 16'h008A;
assign data_in[30] = 16'h00D5;
assign data_in[31] = 16'h00FA;
*/

fft fft(
  .clk(clk), // input clk
  .ce(1'b1), // input ce
  .start(1'b1), // input start
  .unload(1'b1), // input unload
  .xn_re(fft_in), // input [15 : 0] xn_re
  .xn_im(16'b0), // input [15 : 0] xn_im
  .fwd_inv(1'b1), // input fwd_inv
  .fwd_inv_we(1'b1), // input fwd_inv_we
  .rfd(rfd), // output rfd
  .xn_index(xn_index), // output [3 : 0] xn_index
  .busy(busy), // output busy
  .edone(edone), // output edone
  .done(done), // output done
  .dv(dv), // output dv
  .xk_index(xk_index), // output [3 : 0] xk_index
  .xk_re(xk_re), // output [20 : 0] xk_re
  .xk_im(xk_im) // output [20 : 0] xk_im
);
/*
assign  a = rfd; 
assign  b = busy;
assign  c = dv;
assign  d = done;
*/
 
assign {d7,d6,d5,d4,d3,d2,d1,d0} = xk_im;
always@(posedge clk)begin
	if(rst) begin
		 out_sum <= 0; 
		 out_index <= 0;
		 led  <= 0;
		 re_temp <=0;
		 im_temp <=0;
		 sum <=0;
   end
   else begin
///////////////////////////////////////////////	
		re_temp <= (xk_re*xk_re)>>12;
		im_temp <= (xk_im*xk_im)>>12; 
		sum <= re_temp + im_temp;	
		
///////////////////////////////////////////////
	   if(dv) begin	
			out_sum <= out_sum>sum ? out_sum : sum;
			out_index <= out_sum<sum ? xk_index : out_index;		
		end
		else begin
			out_sum  <= 0 ;
			out_index <= 0;		
		end
		//led <= xk_re; 
		led[10:6] <=xn_index;
		led[4:0] <=out_index;
		led[15:11] <=xk_index;
		//led[3:0] <= data_cnt;
		//led[15:8] <= xn_index;
		
		
		
	end
end

always@(negedge dv)	 
begin
/*
	led0 <= out_index[0];
	led1 <= out_index[1];
	led2 <= out_index[2];
	led3 <= out_index[3];
	led4 <= out_index[4];
*/

	{led4,led3,led2,led1,led0} <= out_index;
	result <= 100 * out_index[4:0] / 32;
end

ctl7seg ctl7seg1(.clk(clk), .result(result), .sledctl(sledctl), .spctl(spctl));

//wtite down your code here
always@(posedge clk)begin
  sw0 <= 1'd0;
  sw1 <= 1'd0;
  sw2 <= 1'd0;
  sw3 <= 1'd0;
  sw4 <= 1'd0;
  sw5 <= 1'd0;
  number <= {sw5,sw4,sw3,sw2,sw1,sw0};
end

always@(posedge clk)begin
  if(rst) begin
		  
  end
  else begin
		if(rfd) begin
			data_cnt <= data_cnt + 1;
			fft_in <= data_in[data_cnt];
		end
		else begin
			data_cnt <= 0;
			fft_in   <= 0;
		end
		
  end
end


//8顆7-segment顯示 
//assign {d7,d6,d5,d4,d3,d2,d1,d0} = scan;
always@(posedge clk) begin
   counter <=(counter<=100000) ? (counter +1) : 0;
   state <= (counter==100000) ? (state + 1) : state;
   case(state)
	7:begin	  
	  scan <= 8'b0111_1111;
	end
	6:begin
	  scan <= 8'b1011_1111;
	end
	5:begin
	  scan <= 8'b1101_1111;
	end
	4:begin
	  scan <= 8'b1110_1111;
	end
	3:begin
	  scan <= 8'b1111_0111;
	end
	2:begin
	  scan <= 8'b1111_1011;
	end
	1:begin
	  seg_number <= number/10;
	  scan <= 8'b1111_1101;
	end
	0:begin
	  seg_number <= number%10;
	  scan <= 8'b1111_1110;
	end
	default: state <= state;
  endcase  
end  

//7-segment 輸出數字解碼
//assign {g,f,e,d,c,b,a} = seg_data; 
//assign {g,f,e,d} = 0; 
always@(posedge clk) begin  
  case(seg_number)
	16'd0:seg_data <= 7'b100_0000;
	16'd1:seg_data <= 7'b111_1001;
	16'd2:seg_data <= 7'b010_0100;
	16'd3:seg_data <= 7'b011_0000;
	16'd4:seg_data <= 7'b001_1001;
	16'd5:seg_data <= 7'b001_0010;
	16'd6:seg_data <= 7'b000_0010;
	16'd7:seg_data <= 7'b111_1000;
	16'd8:seg_data <= 7'b000_0000;
	16'd9:seg_data <= 7'b001_1000;
	default: seg_number <= seg_number;
  endcase
end 
endmodule

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
	
	always@(posedge clk)
	begin
		case (count)
			12'b111111111111 : begin
				count <= 12'b0;
			end
			
			default : 
			count <= count + 1;
		endcase
	end
	
	// set digit 
	always@(posedge clk)
	begin
			case (count[11:9])
			3'b000 : tmpin = result % 10;
			3'b001 : tmpin = result / 10 % 10;
			3'b010 : tmpin = result / 100 % 10;
			3'b011 : tmpin = result / 1000 % 10;
			3'b100 : tmpin = result / 10000 % 10;
			3'b101 : tmpin = result / 100000 % 10;
			3'b110 : tmpin = result / 1000000 % 10;
			3'b111 : tmpin = result / 10000000 % 10;
			
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