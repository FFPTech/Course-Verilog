// iverilog -o .out/addersubtractor_tb.out halfadder.v fulladder.v addersubtractor.v addersubtractor_tb.v
module addersubtractor(A, B, Cin, S, Cout, V);
    input [3:0] A, B;
    input Cin;
    output [3:0] S;
    output Cout, V;
    wire [4:0] C;

    assign C[0] = Cin;
    genvar i;
    generate
        for(i = 0; i < 4; i = i+1)
        begin
            fulladder fa(
                .X(A[i]), 
                .Y(B[i] ^ Cin), 
                .Z(C[i]), 
                .S(S[i]), 
                .C(C[i+1])
            );
        end
    endgenerate
    assign Cout = C[4];
    assign V = C[3] ^ C[4]; // overflow
endmodule