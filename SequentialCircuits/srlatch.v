// iverilog -o ./out/srlatch_tb.out srlatch.v srlatch_tb.v
// Simple SR Latch  
// Using NOR gates: Active-high inputs: S=1 sets Q=1, R=1 resets Q=0
// Using NAND gates: Active-low inputs: S=0 sets Q=1, R=0 resets Q=0
module srlatch(S, R, Q, Qn);
    input S, R; // Set and Reset inputs
    output Q, Qn; // Outputs: Q and its complement
    
    // NOR feedback logic
    assign Q  = ~(R & Qn); // Q is reset when R=1
    assign Qn = ~(S & Q); // Qn is reset when S=1
endmodule
