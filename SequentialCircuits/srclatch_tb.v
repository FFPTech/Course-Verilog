// vvp ./out/srclatch_tb.out
`timescale 1ns/1ns
module srclatch_tb;
    reg S, R, C;
    wire Q, Qn;

    srclatch uut (
        .S(S), .R(R), .C(C), .Q(Q), .Qn(Qn)
    );

    initial begin
        $display("Time | C S R | Q Qn");
        $monitor("%4t | %b %b %b | %b %b", $time, C, S, R, Q, Qn);

        // Initially disabled
        C = 0; S = 1; R = 0; #10;
        // Enable and Set
        C = 1; #10;
        // Hold
        C = 0; #10;
        // Enable and Reset
        C = 1; S = 0; R = 1; #10;
        // Hold
        C = 0; #10;
        // Illegal state
        C = 1; S = 1; R = 1; #10;
        // Return to hold
        C = 0; S = 0; R = 0; #10;

        $finish;
    end
endmodule
