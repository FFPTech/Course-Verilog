// iverilog -o ./out/dlatch_tb.out srclatch.v dlatch.v dlatch_tb.v
// D latch constructed using SR latch with NAND gates
// Control input C acts as clock enable
module dlatch(D, C, Q, Qn);
    input D, C; // Data and Control (clock enable)
    output Q, Qn; // Outputs: Q and its complement
    wire S, R; // Internal Set and Reset

    // Convert D input to S and R
    assign S = D;        // When D=1 → Set
    assign R = ~D;       // When D=0 → Reset

    srclatch src(
        .S(S),
        .R(R),
        .C(C),     // Control signal
        .Q(Q),
        .Qn(Qn)
    );
endmodule
