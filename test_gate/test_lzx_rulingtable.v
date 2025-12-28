`timescale 1ns / 1ps

module test_lzx_rulingtable;

    reg A, B, C;
    wire Y;

    lzx_rulingtable u3 (
        .A(A),
        .B(B),
        .C(C),
        .Y(Y)
    );

    initial begin

        A = 1'b0; B = 1'b0; C = 1'b0; #20; //(000)
        A = 1'b0; B = 1'b0; C = 1'b1; #20; //(001)
        A = 1'b0; B = 1'b1; C = 1'b0; #20; //(010)
        A = 1'b0; B = 1'b1; C = 1'b1; #20; //(011)
        A = 1'b1; B = 1'b0; C = 1'b0; #20; //(100)
        A = 1'b1; B = 1'b0; C = 1'b1; #20; //(101) 
        A = 1'b1; B = 1'b1; C = 1'b0; #20; //(110)
        A = 1'b1; B = 1'b1; C = 1'b1; #20; //(111)
    end

endmodule