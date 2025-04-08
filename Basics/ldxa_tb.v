// vvp .out/ldxa_tb.out 
`timescale 1ns / 1ps

// Define testing module
module ldxa_tb;
    reg D, X, A; // Linked to inputs
    wire L; // Linked to output

    // Import Circuit ldxa and assign to Unit-Under-Test (UUT)
    ldxa uut(
        .L(L),
        .D(D),
        .X(X),
        .A(A)
    );

    integer i, j, k; // Variables (counters) for for-loops

    // Start simulation
    initial begin
        $display("LDXA Circuit Simulation");
        $display("D X A | L");
        $display("---------");

        for(i=0; i<2; i++) // Loop over input D: D=0, D=1
        begin
            for(j=0; j<2; j++) // Loop over input X: X=0, X=1
            begin
                for(k=0; k<2; k++) // Loop over input A: A=0, A=1
                begin
                    D=i; X=j; A=k; // Assign values to registers
                    #10; // Wait for 10 nanoseconds
                    $display("%b %b %b | %b", D, X, A, L); // Display results: %b = binary representation
                end
            end
        end
        
        $finish;
    end

endmodule