`timescale 1ns / 1ps

module test_lzx_trafficlights;

    reg R, Y, G;
    wire Z;

    lzx_trafficlights u4 (
        .R(R),
        .Y(Y),
        .G(G),
        .Z(Z)
    );

    initial begin

        R = 0; Y = 0; G = 0; #20; //none

        R = 0; Y = 0; G = 1; #20; //ok
        R = 0; Y = 1; G = 0; #20;
        R = 1; Y = 0; G = 0; #20;

        R = 1; Y = 1; G = 0; #20; //two
        R = 1; Y = 0; G = 1; #20;
        R = 0; Y = 1; G = 1; #20;
        R = 1; Y = 1; G = 1; #20; //three

    end

endmodule