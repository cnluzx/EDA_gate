module test_lzx_BasGate;

    reg  A, B;
    wire Y1, Y2, Y3, Y4, Y5, Y6;
        
    lzx_BasGate u1 (  
        .A(A),
        .B(B),
        .Y1(Y1),
        .Y2(Y2),
        .Y3(Y3),
        .Y4(Y4),
        .Y5(Y5),
        .Y6(Y6)
    );

    initial begin

    A = 0; B = 0; #20;
    A = 0; B = 1; #20;
    A = 1; B = 0; #20;
    A = 1; B = 1; #20;
    
    end

endmodule