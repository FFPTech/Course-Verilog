// iverilog -o ./out/register_tb.out srclatch.v dlatch.v dflipflop.v register.v register_tb.v
module register(D, clk, clr, Q);
    input [3:0] D; // D = 4-bit input data
    input clk, clr; // clk = Clock, clr = Clear
    output [3:0] Q; // Q = 4-bit output memory
    wire [3:0] Qn;
    wire [3:0] Din;

    // Clear logic
    assign Din = clr ? 4'b0000 : D; // Asign 4bit 0 if clr is high, otherwise assign D

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : dff_loop
            dflipflop dff(
                .D(Din[i]),
                .clk(clk),
                .Q(Q[i]),
                .Qn(Qn[i])
            );
        end
    endgenerate
endmodule
