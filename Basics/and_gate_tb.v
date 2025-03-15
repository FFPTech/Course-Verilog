`timescale 1ns / 1ps

// Define testing module
module and_gate_tb; 

  // Declare testbench variables
  reg A, B;      // Inputs
  wire Y;        // Output

  // Instantiate the AND gate module
  // uut = Unit-Under-Test
  and_gate uut (
      .A(A),
      .B(B),
      .Y(Y)
  );  

  // Test sequence
  initial begin
    // Display header
    $display("Welcome to the ISIG-Goma e-Lab");
    $display("A B | Y");
    $display("--------");

    // Apply test cases
    A = 0; B = 0; #10; // set A=0, set B=0, wait 10ns
    $display("%b %b | %b", A, B, Y); // C/C++ syntax

    A = 0; B = 1; #10; // set A=0, set B=1, wait 10ns
    $display("%b %b | %b", A, B, Y);

    A = 1; B = 0; #10;
    $display("%b %b | %b", A, B, Y);

    A = 1; B = 1; #10;
    $display("%b %b | %b", A, B, Y);

    // End simulation
    $finish;
  end

endmodule
