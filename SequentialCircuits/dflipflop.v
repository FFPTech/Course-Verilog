// iverilog -o ./out/dflipflop_tb.out srclatch.v dlatch.v dflipflop.v dflipflop_tb.v
// D flip-flop using a master-slave configuration
// Negative-edge triggered
// Master is a D latch, Slave is an SRC latch
module dflipflop(D, clk, Q, Qn);
    input D, clk; // D = Data, clk = Clock
    output Q, Qn;
    wire Qm, Qmn; // Intermediate signals between master and slave

    // Master D latch - transparent when clk is high
    dlatch master (
        .D(D),
        .C(clk),   // Active when clk is high
        .Q(Qm),
        .Qn(Qmn)
    );

    // Slave SRC latch - transparent when clk is low
    srclatch slave (
        .S(Qm),
        .R(Qmn),
        .C(~clk),    // Active when clk is low
        .Q(Q),
        .Qn(Qn)
    );
endmodule
