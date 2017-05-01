module cla_64bit( a, b, cin, sum, cout);
	input [63:0] a, b;
    input cin;

	output [63:0] sum;
	output cout;

	wire [63:0] p, g;
	wire [16:0] c;
	wire [4:0] c16;
	wire [15:0] gG_4,gP_4;
	wire [3:0] gG_16,gP_16;

    // 小 p 小 g
	pg_generator pg1(a[3:0],    b[3:0],   p[3:0],   g[3:0]);
	pg_generator pg2(a[7:4],    b[7:4],   p[7:4],   g[7:4]);
	pg_generator pg3(a[11:8],   b[11:8],  p[11:8],  g[11:8]);
	pg_generator pg4(a[15:12],  b[15:12], p[15:12], g[15:12]);
	pg_generator pg5(a[19:16],  b[19:16], p[19:16], g[19:16]);
	pg_generator pg6(a[23:20],  b[23:20], p[23:20], g[23:20]);
	pg_generator pg7(a[27:24],  b[27:24], p[27:24], g[27:24]);
	pg_generator pg8(a[31:28],  b[31:28], p[31:28], g[31:28]);
	pg_generator pg9(a[35:32],  b[35:32], p[35:32], g[35:32]);
	pg_generator pg10(a[39:36], b[39:36], p[39:36], g[39:36]);
	pg_generator pg11(a[43:40], b[43:40], p[43:40], g[43:40]);
	pg_generator pg12(a[47:44], b[47:44], p[47:44], g[47:44]);
	pg_generator pg13(a[51:48], b[51:48], p[51:48], g[51:48]);
	pg_generator pg14(a[55:52], b[55:52], p[55:52], g[55:52]);
	pg_generator pg15(a[59:56], b[59:56], p[59:56], g[59:56]);
	pg_generator pg16(a[63:60], b[63:60], p[63:60], g[63:60]);

    // 四個一組的PG會算出來，小c也會
	group_CLA_4bit carry_generator1 (p[3:0],  g[3:0] ,  cin ,  gG_4[0] , gP_4[0] , , sum[3:0], );
	group_CLA_4bit carry_generator2 (p[7:4],  g[7:4] ,  c[1] , gG_4[1] , gP_4[1] , , sum[7:4], );
    group_CLA_4bit carry_generator3 (p[11:8], g[11:8] , c[2] , gG_4[2] , gP_4[2] , , sum[11:8], );
	group_CLA_4bit carry_generator4 (p[15:12],g[15:12] ,c[3] , gG_4[3] , gP_4[3] , , sum[15:12], );
	group_CLA_4bit carry_generator5 (p[19:16],g[19:16] ,c[4] , gG_4[4] , gP_4[4] , , sum[19:16], );
	group_CLA_4bit carry_generator6 (p[23:20],g[23:20] ,c[5] , gG_4[5] , gP_4[5] , , sum[23:20], );
	group_CLA_4bit carry_generator7 (p[27:24],g[27:24] ,c[6] , gG_4[6] , gP_4[6] , , sum[27:24], );
	group_CLA_4bit carry_generator8 (p[31:28],g[31:28] ,c[7] , gG_4[7] , gP_4[7] , , sum[31:28], );
	group_CLA_4bit carry_generator9 (p[35:32],g[35:32] ,c[8] , gG_4[8] , gP_4[8] , , sum[35:32], );
	group_CLA_4bit carry_generator10(p[39:36],g[39:36] ,c[9] , gG_4[9] , gP_4[9] , , sum[39:36], );
	group_CLA_4bit carry_generator11(p[43:40],g[43:40] ,c[10] ,gG_4[10] ,gP_4[10] , ,sum[43:40], );
	group_CLA_4bit carry_generator12(p[47:44],g[47:44] ,c[11] ,gG_4[11] ,gP_4[11] , ,sum[47:44], );
	group_CLA_4bit carry_generator13(p[51:48],g[51:48] ,c[12] ,gG_4[12] ,gP_4[12] , ,sum[51:48], );
    group_CLA_4bit carry_generator14(p[55:52],g[55:52] ,c[13] ,gG_4[13] ,gP_4[13] , ,sum[55:52], );
	group_CLA_4bit carry_generator15(p[59:56],g[59:56] ,c[14] ,gG_4[14] ,gP_4[14] , ,sum[59:56], );
	group_CLA_4bit carry_generator16(p[63:60],g[63:60] ,c[15] ,gG_4[15] ,gP_4[15] , ,sum[63:60], );

    // 16個一組的 P, G
	group_CLA_4bit carry_generator17(gP_4[3:0],  gG_4[3:0] , ,  gG_16[0] ,gP_16[0] , ,, );
	group_CLA_4bit carry_generator18(gP_4[7:4],  gG_4[7:4] , ,  gG_16[1] ,gP_16[1] , ,, );
	group_CLA_4bit carry_generator19(gP_4[11:8], gG_4[11:8] , , gG_16[2] ,gP_16[2] , ,, );
	group_CLA_4bit carry_generator20(gP_4[15:12],gG_4[15:12] , ,gG_16[3] ,gP_16[3] , ,, );

    // overflow bit
    // overflowBit carry_generator26(gP_16[3:0], gG_16[3:0] ,cin , cout);

    // get all
    group_CLA_4bit carry_generator21(gP_16[3:0],gG_16[3:0] ,cin , , ,c16[3:0] , , cout);

	group_CLA_4bit carry_generator22(gP_4[3:0],  gG_4[3:0] ,  c16[0] , , ,c[3:0] ,, );
	group_CLA_4bit carry_generator23(gP_4[7:4],  gG_4[7:4] ,  c16[1] , , ,c[7:4] ,, );
	group_CLA_4bit carry_generator24(gP_4[11:8], gG_4[11:8] , c16[2] , , ,c[11:8] ,, );
	group_CLA_4bit carry_generator25(gP_4[15:12],gG_4[15:12] ,c16[3] , , ,c[15:12] ,, );
endmodule

module group_CLA_4bit( p, g, cin, gG, gP, c, sum, out);

	input [3:0] p, g;
	input cin;
	output gG, gP;
	output [3:0] c;
	output	[3:0] sum;
    output out;

	assign gG = (g[0] & p[1] & p[2] & p[3])|(g[1]&p[2]&p[3])|(g[2]&p[3])|g[3];
	assign gP = p[0] & p[1] & p[2] & p[3];

	assign c[0] = cin;
	assign c[1] = g[0]|(p[0] & cin);
	assign c[2] = g[1]|(p[1] & g[0])|(p[1] & p[0] & cin);
	assign c[3] = g[2]|(p[2] & g[1])|(p[2] & p[1] & g[0])|(p[2] & p[1] & p[0] & cin);
	assign out = g[3]|(p[3] & g[2])|(p[3] & p[2] & g[1])|(p[3] & p[2] & p[1] & g[0])|(p[3] & p[2] & p[1] & p[0] & cin);

	assign sum[0] = c[0] ^ p[0]; // c[0] ^ a[0] ^ b[0]
	assign sum[1] = c[1] ^ p[1]; // c[1] ^ a[1] ^ b[1]
	assign sum[2] = c[2] ^ p[2]; // c[2] ^ a[2] ^ b[2]
	assign sum[3] = c[3] ^ p[3]; // c[3] ^ a[3] ^ b[3]

endmodule

/*
module overflowBit( p, g, cin, cout);

	input [3:0] p, g;
	input cin;
	output cout;

	assign cout = g[3]|(p[3] & g[2])|(p[3] & p[2] & g[1])|(p[3] & p[2] & p[1] & g[0])|(p[3] & p[2] & p[1] & p[0] & cin);

endmodule
*/

module pg_generator( a, b, p, g);

        input [3:0] a, b;
        output [3:0] p, g;

        assign p[0] = a[0] ^ b[0] ;
        assign p[1] = a[1] ^ b[1] ;
        assign p[2] = a[2] ^ b[2] ;
        assign p[3] = a[3] ^ b[3] ;

        assign g[0] = a[0] & b[0] ;
        assign g[1] = a[1] & b[1] ;
	    assign g[2] = a[2] & b[2] ;
        assign g[3] = a[3] & b[3] ;

endmodule
