// vvp .out/halfadder_tb.out
`timescale 1ns / 1ns

module halfadder_tb();
    reg X, Y;
    wire S, C;

    halfadder uut(
        .X(X),
        .Y(Y),
        .S(S),
        .C(C)
    );

    initial
    begin
        $display("Half-Adder Circuit Simulation");
        $display("t (ns)\t | X\t | Y\t | C\t | S");
        $monitor("%0t\t | %b\t | %b\t | %b\t | %b", $time, X, Y, C, S);

        X = 0; Y = 0; #10;
        X = 0; Y = 1; #10;
        X = 1; Y = 0; #10;
        X = 1; Y = 1; #10;

        $finish;
    end
endmodule