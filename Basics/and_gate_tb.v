// vvp and_gate_tb.out
`timescale 1ns / 1ps

// Define testing module
module and_gate_tb; 

  // Declare testbench variables
  reg X, Y;      // Inputs
  wire F;        // Output

  // Instantiate the AND gate module
  // uut = Unit-Under-Test
  and_gate uut (
      .X(X),
      .Y(Y),
      .F(F)
  );  

  // Test sequence
  initial begin
    // Display header
    $display("Welcome to the ISIG-Goma Nano-Electronics Lab");
    $display("X Y | F");
    $display("--------");

    // Apply test cases
    X = 0; Y = 0; #10; // set X=0, set Y=0, wait 10ns
    $display("%b %b | %b", X, Y, F); // C/C++ syntax. %b = binary

    X = 0; Y = 1; #10; 
    $display("%b %b | %b", X, Y, F);

    X = 1; Y = 0; #10;
    $display("%b %b | %b", X, Y, F);

    X = 1; Y = 1; #10;
    $display("%b %b | %b", X, Y, F);

    // End simulation
    $finish;
  end

endmodule
