// vvp ./out/srlatch_tb.out
`timescale 1ns/1ns

module srlatch_tb;
    reg S, R;
    wire Q, Qn;

    srlatch uut(
        .S(S), 
        .R(R), 
        .Q(Q), 
        .Qn(Qn)
    );

    initial begin
        $display("Time | S R | Q Qn");
        $monitor("%4t | %b %b | %b %b", $time, S, R, Q, Qn);

        // Initial state
        S = 0; R = 0; #10;
        // Set
        S = 1; R = 0; #10;
        // Hold
        S = 0; R = 0; #10;
        // Reset
        S = 0; R = 1; #10;
        // Hold
        S = 0; R = 0; #10;
        // Illegal
        S = 1; R = 1; #10;
        // Return to hold
        S = 0; R = 0; #10;

        $finish;
    end
endmodule
