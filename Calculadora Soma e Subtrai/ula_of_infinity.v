module ula_of_infinity(a, b, op, cout, result, overflow, zero);
	input [7:0] a, b;
	input [3:0] op;
	output [7:0] result;
	output overflow, cout, zero;
	
	//ula_1b(a,b, less, cin, op, binvert, ainvert, cout, result);
	//ula_overflow(a,b, less, cin, op, binvert, ainvert, cout, result, set, overflow);
	
	wire [6:0] carry;
	wire binvert, ainvert, cin, set;
	ula_1b ula0 (a[0], b[0], set, op[2], op[1:0], op[2], op[3], carry[0], result[0]);
	ula_1b ula1 (a[1], b[1], 1'b0, carry[0], op[1:0], op[2], op[3], carry[1], result[1]);
	ula_1b ula2 (a[2], b[2], 1'b0, carry[1], op[1:0], op[2], op[3], carry[2], result[2]);
	ula_1b ula3 (a[3], b[3], 1'b0, carry[2], op[1:0], op[2], op[3], carry[3], result[3]);
	ula_1b ula4 (a[4], b[4], 1'b0, carry[3], op[1:0], op[2], op[3], carry[4], result[4]);
	ula_1b ula5 (a[5], b[5], 1'b0, carry[4], op[1:0], op[2], op[3], carry[5], result[5]);
	ula_1b ula6 (a[6], b[6], 1'b0, carry[5], op[1:0], op[2], op[3], carry[6], result[6]);
	ula_overflow ula7 (a[7], b[7], 1'b0, carry[6], op[1:0], op[2], op[3], cout, result[7], set, overflow);
	
	wire or0_out, or1_out, or2_out, or3_out;
	or or0 (or0_out, result[0], result[1]);
	or or1 (or1_out, result[2], result[3]);
	or or2 (or2_out, result[4], result[5]);
	or or3 (or3_out, result[6], result[7]);
	
	wire dual1_out, dual2_out;
	or dual_or1 (dual1_out, or0_out, or1_out);
	or dual_or2 (dual2_out, or2_out, or3_out);
	
	wire big_or_out;
	or big_or (big_or_out, dual1_out, dual2_out);
	
	not not_zero (zero, big_or_out);
endmodule