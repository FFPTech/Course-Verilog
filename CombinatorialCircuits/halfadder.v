// iverilog -o .out/halfadder_tb.out halfadder.v halfadder_tb.v
module halfadder(X, Y, S, C);
    input X, Y;
    output S, C;

    assign S = X ^ Y;
    assign C = X & Y;
endmodule