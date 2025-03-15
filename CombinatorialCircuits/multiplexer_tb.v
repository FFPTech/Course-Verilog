// vvp .out/multiplexer_tb.out
`timescale 1ns / 1ns // Timescale: nanoseconds, precision: nanoseconds

module multiplexer_tb();
    reg [3:0] I;
    reg [1:0] S;
    wire Y;

    multiplexer uut(
        .I(I),
        .S(S),
        .Y(Y)
    );

    initial
    begin
        $display("Multiplexer Circuit Simulation");
        $display("t (ns)\t | I\t | S\t | Y");
        $monitor("%0t\t | %b\t | %b\t | %b", $time, I, S, Y);

        I = 4'b1010; // Set 4-bit input line
        for(integer i=0; i<4; i++)
        begin
            S = i; // Set 2-bit selector line
            #10; // Wait for 10 ns
        end

        $finish;
    end
endmodule