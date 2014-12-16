module mux4_1b(out, a, b, c, d, sel);
    output out;
    input a,b,c,d;
    input [1:0] sel;
//    mux(out, a, b, sel)

	wire out_mux_1, out_mux_2;
    mux2_1b M1 (.a(a), .out(out_mux_1), .b(b), .sel(sel[0]));

    mux2_1b M2 (.out(out_mux_2),
            .a(c),
            .b(d),
            .sel(sel[0])
    );
    mux2_1b M3 (out, out_mux_1, out_mux_2, sel[1]);
endmodule