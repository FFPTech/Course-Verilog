// iverilog -o .out/comparator_tb.out comparator.v comparator_tb.v
module comparator(A, B, E);
    input [3:0] A, B; // 4-bit inputs A = [A3,A2,A1,A0] and B = [B3,B2,B1,B0]
    output E; // Equality bit, 1 if A is equal to B, 0 otherwise
    wire [3:0] N; // 4-bit, bit-wise differences, N = [N3,N2,N1,N0]

    // Instantiate 4 1-bit comparators
    genvar i; // counter
    generate // generate sub-circuits (module)
        for(i = 0; i < 4; i = i+1) 
        begin
            diff1bit diff(
                .X(A[i]), // A[i] --> X
                .Y(B[i]), // B[i] --> Y
                .Z(N[i]) // N[i] --> Z
            );
        end
    endgenerate

    assign E = & (~N); // apply logical operations to all elements
endmodule

// Corresponds to Circuit MX in CH01, slide 4 and 5  
module diff1bit(X, Y, Z);
    input X, Y;
    output Z;

    // assign Z = X ^ Y; // 1 if X and Y are different, 0 otherwise
    assign Z = (~X & Y) | (X & ~Y); // 1 if X and Y are different, 0 otherwise
endmodule