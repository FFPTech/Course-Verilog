// iverilog -o ./out/srclatch_tb.out srclatch.v srclatch_tb.v
// SR latch using NAND gates with enable/control signal
module srclatch(S, R, C, Q, Qn);
    input S, R, C; // S=Set, R=Reset, C=Control/Enable
    output Q, Qn; // Outputs: Q and its complement
    wire S_C, R_C; // Gated inputs

    // When control C=1, pass S and R to the latch
    assign S_C = ~(S & C);
    assign R_C = ~(R & C);

    // Standard NAND latch logic
    assign Q = ~(S_C & Qn);
    assign Qn = ~(R_C & Q);
endmodule
