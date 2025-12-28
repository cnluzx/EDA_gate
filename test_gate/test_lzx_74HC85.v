
module test_lzx_74HC85;

    reg  A3, A2, A1, A0;
    reg  B3, B2, B1, B0;
    reg  IA_g;
    reg  IA_e;
    reg  IA_l;
    wire QA_g;
    wire QA_e;
    wire QA_l;

    lzx_74HC85 u1(
        .A3(A3), .A2(A2), .A1(A1), .A0(A0),
        .B3(B3), .B2(B2), .B1(B1), .B0(B0),
        .IA_g(IA_g), .IA_e(IA_e), .IA_l(IA_l),
        .QA_g(QA_g), .QA_e(QA_e), .QA_l(QA_l)
    );



    initial begin
    
     
        IA_g = 1'b1; IA_e = 1'b0; IA_l = 1'b0;  // greater

        A3=1'b0; A2=1'b0; A1=1'b0; A0=1'b0; // A=0000
        B3=1'b1; B2=1'b1; B1=1'b1; B0=1'b1; // B=1111
        #20;
        
        IA_g = 1'b0; IA_e = 1'b0; IA_l = 1'b1;  // lower

        A3=1'b1; A2=1'b1; A1=1'b1; A0=1'b1; // A=1111
        B3=1'b0; B2=1'b0; B1=1'b0; B0=1'b0; // B=0000
        #20;

        IA_g = 1'b0; IA_e = 1'b1; IA_l = 1'b0;  //equal
        #20;

        A3=1'b1; A2=1'b0; A1=1'b0; A0=1'b0; // A=1000
        B3=1'b0; B2=1'b1; B1=1'b1; B0=1'b1; // B=0111
        #20;

        A3=1'b1; A2=1'b1; A1=1'b0; A0=1'b0; // A=1100
        B3=1'b1; B2=1'b0; B1=1'b1; B0=1'b1; // B=1011
        #20;

        A3=1'b1; A2=1'b1; A1=1'b1; A0=1'b0; // A=1110
        B3=1'b1; B2=1'b1; B1=1'b0; B0=1'b1; // B=1101
        #20;

        A3=1'b1; A2=1'b1; A1=1'b1; A0=1'b1; // A=1111
        B3=1'b1; B2=1'b1; B1=1'b1; B0=1'b0; // B=1110
        #20;


        A3=1'b0; A2=1'b1; A1=1'b1; A0=1'b1; // A=0111
        B3=1'b1; B2=1'b0; B1=1'b0; B0=1'b0; // B=1000
        #20;

        A3=1'b1; A2=1'b1; A1=1'b1; A0=1'b0; // A=1110
        B3=1'b1; B2=1'b1; B1=1'b1; B0=1'b1; // B=1111
        #20;

        A3=1'b1; A2=1'b0; A1=1'b1; A0=1'b0; // A=1010
        B3=1'b1; B2=1'b0; B1=1'b1; B0=1'b0; // B=1010
        #20;

    end

endmodule