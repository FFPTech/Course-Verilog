// vvp ./out/register_tb.out
`timescale 1ns / 1ns

module register_tb;
    reg [7:0] D; // 8-bit data
    reg clk, clr;
    wire [7:0] Q; // 8-bit memory

    register #(8) uut (
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
        $display("Time\tclk\tclr\tD\t\tQ");
        $monitor("%0t\t%b\t%b\t%b\t%b", $time, clk, clr, D, Q);

        // Initialize signals
        clr = 1; D = {8{1'b0}}; //4'b0000;  // Clear enabled, 
        #10 clr = 0; D = 8'b10101001; // After 10 ns, clear disabled, data 1010
        #10 D = 8'b11111111; // Load 1111
        #10 clr = 1;     // Clear register again
        #10 clr = 0; D = 8'b10010110; // Load 1001

        // End simulation after 20 ns
        #20;
        $finish;
    end
endmodule
