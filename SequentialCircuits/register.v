// iverilog -o ./out/register_tb.out srclatch.v dlatch.v dflipflop.v register.v register_tb.v
module register(D, clk, clr, Q);
    parameter N = 4;  // Default value for N, can be overridden during instantiation
    input [N-1:0] D; // D = 4-bit input data
    input clk, clr; // clk = Clock, clr = Clear
    output [N-1:0] Q; // Q = 4-bit output memory
    wire [N-1:0] Qn;
    wire [N-1:0] Din;

    // Clear logic
    assign Din = clr ? {N{1'b0}} : D; // Asign N-bit 0 if clr is 1, otherwise assign D

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : dff_loop
            dflipflop dff(
                .D(Din[i]),
                .clk(clk),
                .Q(Q[i]),
                .Qn(Qn[i])
            );
        end
    endgenerate
endmodule
