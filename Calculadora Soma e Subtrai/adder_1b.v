module adder_1b(a,b,cin,cout,sum);
	input a, b, cin;
	output cout, sum;
	
	/** Cálculo do CarryOut **/
	//CarryOut = (b.CarryIn) + (a.CarryIn) + (b.a)
	wire and_cout1_out, and_cout2_out, and_cout3_out;
	and and_cout1	(and_cout1_out, b, cin);
	and and_cout2	(and_cout2_out, a, cin);
	and and_cout3	(and_cout3_out, a, b);
	
	or cout_or (cout, and_cout1_out, and_cout2_out, and_cout3_out);
	
	/** Cálculo da soma **/
	//Sum = (a.-b.-CarryIn) + (-a.b.-CarryIn) + (-a.-b.CarryIn) + (a.b.CarryIn)
	wire and_sum1_out, and_sum2_out, and_sum3_out, and_sum4_out;
	wire not_a_out, not_b_out, not_cin_out;
	
	not not_a (not_a_out, a);
	not not_b (not_b_out, b);
	not not_cin (not_cin_out, cin);
	
	and and_sum1 (and_sum1_out, a, not_b_out, not_cin_out);
	and and_sum2 (and_sum2_out, not_a_out, b, not_cin_out);
	and and_sum3 (and_sum3_out, not_a_out, not_b_out, cin);
	and and_sum4 (and_sum4_out, a, b, cin);
	
	or big_or (sum, and_sum1_out, and_sum2_out, and_sum3_out, and_sum4_out);
	//
	
	
endmodule