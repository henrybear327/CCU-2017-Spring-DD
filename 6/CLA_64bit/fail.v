module cla_64bit( a, b, cin, sum, cout);

	input [63:0] a, b;
	input cin;
	output [63:0] sum;
	output cout;


	wire [15:0] c_4_8_12;

    wire [63:0] p, g, s;
    wire [63:0] c;
	wire [4:0] c16;
	wire [15:0] gG ,gP;
	wire [3:0] g_G_16, g_P_16;
	//write your design below

    gp_generator cla4_pg1(.a(a[3:0]), .b(b[3:0]), .p(p[3:0]), .g(g[3:0]));
	gp_generator cla4_pg2(.a(a[7:4]), .b(b[7:4]), .p(p[7:4]), .g(g[7:4]));
	gp_generator cla4_pg3(.a(a[11:8]), .b(b[11:8]), .p(p[11:8]), .g(g[11:8]));
	gp_generator cla4_pg4(.a(a[15:12]), .b(b[15:12]), .p(p[15:12]), .g(g[15:12]));

    gp_generator cla4_pg5(.a(a[19:16]), .b(b[19:16]), .p(p[19:16]), .g(g[19:16]));
	gp_generator cla4_pg6(.a(a[23:20]), .b(b[23:20]), .p(p[23:20]), .g(g[23:20]));
	gp_generator cla4_pg7(.a(a[27:24]), .b(b[27:24]), .p(p[27:24]), .g(g[27:24]));
	gp_generator cla4_pg8(.a(a[31:28]), .b(b[31:28]), .p(p[31:28]), .g(g[31:28]));

    gp_generator cla4_pg9(.a(a[35:32]), .b(b[35:32]), .p(p[35:32]), .g(g[35:32]));
	gp_generator cla4_pg10(.a(a[39:36]), .b(b[39:36]), .p(p[39:36]), .g(g[39:36]));
	gp_generator cla4_pg11(.a(a[43:40]), .b(b[43:40]), .p(p[43:40]), .g(g[43:40]));
	gp_generator cla4_pg12(.a(a[47:44]), .b(b[47:44]), .p(p[47:44]), .g(g[47:44]));

    gp_generator cla4_pg13(.a(a[51:48]), .b(b[51:48]), .p(p[51:48]), .g(g[51:48]));
	gp_generator cla4_pg14(.a(a[55:52]), .b(b[55:52]), .p(p[55:52]), .g(g[55:52]));
	gp_generator cla4_pg15(.a(a[59:56]), .b(b[59:56]), .p(p[59:56]), .g(g[59:56]));
	gp_generator cla4_pg16(.a(a[63:60]), .b(b[63:60]), .p(p[63:60]), .g(g[63:60]));

	carry_generator carry_gen_1(.p(p[3:0]) , .g(g[3:0]) , .cin(cin) , .c(c[3:0]) , .gG(gG[0]), .gP(gP[0]));
	carry_generator carry_gen_2(.p(p[7:4]) , .g(g[7:4]) , .cin(c_4_8_12[1]) , .c(c[7:4]) , .gG(gG[1]), .gP(gP[1]));
	carry_generator carry_gen_3(.p(p[11:8]) , .g(g[11:8]) , .cin(c_4_8_12[2]) , .c(c[11:8]) , .gG(gG[2]), .gP(gP[2]));
	carry_generator carry_gen_4(.p(p[15:12]) , .g(g[15:12]) , .cin(c_4_8_12[3]) , .c(c[15:12]) , .gG(gG[3]), .gP(gP[3]));

    carry_generator carry_gen_5(.p(p[19:16]), .g(g[19:16]) , .cin(c_4_8_12[4]) , .c(c[19:16]) , .gG(gG[4]), .gP(gP[4]));
	carry_generator carry_gen_6(.p(p[23:20]), .g(g[23:20]) , .cin(c_4_8_12[5]) , .c(c[23:20]) , .gG(gG[5]), .gP(gP[5]));
	carry_generator carry_gen_7(.p(p[27:24]), .g(g[27:24]) , .cin(c_4_8_12[6]) , .c(c[27:24]) , .gG(gG[6]), .gP(gP[6]));
	carry_generator carry_gen_8(.p(p[31:28]), .g(g[31:28]) , .cin(c_4_8_12[7]) , .c(c[31:28]) , .gG(gG[7]), .gP(gP[7]));

    carry_generator carry_gen_9(.p(p[35:32]), .g(g[35:32])  , .cin(c_4_8_12[8]) , .c(c[35:32]) , .gG(gG[8]), .gP(gP[8]));
    carry_generator carry_gen_10(.p(p[39:36]), .g(g[39:36]) , .cin(c_4_8_12[9]) , .c(c[39:36]) , .gG(gG[9]), .gP(gP[9]));
    carry_generator carry_gen_11(.p(p[43:40]), .g(g[43:40]) , .cin(c_4_8_12[10]) , .c(c[43:40]) , .gG(gG[10]), .gP(gP[10]));
    carry_generator carry_gen_12(.p(p[47:44]), .g(g[47:44]) , .cin(c_4_8_12[11]) , .c(c[47:44]) , .gG(gG[11]), .gP(gP[11]));

    carry_generator carry_gen_13(.p(p[51:48]), .g(g[51:48]) , .cin(c_4_8_12[12]) , .c(c[51:48]) , .gG(gG[12]), .gP(gP[12]));
    carry_generator carry_gen_14(.p(p[55:52]), .g(g[55:52]) , .cin(c_4_8_12[13]) , .c(c[55:52]) , .gG(gG[13]), .gP(gP[13]));
    carry_generator carry_gen_15(.p(p[59:56]), .g(g[59:56]) , .cin(c_4_8_12[14]) , .c(c[59:56]) , .gG(gG[14]), .gP(gP[14]));
    carry_generator carry_gen_16(.p(p[63:60]), .g(g[63:60]) , .cin(c_4_8_12[15]) , .c(c[63:60]) , .gG(gG[15]), .gP(gP[15]));

    carry_generator carry_gen_17(gP[3:0] , gG[3:0]     ,  , , g_G_16[0], g_P_16[0], );
    carry_generator carry_gen_18(gP[7:4] , gG[7:4]     ,  , , g_G_16[1], g_P_16[1], );
    carry_generator carry_gen_19(gP[11:8] , gG[11:8]   ,  , , g_G_16[2], g_P_16[2], );
    carry_generator carry_gen_20(gP[15:12] , gG[15:12] ,  , , g_G_16[3], g_P_16[3], );

    carry_generator carry_gen_21(g_P_16[3:0] , g_G_16[3:0] , cin , c16[3:0] , , , cout);

    carry_generator carry_gen_22(gP[3:0]   , gG[3:0]   , c16[0] , c[3:0]  , , ,  );
    carry_generator carry_gen_23(gP[7:4]   , gG[7:4]   , c16[1] , c[7:4]  , , , );
    carry_generator carry_gen_24(gP[11:8]  , gG[11:8]  , c16[2] , c[11:8] , , , );
    carry_generator carry_gen_25(gP[15:12] , gG[15:12] , c16[3] , c[15:12], , , );


    /*
	sum_generator cla4_sum1(a[3:0], b[3:0], c[3:0], s[3:0]);
	sum_generator cla4_sum2(a[7:4], b[7:4], c[7:4], s[7:4]);
	sum_generator cla4_sum3(a[11:8], b[11:8], c[11:8], s[11:8]);
	sum_generator cla4_sum4(a[15:12], b[15:12], c[15:12], s[15:12]);

    sum_generator cla4_sum5(a[19:16], b[19:16], c[19:16], s[19:16]);
    sum_generator cla4_sum6(a[23:20], b[23:20], c[23:20], s[23:20]);
    sum_generator cla4_sum7(a[27:24], b[27:24], c[27:24], s[27:24]);
    sum_generator cla4_sum8(a[31:28], b[31:28], c[31:28], s[31:28]);

    sum_generator cla4_sum9(a[35:32], b[35:32], c[35:32], s[35:32]);
    sum_generator cla4_sum10(a[39:36], b[39:36], c[39:36], s[39:36]);
    sum_generator cla4_sum11(a[43:40], b[43:40], c[43:40], s[43:40]);
    sum_generator cla4_sum12(a[47:44], b[47:44], c[47:44], s[47:44]);

    sum_generator cla4_sum13(a[51:48], b[51:48], c[51:48], s[51:48]);
    sum_generator cla4_sum14(a[55:52], b[55:52], c[55:52], s[55:52]);
    sum_generator cla4_sum15(a[59:56], b[59:56], c[59:56], s[59:56]);
    sum_generator cla4_sum16(a[63:60], b[63:60], c[63:60], s[63:60]);
    */

endmodule

//產生所需的小p小g
module gp_generator(a, b, p, g );
     input [3:0] a,b;
	 output [3:0] p,g;

	 assign g[0] = a[0] & b[0];
	 assign p[0] = a[0] | b[0];

	 assign g[1] = a[1] & b[1];
	 assign p[1] = a[1] | b[1];

	 assign g[2] = a[2] & b[2];
	 assign p[2] = a[2] | b[2];

	 assign g[3] = a[3] & b[3];
	 assign p[3] = a[3] | b[3];

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

     input [3:0] a,b,c;
	 output [3:0] s;

	 assign s[0] = a[0] ^ b[0] ^ c[0];
	 assign s[1] = a[1] ^ b[1] ^ c[1];
	 assign s[2] = a[2] ^ b[2] ^ c[2];
	 assign s[3] = a[3] ^ b[3] ^ c[3];

endmodule
