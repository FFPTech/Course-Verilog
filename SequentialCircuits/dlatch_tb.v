// vvp ./out/dlatch_tb.out
`timescale 1ns/1ns
module dlatch_tb;
    reg D, C;
    wire Q, Qn;

    dlatch uut(
        .D(D), 
        .C(C), 
        .Q(Q), 
        .Qn(Qn)
    );

    initial begin
        $display("Time | C D | Q Qn");
        $monitor("%4t | %b %b | %b %b", $time, C, D, Q, Qn);

        // Hold
        C = 0; D = 0; #10;
        C = 0; D = 1; #10;
        // Enable and Set D = 1
        C = 1; #10;
        // Disable hold
        C = 0; #10;
        // Enable and Reset D = 0
        D = 0; C = 1; #10;
        // Hold
        C = 0; #10;
        // Enable Set again
        D = 1; C = 1; #10;

        $finish;
    end
endmodule
