//Módulo da ULA de 1 bit

module ula_1b(a,b, less, cin, op, binvert, ainvert, cout, result);
	input a, b, less,cin, binvert, ainvert;
	input [1:0] op;
	output result, cout;
	
	/** Bloco de soma e Subtração **/
	//module adder_1b(a,b,cin,cout,sum);
	//mux2_1b(out, a, b, sel);
	
	wire not_b_out;
	not not_b (not_b_out, b);
	
	wire not_a_out;
	not not_a (not_a_out, a);
	
	wire mux_binvert_out, mux_ainvert_out, not_binvert_out, not_ainvert_out;
	mux2_1b mux_ainvert (mux_ainvert_out, a, not_a_out, ainvert);
	mux2_1b mux_binvert (mux_binvert_out, b, not_b_out, binvert);
	
	wire sum;
	adder_1b adder (mux_ainvert_out, mux_binvert_out, cin, cout, sum);
	
	//As duas operações and e or básicas da ula:
	wire or_out, and_out;
	or ula_or (or_out, mux_ainvert_out, mux_binvert_out);
	and ula_and (and_out, mux_ainvert_out, mux_binvert_out);

	//Multiplexador
	//module mux4_1b(out, a, b, c, d, sel);
	mux4_1b mux (result, and_out, or_out, sum, less, op);
 	
endmodule