// iverilog -o .out/decoder_tb.out decoder.v decoder_tb.v
module decoder(A, E, D);
    input [1:0] A;
    input E;
    output [3:0] D;

    assign D[0] = ~A[1] & ~A[0] & E;
    assign D[1] = ~A[1] & A[0] & E;
    assign D[2] = A[1] & ~A[0] & E;
    assign D[3] = A[1] & A[0] & E;
endmodule