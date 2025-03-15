module fxyz(F, X, Y, Z);
    input X, Y, Z;
    output F;
    wire X_n, X_nY, XZ;

    not(X_n, X);
    and(X_nY, X_n, Y);
    and(XZ, X, Z);
    or(F, X_nY, XZ);

    // Add formula here
endmodule