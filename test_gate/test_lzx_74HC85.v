module test_lzx_74HC85;
    reg  [3:0] A;
    reg  [3:0] B;
    reg  IA_g;
    reg  IA_e;
    reg  IA_l;
    wire QA_g;
    wire QA_e;
    wire QA_l;

    lzx_74HC85 u8(
        .A(A),          
        .B(B),          
        .IA_g(IA_g), 
        .IA_e(IA_e), 
        .IA_l(IA_l),
        .QA_g(QA_g), 
        .QA_e(QA_e), 
        .QA_l(QA_l)
    );

    initial begin
      
        IA_g = 1'b1; IA_e = 1'b0; IA_l = 1'b0;
        A = 4'b0000; 
        B = 4'b1111; 
        #20;
        
        IA_g = 1'b0; IA_e = 1'b0; IA_l = 1'b1;
        A = 4'b1111;  // A=15
        B = 4'b0000;  // B=0
        #20;

        IA_g = 1'b0; IA_e = 1'b1; IA_l = 1'b0;
        #20;

        A = 4'b1000;
        B = 4'b0111;
        #20;

        A = 4'b1100;
        B = 4'b1011;
        #20;

        A = 4'b1110;
        B = 4'b1101;
        #20;

        A = 4'b1111;
        B = 4'b1110;
        #20;

        A = 4'b0111;
        B = 4'b1000;
        #20;

        A = 4'b1110;
        B = 4'b1111;
        #20;

        A = 4'b1010;
        B = 4'b1010;
        #20;

    end
endmodule