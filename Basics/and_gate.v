// iverilog -o .out/and_gate_tb.out and_gate.v and_gate_tb.v
// STEP 1: Module (circuit) definition
module and_gate(X, Y, F);
    input X, Y; // declare input variables
    output F; // declare output variables

    // STEP 2: Module structure 

    // a: AND logic (structure)
    // and(F, X, Y); // port(outputs, inputs)

    // b: AND logic (information)
    assign F = X & Y; // C/C++ syntax

// STEP 3: End module definition
endmodule