// iverilog -o .out/multiplexer_tb.out decoder.v multiplexer.v multiplexer_tb.v
module multiplexer(I, S, Y);
    input [3:0] I; // 4-bit input data lines
    input [1:0] S; // 2-bit selector
    output Y; // multiplexer output
    wire [3:0] D; // decoder output

    //Re-use the 2-to-4 decoder module
    decoder dec(
        .A(S),
        .E(1'b1), // Awlays enable decoder, by setting E = 1
        .D(D)
    );

    assign Y = | (D & I); // apply logical operations to all elements
endmodule