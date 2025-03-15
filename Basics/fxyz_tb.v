`timescale 1ns / 1ps

module fxyz_tb;
    reg X, Y, Z;
    wire F;

    fxyz uut(
        .X(X),
        .Y(Y),
        .Z(Z),
        .F(F)
    );

    integer i, j, k;

    initial begin
        $display("FXYZ Circuit Simulation");
        
        $display("X Y Z | F");
        $display("---------");

        for(i=0; i<2; i++)
        begin
            for(j=0; j<2; j++)
            begin
                for(k=0; k<2; k++)
                begin
                    X=i; Y=j; Z=k; 
                    #10;
                    $display("%b %b %b | %b", X, Y, Z, F);
                end
            end
        end

        $finish;
    end

endmodule