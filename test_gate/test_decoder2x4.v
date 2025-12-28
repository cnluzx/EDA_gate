`timescale 1ns / 1ps

module test_lzx_decoder2x4();

    reg  a, b, en;
    wire [3:0] y;

    lzx_decoder2x4 u2 (
        .a(a),
        .b(b),
        .en(en),
        .y(y)
    );

    initial begin

        en = 0; a = 0; b = 0; #10;
        en = 0; a = 1; b = 1; #10;
        en = 1; a = 0; b = 0; #10; //  y = 1110 
        en = 1; a = 0; b = 1; #10; //  y = 1101 
        en = 1; a = 1; b = 0; #10; //  y = 1011 
        en = 1; a = 1; b = 1; #10; //  y = 0111 
 
    end

endmodule