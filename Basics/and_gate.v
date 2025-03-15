// and_gate.v - Simple AND Gate Module
// STEP 1: Module (circuit) definition
module and_gate(A, B, Y);
    input A, B;
    output Y;

    // STEP 2: Module structure 

    // a: AND logic (gates)
    // and(Y, A, B); // port(outputs, inputs)

    // b: AND logic (information)
    assign Y = A & B; // C/C++ syntax

// STEP 3: End module definition
endmodule