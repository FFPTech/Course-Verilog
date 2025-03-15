// vvp .out/decoder_tb.out
`timescale 1ns / 1ns

module decoder_tb();
    reg [1:0] A;
    reg E;
    wire [3:0] D;

    decoder uut(
        .A(A),
        .E(E),
        .D(D)
    );

    initial 
    begin
        $display("Decoder Circuit Simulation");
        $display("t (ps) \t | A \t | E \t | D");
        $monitor("%0t \t | %b \t | %b \t | %b", $time, A, E, D); // display upon input change

        E = 1; // Enable decoder
        for(integer i=0; i<4; i++) // from 00 until 11
        begin
            A = i; #10;
        end

        E = 0; #10; // Disable decoder
        $finish;
    end
endmodule