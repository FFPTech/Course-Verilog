// vvp ./out/dflipflop_tb.out
`timescale 1ns/1ps

module dflipflop_tb;
    reg D;
    reg clk;
    wire Q, Qn;

    // Instantiate the D flip-flop
    dflipflop uut (
        .D(D),
        .clk(clk),
        .Q(Q),
        .Qn(Qn)
    );

    // Clock generation: toggle every 5ns
    initial begin
        clk = 0; // Start at state 0
        forever #5 clk = ~clk; // Toggle state
    end

    // Stimulus
    initial begin
        $display("Time\tclk\tD\tQ\tQn");
        $monitor("%0dns\t%b\t%b\t%b\t%b", $time, clk, D, Q, Qn);

        D = 0; #10; // Clock goes 0 → 1 at 5ns and 15ns, etc.
        D = 1; #10;
        D = 1; #10;
        D = 1; #10;
        D = 0; #10;
        D = 0; #10;
        D = 0; #10;
        $finish;
    end
endmodule
