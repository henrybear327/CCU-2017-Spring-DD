module top(
    btnc,
	 clk100mhz,
	 RGB1_Red,
	 RGB1_Green,
	 RGB1_Blue,
	 btnr,
	 btnl,
	 btnu,
	 btnd,
	 sw0,
	 sw1,
	 sw2,
	 sw3,
	 sw4,
	 sw5,
	 sw6,
	 sw7,
	 sw8,
	 sw9,
	 led0, 
	 led1, 
	 led2, 
    led3, 
	 led4, 
	 led5, 
	 led6, 
	 led7,
	 led8,
	 led9,
	 led10,
	 led11,
	 led12,
	 led13,
	 led14,
	 led15,
	 
	 a,
	 b,
	 c,
	 d,
	 e,
	 f,
	 g,
	 d0,
	 d1,
	 d2,
	 d3,
	 d4,
	 d5,
	 d6,
	 d7
	 );


	 reg [31:0] cnt; 
	 reg [31:0] cnt_7;
	 reg [31:0] cnt_color;
	 reg [7:0] scan;
	 reg [7:0] scan2;
	 reg [6:0] seg_number,seg_data;
	 reg  [3:0]state_7;
	 reg  [3:0] cul_state_7;
	 input clk100mhz;
	 input btnc;
	 input btnr;
	 input btnl;
	 input btnu;
	 input btnd;
	 output RGB1_Blue;
	 output RGB1_Green;
	 output RGB1_Red;
	 reg [3:0]state_color;
	 reg [2:0]stop;
	 reg flag;
	 reg [2:0] state;
	 reg [2:0] state1;
	 reg [2:0] state2;
	 reg [17:0] counter;
    reg [2:0] cul_state;	 
	 input sw0;
	 input sw1;
	 input sw2;
	 input sw3;
	 input sw4;
	 input sw5;
	 input sw6;
	 input sw7;
	 input sw8;
	 input sw9;
	 output led0; 
	 output led1; 
	 output led2; 
    output led3; 
	 output led4; 
	 output led5; 
	 output led6; 
	 output led7;
	 output led8;
	 output led9;
	 output led10;
	 output led11;
	 output led12;
	 output led13;
	 output led14;
	 output led15;
    output a;
	 output b;
	 output c;
	 output d;
	 output e;
	 output f;
	 output g;
	 output d0;
	 output d1;
	 output d2;
	 output d3;
	 output d4;
	 output d5;
	 output d6;
	 output d7;
	 
	 reg [7:0] offset;
clock instance_name
(// Clock in ports
.CLK_IN1(clk100mhz), // IN
// Clock out ports
.CLK_OUT1(CLK_OUT1), // OUT 10%
.CLK_OUT2(CLK_OUT2), // OUT 30%
.CLK_OUT3(CLK_OUT3), // OUT 25%
.CLK_OUT4(CLK_OUT4), // OUT 15% 
.CLK_OUT5(CLK_OUT5), // OUT 5%
.CLK_OUT6(CLK_OUT6), // OUT 20%

// Status and control signals
.RESET(rst)); // IN

always@ (posedge CLK_OUT3)
begin // change to continuous assignment
		if(btnc)
		begin
			state_color <= 4'd3;
			stop <= 0;
			flag <= 0;
		end

		else if(btnl)
			begin
			if(stop == 3'd0) begin
				stop <= 3'd1;
				if(state_color == 4'd0)
					state_color <= 4'd0;
				else
					state_color <= state_color - 4'd1;
			end
			end
		else if(btnr)	begin
			if(stop == 3'd0) begin
			stop <= 3'd1;
				if(state_color == 4'd6)
					state_color <= 4'd6;
				else
					state_color <= state_color + 4'd1;
				
			end
		end
		else begin
			stop <= 0;
		end
		
		if(btnu)
				flag<=0;
		if(btnd)
				flag<=1;
end




assign RGB1_Red = (state_color == 0 && flag == 0) ? CLK_OUT3 :
						(state_color == 1 && flag == 0) ? CLK_OUT5 :
						(state_color == 2 && flag == 0) ? CLK_OUT5 :
						(state_color == 3 && flag == 0) ? CLK_OUT2 :
						(state_color == 4 && flag == 0) ? CLK_OUT2 :
						(state_color == 5 && flag == 0) ? CLK_OUT2 :
						(state_color == 6 && flag == 0) ? CLK_OUT2 :
						(state_color == 0 && flag == 1) ? CLK_OUT4 :
						(state_color == 1 && flag == 1) ? CLK_OUT5 :
						(state_color == 2 && flag == 1) ? CLK_OUT5 :
						(state_color == 3 && flag == 1) ? CLK_OUT6 :
						(state_color == 4 && flag == 1) ? CLK_OUT6 :
						(state_color == 5 && flag == 1) ? CLK_OUT6 :
						(state_color == 6 && flag == 1) ? CLK_OUT6 :
						CLK_OUT5;
assign RGB1_Green = (state_color == 0 && flag == 0) ? CLK_OUT5 :
						(state_color == 1 && flag == 0) ? CLK_OUT5 :
						(state_color == 2 && flag == 0) ? CLK_OUT2 :
						(state_color == 3 && flag == 0) ? CLK_OUT2 :
						(state_color == 4 && flag == 0) ? CLK_OUT2 :
						(state_color == 5 && flag == 0) ? CLK_OUT4 :
						(state_color == 6 && flag == 0) ? CLK_OUT5 :
						(state_color == 0 && flag == 1) ? CLK_OUT5 :
						(state_color == 1 && flag == 1) ? CLK_OUT5 :
						(state_color == 2 && flag == 1) ? CLK_OUT6 :
						(state_color == 3 && flag == 1) ? CLK_OUT6 :
						(state_color == 4 && flag == 1) ? CLK_OUT6 :
						(state_color == 5 && flag == 1) ? CLK_OUT4 :
						(state_color == 6 && flag == 1) ? CLK_OUT5 :
						CLK_OUT5;
assign RGB1_Blue = (state_color == 0 && flag == 0) ? CLK_OUT2 :
						(state_color == 1 && flag == 0) ? CLK_OUT2 :
						(state_color == 2 && flag == 0) ? CLK_OUT5 :
						(state_color == 3 && flag == 0) ? CLK_OUT2 :
						(state_color == 4 && flag == 0) ? CLK_OUT5 :
						(state_color == 5 && flag == 0) ? CLK_OUT5 :
						(state_color == 6 && flag == 0) ? CLK_OUT5 :
						(state_color == 0 && flag == 1) ? CLK_OUT6 :
						(state_color == 1 && flag == 1) ? CLK_OUT6 :
						(state_color == 2 && flag == 1) ? CLK_OUT5 :
						(state_color == 3 && flag == 1) ? CLK_OUT6 :
						(state_color == 4 && flag == 1) ? CLK_OUT5 :
						(state_color == 5 && flag == 1) ? CLK_OUT5 :
						(state_color == 6 && flag == 1) ? CLK_OUT5 :
						CLK_OUT5;

always@ (posedge CLK_OUT3)
      begin 
		if(btnu)
			state1<=2'b0;
		if(btnd)
			state1<=2'b1;
	   if(btnl)
		state <= 2'b1;
	   if(btnr)
		state <= 2'b0;
		if(btnc)
		state <= 2'd2;
	end
	
	
always@ (posedge CLK_OUT3)
      begin 
		 if(rst)
		cnt<=32'd0;
		if(state == 1)
		begin
	     if(cnt>=32'd0 && cnt <= 32'd480000000)
	        cnt<=cnt+32'd1;
	   end
		else if(state == 0)
		begin
	     if(cnt>=32'd0 && cnt <= 32'd480000000)
	        cnt<=cnt-32'd1;
		end
	  if(cnt > 32'd480000000)
		 cnt<=32'd1;
	  else if(cnt == 32'd0)
	    cnt<=32'd480000000;
	end
always@(posedge CLK_OUT3) begin		
	if(btnc)
		cnt_7<=32'd0;
	if(state==0)
	begin
		if(state1==0&&cnt_7>=32'd0&&cnt_7<=32'd240000000)
			cnt_7<=cnt_7 - 32'd5;
		
		if(state1==1&&cnt_7>=32'd0&&cnt_7<=32'd240000000)
			cnt_7<=cnt_7 - 32'd1;
		else if(cnt_7>=32'd0&&cnt_7<=32'd240000000)
			cnt_7<=cnt_7 - 32'd3;
		end
	else if(state==1)
	begin
		if(state1==0&&cnt_7>=32'd0&&cnt_7<=32'd240000000)
			cnt_7<=cnt_7 + 32'd5;
		
		if(state1==1&&cnt_7>=32'd0&&cnt_7<=32'd240000000)
			cnt_7<=cnt_7+32'd1;
		else if(cnt_7>=32'd0&&cnt_7<=32'd240000000)
			cnt_7<=cnt_7+32'd3;
	end
	 if(cnt_7 > 32'd240000000)
		 cnt_7<=32'd15;
	 else if(cnt_7== 32'd0)
	    cnt_7<=32'd240000000;
	end
	


always@(posedge CLK_OUT3)
	begin
	if(cnt_7>=32'd0&&cnt_7<=32'd30000000&&state!=2)
		state_7<=7;
	else if(cnt_7>32'd30000000&&cnt_7<=32'd60000000&&state!=2)
		state_7<=6;
	else if(cnt_7>32'd60000000&&cnt_7<=32'd90000000&&state!=2)
		state_7<=5;
	else if(cnt_7>32'd90000000&&cnt_7<=32'd120000000&&state!=2)
		state_7<=4;
	else if(cnt_7>32'd120000000&&cnt_7<=32'd150000000&&state!=2)
		state_7<=3;
	else if(cnt_7>32'd150000000&&cnt_7<=32'd180000000&&state!=2)
		state_7<=2;
	else if(cnt_7>32'd180000000&&cnt_7<=32'd210000000&&state!=2)
		state_7<=1;
	else if(cnt_7>32'd210000000&&cnt_7<=32'd240000000&&state!=2)
		state_7<=0;
end



	

assign {d7,d6,d5,d4,d3,d2,d1,d0} = scan;
always@(posedge CLK_OUT3) begin
   if(state != 2)
	begin
	if(sw0)
	begin
	case(state_7)
	0:begin
	  seg_number <= 17;
	  scan <= 8'b0111_1111;
	end
	1:begin
	  seg_number <= 14;
	  scan <= 8'b1011_1111;
	end
	2:begin
	  seg_number <= 18;
	  scan <= 8'b1101_1111;
	end
	3:begin
	  seg_number <= 18;
	  scan <= 8'b1110_1111;
	end
	4:begin
	  seg_number <= 21;
	  scan <= 8'b1111_0111;
	end
	5:begin
	  seg_number <= 30;
	  scan <= 8'b1111_1011;
	end
	6:begin
	  seg_number <= 22;
	  scan <= 8'b1111_1101;
	end
	7:begin
	  seg_number <= 18;
	  scan <= 8'b1111_1110;
	end
	endcase
	end
	else if(sw1)
	begin
	case(state_7)
	0:begin
	  seg_number <= 13;
	  scan <= 8'b0111_1111;
	end
	1:begin
	  seg_number <= 14;
	  scan <= 8'b1011_1111;
	end
	2:begin
	  seg_number <= 10;
	  scan <= 8'b1101_1111;
	end
	3:begin
	  seg_number <= 13;
	  scan <= 8'b1110_1111;
	end
	4:begin
	  seg_number <= 11;
	  scan <= 8'b1111_0111;
	end
	5:begin
	  seg_number <= 14;
	  scan <= 8'b1111_1011;
	end
	6:begin
	  seg_number <= 14;
	  scan <= 8'b1111_1101;
	end
	7:begin
	  seg_number <= 15;
	  scan <= 8'b1111_1110;
   	end
	endcase
	end
	else if(sw2)
	begin
	case(state_7)
	0:begin
	  seg_number <= 13;
	  scan <= 8'b0111_1111;
	end
	1:begin
	  seg_number <= 14;
	  scan <= 8'b1011_1111;
	end
	2:begin
	  seg_number <= 15;
	  scan <= 8'b1101_1111;
	end
	3:begin
	  seg_number <= 10;
	  scan <= 8'b1110_1111;
	end
	4:begin
	  seg_number <= 12;
	  scan <= 8'b1111_0111;
	end
	5:begin
	  seg_number <= 14;
	  scan <= 8'b1111_1011;
	end
	6:begin
	  seg_number <= 30;
	  scan <= 8'b1111_1101;
	end
	7:begin
	  seg_number <= 30;
	  scan <= 8'b1111_1110;
   	end
	endcase
	end
	else if(sw3)
	begin
	case(state_7)
	0:begin
	  seg_number <= 12;
	  scan <= 8'b0111_1111;
	end
	1:begin
	  seg_number <= 12;
	  scan <= 8'b1011_1111;
	end
	2:begin
	  seg_number <= 27;
	  scan <= 8'b1101_1111;
	end
	3:begin
	  seg_number <= 30;
	  scan <= 8'b1110_1111;
	end
	4:begin
	  seg_number <= 12;
	  scan <= 8'b1111_0111;
	end
	5:begin
	  seg_number <= 12;
	  scan <= 8'b1111_1011;
	end
	6:begin
	  seg_number <= 27;
	  scan <= 8'b1111_1101;
	end
	7:begin
	  seg_number <= 30;
	  scan <= 8'b1111_1110;
   	end
	endcase
	end
	else if(sw4)
	begin
	case(state_7)
	0:begin
	  seg_number <= 12;
	  scan <= 8'b0111_1111;
	end
	1:begin
	  seg_number <= 21;
	  scan <= 8'b1011_1111;
	end
	2:begin
	  seg_number <= 15;
	  scan <= 8'b1101_1111;
	end
	3:begin
	  seg_number <= 14;
	  scan <= 8'b1110_1111;
	end
	4:begin
	  seg_number <= 30;
	  scan <= 8'b1111_0111;
	end
	5:begin
	  seg_number <= 30;
	  scan <= 8'b1111_1011;
	end
	6:begin
	  seg_number <= 30;
	  scan <= 8'b1111_1101;
	end
	7:begin
	  seg_number <= 30;
	  scan <= 8'b1111_1110;
   	end
	endcase
	end
	else if(sw5)
	begin
	case(state_7)
	0:begin
	  seg_number <= 11;
	  scan <= 8'b0111_1111;
	end
	1:begin
	  seg_number <= 14;
	  scan <= 8'b1011_1111;
	end
	2:begin
	  seg_number <= 14;
	  scan <= 8'b1101_1111;
	end
	3:begin
	  seg_number <= 22;
	  scan <= 8'b1110_1111;
	end
	4:begin
	  seg_number <= 11;
	  scan <= 8'b1111_0111;
	end
	5:begin
	  seg_number <= 14;
	  scan <= 8'b1111_1011;
	end
	6:begin
	  seg_number <= 14;
	  scan <= 8'b1111_1101;
	end
	7:begin
	  seg_number <= 22;
	  scan <= 8'b1111_1110;
   	end
	endcase
	end
	else if(sw6)
	begin
	case(state_7)
	0:begin
	  seg_number <= 25;
	  scan <= 8'b0111_1111;
	end
	1:begin
	  seg_number <= 17;
	  scan <= 8'b1011_1111;
	end
	2:begin
	  seg_number <= 14;
	  scan <= 8'b1101_1111;
	end
	3:begin
	  seg_number <= 14;
	  scan <= 8'b1110_1111;
	end
	4:begin
	  seg_number <= 22;
	  scan <= 8'b1111_0111;
	end
	5:begin
	  seg_number <= 30;
	  scan <= 8'b1111_1011;
	end
	6:begin
	  seg_number <= 30;
	  scan <= 8'b1111_1101;
	end
	7:begin
	  seg_number <= 30;
	  scan <= 8'b1111_1110;
   	end
	endcase
	end
	else if(sw7)
	begin
	case(state_7)
	0:begin
	  seg_number <= 20;
	  scan <= 8'b0111_1111;
	end
	1:begin
	  seg_number <= 21;
	  scan <= 8'b1011_1111;
	end
	2:begin
	  seg_number <= 21;
	  scan <= 8'b1101_1111;
	end
	3:begin
	  seg_number <= 26;
	  scan <= 8'b1110_1111;
	end
	4:begin
	  seg_number <= 20;
	  scan <= 8'b1111_0111;
	end
	5:begin
	  seg_number <= 21;
	  scan <= 8'b1111_1011;
	end
	6:begin
	  seg_number <= 21;
	  scan <= 8'b1111_1101;
	end
	7:begin
	  seg_number <= 26;
	  scan <= 8'b1111_1110;
   	end
	endcase
	end
	else if(sw8)
	begin
	case(state_7)
	0:begin
	  seg_number <= 20;
	  scan <= 8'b0111_1111;
	end
	1:begin
	  seg_number <= 27;
	  scan <= 8'b1011_1111;
	end
	2:begin
	  seg_number <= 26;
	  scan <= 8'b1101_1111;
	end
	3:begin
	  seg_number <= 25;
	  scan <= 8'b1110_1111;
	end
	4:begin
	  seg_number <= 17;
	  scan <= 8'b1111_0111;
	end
	5:begin
	  seg_number <= 14;
	  scan <= 8'b1111_1011;
	end
	6:begin
	  seg_number <= 19;
	  scan <= 8'b1111_1101;
	end
	7:begin
	  seg_number <= 19;
	  scan <= 8'b1111_1110;
   	end
	endcase
	end
	else if(sw9)
	begin
	case(state_7)
	0:begin
	  seg_number <= 1;
	  scan <= 8'b0111_1111;
	end
	1:begin
	  seg_number <= 9;
	  scan <= 8'b1011_1111;
	end
	2:begin
	  seg_number <= 7;
	  scan <= 8'b1101_1111;
	end
	3:begin
	  seg_number <= 6;
	  scan <= 8'b1110_1111;
	end
	4:begin
	  seg_number <= 0;
	  scan <= 8'b1111_0111;
	end
	5:begin
	  seg_number <= 3;
	  scan <= 8'b1111_1011;
	end
	6:begin
	  seg_number <= 1;
	  scan <= 8'b1111_1101;
	end
	7:begin
	  seg_number <= 9;
	  scan <= 8'b1111_1110;
   	end
	endcase
	end
	else
	 begin
	case(state_7)
	0:begin
	  seg_number <= 0;
	  scan <= 8'b0111_1111;
	end
	1:begin
	  seg_number <=0;
	  scan <= 8'b1011_1111;
	end
	2:begin
	  seg_number <= 0;
	  scan <= 8'b1101_1111;
	end
	3:begin
	  seg_number <= 0;
	  scan <= 8'b1110_1111;
	end
	4:begin
	  seg_number <= 0;
	  scan <= 8'b1111_0111;
	end
	5:begin
	  seg_number <= 0;
	  scan <= 8'b1111_1011;
	end
	6:begin
	  seg_number <= 0;
	  scan <= 8'b1111_1101;
	end
	7:begin
	  seg_number <= 0;
	  scan <= 8'b1111_1110;
	 end
	endcase
	end

  end
  else
	scan <= 8'b1111_1111;
end  

assign {g,f,e,d,c,b,a} = seg_data;
always@(posedge CLK_OUT3) begin  
  case(seg_number)
	16'd0:seg_data <= 7'b100_0000;
	16'd1:seg_data <= 7'b111_1001;
	16'd2:seg_data <= 7'b010_0100;
	16'd3:seg_data <= 7'b011_0000;
	16'd4:seg_data <= 7'b001_1001;
	16'd5:seg_data <= 7'b001_0010;
	16'd6:seg_data <= 7'b000_0010;
	16'd7:seg_data <= 7'b101_1000;
	16'd8:seg_data <= 7'b000_0000;
	16'd9:seg_data <= 7'b001_0000;
	10:seg_data <= 7'b0001000;
	11:seg_data <= 7'b0000011;
	12:seg_data <= 7'b0100111;
	13:seg_data <= 7'b0100001;
	14:seg_data <= 7'b0000110;
	15:seg_data <= 7'b0001110;
	16:seg_data <= 7'b1000010;
	17:seg_data <= 7'b0001001;
	18:seg_data <= 7'b1111001;
	19:seg_data <= 7'b1000111;
	20:seg_data <= 7'b0101011;
	21:seg_data <= 7'b1000000;
	22:seg_data <= 7'b0001100;
	23:seg_data <= 7'b0011000;
	24:seg_data <= 7'b0101111;
	25:seg_data <= 7'b0010010;
	26:seg_data <= 7'b1111000;
	27:seg_data <= 7'b1100011;
	28:seg_data <= 7'b0010001;
	29:seg_data <= 7'b0100100;
	
	default: seg_data <= 7'b1111111;
  endcase
end 



assign led0=(cnt>= 32'b0 && cnt <= 32'd30000000 && state != 2 )?1:0;
assign led1=(cnt>32'd30000000&&cnt<=32'd60000000 && state != 2)?1:0;
assign led2=(cnt>32'd60000000&&cnt<=32'd90000000 && state != 2)?1:0;
assign led3=(cnt>32'd90000000&&cnt<=32'd120000000 && state != 2)?1:0;
assign led4=(cnt>32'd120000000&&cnt<=32'd150000000 && state != 2)?1:0;
assign led5=(cnt>32'd150000000&&cnt<=32'd180000000 && state != 2)?1:0;
assign led6=(cnt>32'd180000000&&cnt<=32'd210000000 && state != 2)?1:0;
assign led7=(cnt>32'd210000000&&cnt<=32'd240000000 && state != 2)?1:0;
assign led8=(cnt>32'd240000000&&cnt<=32'd270000000 && state != 2)?1:0;
assign led9=(cnt>32'd270000000&&cnt<=32'd300000000 && state != 2)?1:0;
assign led10=(cnt>32'd300000000&&cnt<=32'd330000000 && state != 2)?1:0;
assign led11=(cnt>32'd330000000&&cnt<=32'd360000000 && state != 2)?1:0;
assign led12=(cnt>32'd360000000&&cnt<=32'd390000000 && state != 2)?1:0;
assign led13=(cnt>32'd390000000&&cnt<=32'd420000000 && state != 2)?1:0;
assign led14=(cnt>32'd420000000&&cnt<=32'd450000000 && state != 2)?1:0;
assign led15=(cnt>32'd450000000&&cnt<=32'd480000000 && state != 2)?1:0;

 
endmodule