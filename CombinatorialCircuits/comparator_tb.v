// vvp .out/comparator_tb.out
`timescale 1ns / 1ns // Timescale: nanoseconds, precision: nanoseconds

// Test Bench for 4-bit Euqality Comparator Circuit
module comparator_tb();
    reg [3:0] A, B; // Inputs
    wire E; // Outputs

    // Unit-Under-Test (UUT)
    comparator uut(
        .A(A),
        .B(B),
        .E(E)
    );

    initial // Start simulation
    begin
        $display("4-bit Comparator Circuit Simulation");
        $display("t (ns) | A\t | B\t | E");
        $monitor("%0t\t | %b\t | %b\t | %b", $time, A, B, E); // $display upon changes

        for(integer i=0; i<16; i++)
        begin
            A = i; B = i; #10; // A and B are equal --> E = 1
        end
        $display("---------------------");
        A = 4'b0101; B = 4'b1101; #10; 
        A = 4'b0101; B = 4'b0011; #10; 
        A = 4'b0010; B = 4'b0100; #10; 
        A = 4'b1111; B = 4'b1010; #10; 

        $finish;
    end
endmodule