// iverilog -o .out/fulladder_tb.out halfadder.v fulladder.v fulladder_tb.v
module fulladder(X, Y, Z, S, C);
    input X, Y, Z;
    output S, C;
    wire S1, C1, C2; // outputs of first and second half adder

    halfadder ha1(X, Y, S1, C1);
    halfadder ha2(S1, Z, S, C2);
    assign C = C1 | C2;
endmodule