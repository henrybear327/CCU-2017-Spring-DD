
module cla_16bit( a , b , cin , s , cout);

	input [15:0] a, b;
	input cin;
	output [15:0] s;
	output cout;

	wire [15:0] g;
	wire [15:0] p;
	wire [15:0] c;
	wire [3:0] gG ,gP;
	wire [3:0] c_4_8_12;
	//write your design below

	gp_generator cla16_pg(.a(a), .b(b), .p(p), .g(g));

	carry_generator carry_gen_1(.p(p[3:0]) , .g(g[3:0]) , .cin(cin) , .c(c[3:0]) , .gG(gG[0]), .gP(gP[0]));
	carry_generator carry_gen_2(.p(p[7:4]) , .g(g[7:4]) , .cin(c_4_8_12[1]) , .c(c[7:4]) , .gG(gG[1]), .gP(gP[1]));
	carry_generator carry_gen_3(.p(p[11:8]) , .g(g[11:8]) , .cin(c_4_8_12[2]) , .c(c[11:8]) , .gG(gG[2]), .gP(gP[2]));
	carry_generator carry_gen_4(.p(p[15:12]) , .g(g[15:12]) , .cin(c_4_8_12[3]) , .c(c[15:12]) , .gG(gG[3]), .gP(gP[3]));
	carry_generator carry_gen_5(.p(gP) , .g(gG) , .cin(cin) , .c(c_4_8_12) , .cout(cout));

	sum_generator cla16_sum(.a(a), .b(b), .c(c), .s(s));

endmodule


//產生所需的小p小g
module gp_generator(a, b, p, g );
     input [15:0] a,b;
	 output [15:0] p,g;

	 assign g[0] = a[0] & b[0];
	 assign p[0] = a[0] | b[0];

	 assign g[1] = a[1] & b[1];
	 assign p[1] = a[1] | b[1];

	 assign g[2] = a[2] & b[2];
	 assign p[2] = a[2] | b[2];

	 assign g[3] = a[3] & b[3];
	 assign p[3] = a[3] | b[3];

	 assign g[4] = a[4] & b[4];
	 assign p[4] = a[4] | b[4];

	 assign g[5] = a[5] & b[5];
	 assign p[5] = a[5] | b[5];

	 assign g[6] = a[6] & b[6];
	 assign p[6] = a[6] | b[6];

	 assign g[7] = a[7] & b[7];
	 assign p[7] = a[7] | b[7];

	 assign g[8] = a[8] & b[8];
	 assign p[8] = a[8] | b[8];

	 assign g[9] = a[9] & b[9];
	 assign p[9] = a[9] | b[9];

	 assign g[10] = a[10] & b[10];
	 assign p[10] = a[10] | b[10];

	 assign g[11] = a[11] & b[11];
	 assign p[11] = a[11] | b[11];

	 assign g[12] = a[12] & b[12];
	 assign p[12] = a[12] | b[12];

	 assign g[13] = a[13] & b[13];
	 assign p[13] = a[13] | b[13];

	 assign g[14] = a[14] & b[14];
	 assign p[14] = a[14] | b[14];

	 assign g[15] = a[15] & b[15];
	 assign p[15] = a[15] | b[15];

endmodule

//產生所需的carry in 跟 大G大P
module carry_generator( p , g , cin , c ,gG ,gP ,cout);

	input [3:0] p, g;
	input cin;
	output [3:0] c;
	output gG, gP;
	output cout;

	assign gG = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]);//G[3:0]
	assign gP = p[3] & p[2] & p[1] & p[0];//P[3:0]

	assign c[0] = cin;
	assign c[1] = g[0] | (p[0] & cin);
	assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);
	assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin);
	assign cout = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & cin);

endmodule

//求得最後結果
module sum_generator(a, b, c, s );

     input [15:0] a,b,c;
	 output [15:0] s;

	 assign s[0] = a[0] ^ b[0] ^ c[0];
	 assign s[1] = a[1] ^ b[1] ^ c[1];
	 assign s[2] = a[2] ^ b[2] ^ c[2];
	 assign s[3] = a[3] ^ b[3] ^ c[3];
	 assign s[4] = a[4] ^ b[4] ^ c[4];
	 assign s[5] = a[5] ^ b[5] ^ c[5];
	 assign s[6] = a[6] ^ b[6] ^ c[6];
	 assign s[7] = a[7] ^ b[7] ^ c[7];
	 assign s[8] = a[8] ^ b[8] ^ c[8];
	 assign s[9] = a[9] ^ b[9] ^ c[9];
	 assign s[10] = a[10] ^ b[10] ^ c[10];
	 assign s[11] = a[11] ^ b[11] ^ c[11];
	 assign s[12] = a[12] ^ b[12] ^ c[12];
	 assign s[13] = a[13] ^ b[13] ^ c[13];
	 assign s[14] = a[14] ^ b[14] ^ c[14];
	 assign s[15] = a[15] ^ b[15] ^ c[15];

endmodule
