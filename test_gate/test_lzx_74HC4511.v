
module test_lzx_74HC4511;

    reg        BI_n;
    reg        LT_n;
    reg        LE;
    reg  [3:0] D;
    wire [6:0] seg;

    lzx_74HC4511 u1(
        .BI_n(BI_n),
        .LT_n(LT_n),
        .LE(LE),
        .D(D),
        .seg(seg)
    );


    initial begin
      
        BI_n = 1'b0; LT_n = 1'b1; LE = 1'b0; D = 4'h8; #20;
        BI_n = 1'b1; LT_n = 1'b0; LE = 1'b0; D = 4'h0; #20;
        BI_n = 1'b1; LT_n = 1'b1; LE = 1'b0;   

        D = 4'h0; #20; // 0
        D = 4'h1; #20; // 1
        D = 4'h5; #20; // 5
        D = 4'h8; #20; // 8
        D = 4'h9; #20; // 9
        D = 4'hA; #20; // A
        D = 4'hF; #20; // F

    end

endmodule