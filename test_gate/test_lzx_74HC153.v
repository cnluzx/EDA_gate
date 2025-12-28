module test_lzx_74HC153;
    reg        E1_n;
    reg        E2_n;
    reg  [1:0] S;
    reg  [3:0] D1;
    reg  [3:0] D2;
    wire       Y1;
    wire       Y2;

    lzx_74HC153 u1(
        .E1_n(E1_n),
        .E2_n(E2_n),
        .S(S),
        .D1(D1),
        .D2(D2),
        .Y1(Y1),
        .Y2(Y2)
    );


    initial begin
        E1_n = 1'b1;E2_n = 1'b0;
        S    = 2'b00;
        D1   = 4'b1111;D2   = 4'b0000;
        #20;

        E1_n = 1'b0;
        S    = 2'b00;
        D1[0] = 1'b0;
        #20;
        
        D1[0] = 1'b1;
        #20;

        S    = 2'b01;
        D1[1] = 1'b0;
        #20;

        E2_n = 1'b0;
        S    = 2'b11;
        D2[3] = 1'b1;
        #20;

        $finish;
    end
endmodule