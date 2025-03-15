// vvp .out/fulladder_tb.out
`timescale 1ns / 1ns

module fulladder_tb();
    reg X, Y, Z;
    wire S, C;

    fulladder uut(
        .X(X),
        .Y(Y),
        .Z(Z),
        .S(S),
        .C(C)
    );

    initial
    begin
        $display("Full-Adder Circuit Simulation");
        $display("t (ns)\t || X\t | Y\t | Z\t || C\t | S");
        $monitor("%0t\t || %b\t | %b\t | %b\t || %b\t | %b", $time, X, Y, Z, C, S);

        for(integer i=0; i<2; i++)
        begin
            for(integer j=0; j<2; j++)
            begin
                for(integer k=0; k<2; k++)
                begin
                    X = i; Y = j; Z = k; #10;
                end
            end
        end

        $finish;
    end
endmodule