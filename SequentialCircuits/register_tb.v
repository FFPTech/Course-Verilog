// vvp ./out/register_tb.out
`timescale 1ns / 1ns

module register_tb;
    reg [3:0] D;
    reg clk, clr;
    wire [3:0] Q;

    register uut (
        .D(D),
        .clk(clk),
        .clr(clr),
        .Q(Q)
    );

    // Clock generation: toggle every 5ns
    initial clk = 0; // Start at state 0
    always #5 clk = ~clk; // Toggle state

    initial begin
        // Display the header for the monitor output
        $display("Time\tclk\tclr\tD\tQ");
        $monitor("%0t\t%b\t%b\t%b\t%b", $time, clk, clr, D, Q);

        // Initialize signals
        clr = 1; D = 4'b0000;  // Clear enabled, 
        #10 clr = 0; D = 4'b1010; // After 10 ns, clear disabled, data 1010
        #10 D = 4'b1111; // Load 1111
        #10 clr = 1;     // Clear register again
        #10 clr = 0; D = 4'b1001; // Load 1001

        // End simulation after 20 ns
        #20;
        $finish;
    end
endmodule
