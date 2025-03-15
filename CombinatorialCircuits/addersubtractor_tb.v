// vvp .out/addersubtractor_tb.out 
`timescale 1ns / 1ns

module addersubtractor_tb();
    reg [3:0] A, B;
    reg Cin;
    wire [3:0] S;
    wire Cout, V;

    addersubtractor uut(
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout),
        .V(V)
    );

    initial
    begin
        $display("Adder-Subtractor Circuit Simulation: S = A + B");
        $display("t (ns)\t|| A(b)\t| A(d)\t| B(b)\t| B(d)\t|| S(b)\t| S(d)\t| C\t| V");
        $monitor("%0t\t|| %b\t| %d\t| %b\t| %d\t|| %b\t| %d\t| %b\t| %b", $time, A, A, B, B, S, S, Cout, V);

        Cin = 0; // Cin = 0 --> Adder, Cin = 1 --> Subtractor
        for(integer i=0; i<10; i++)
        begin
            A = $random & 4'b1111; // generate a random 4-bit number, ensuring only positive values
            B = $random & 4'b1111; // generate a random 4-bit number, ensuring only positive values
            #10;
        end

        $finish;
    end
endmodule