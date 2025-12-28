
module test_lzx_74HC138;

    reg        E1_n;
    reg        E2_n;
    reg        E3;
    reg  [2:0] A;
    wire [7:0] Y;

    lzx_74HC138 u6(
        .E1_n(E1_n),
        .E2_n(E2_n),
        .E3(E3),
        .A(A),
        .Y(Y)
    );

    initial begin
    
        E1_n = 1'b1; E2_n = 1'b0; E3 = 1'b1; A = 3'b000; #20;
        E1_n = 1'b0; E2_n = 1'b1; E3 = 1'b1; A = 3'b111; #20;
        E1_n = 1'b0; E2_n = 1'b0; E3 = 1'b0; A = 3'b010; #20;
        E1_n = 1'b1; E2_n = 1'b1; E3 = 1'b0; A = 3'b101; #20;

        E1_n = 1'b0; E2_n = 1'b0; E3 = 1'b1; A = 3'b000; #20;
        E1_n = 1'b0; E2_n = 1'b0; E3 = 1'b1; A = 3'b001; #20;
        E1_n = 1'b0; E2_n = 1'b0; E3 = 1'b1; A = 3'b010; #20;
        E1_n = 1'b0; E2_n = 1'b0; E3 = 1'b1; A = 3'b011; #20;
        E1_n = 1'b0; E2_n = 1'b0; E3 = 1'b1; A = 3'b100; #20;
        E1_n = 1'b0; E2_n = 1'b0; E3 = 1'b1; A = 3'b101; #20;
        E1_n = 1'b0; E2_n = 1'b0; E3 = 1'b1; A = 3'b110; #20;
        E1_n = 1'b0; E2_n = 1'b0; E3 = 1'b1; A = 3'b111; #20;

    end

endmodule