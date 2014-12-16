// MUX2

module mux2_1b(out, a, b, sel);
    output out;
    input a,b,sel;
	 wire sel_n, sel_a, sel_b;
    not not_sel (sel_n, sel) ;
    and and_a (sel_a, b, sel);
    and and_b (sel_b, sel_n, a);
    or or_final (out, sel_a, sel_b);
endmodule