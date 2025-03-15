// iverilog -o ldxa_tb.out ldxa.v ldxa_tb.v
// A combinational circuit implementing L = D~X + A (see CH01, slide 32)
module ldxa(L, D, X, A);
    input D, X, A; // Circuit inputs
    output L; // Circuit outputs
    wire X_n, DX_n; // internal wires: intermediate variables

    // define gates using syntax 'gate(outputs, inputs)'
    // not(X_n, X); // x --> not ---> X_n
    // and(DX_n, D, X_n); // D, X_n ---> and ---> DX_n
    // or(L, DX_n, A); // DX_n, A ---> or ---> L

    // Add formula here
    assign L = (D & ~X) | A;

endmodule