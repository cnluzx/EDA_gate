module test_lzx_74HC112;
  
    reg nSd1, nRd1, nClk1, J1, K1;  // channel 1
    wire Q1, nQ1;

    reg nSd2, nRd2, nClk2, J2, K2;    // channel 2
    wire Q2, nQ2;

    lzx_74HC112 u12(
        .nSd1(nSd1), .nRd1(nRd1), .nClk1(nClk1), .J1(J1), .K1(K1), .Q1(Q1), .nQ1(nQ1),
        .nSd2(nSd2), .nRd2(nRd2), .nClk2(nClk2), .J2(J2), .K2(K2), .Q2(Q2), .nQ2(nQ2)
    );

    initial begin
        nClk1 = 1;
        forever #10 nClk1 = ~nClk1;
    end

    initial begin
      
        nSd1=1; nRd1=1; J1=0; K1=0;
        nSd2=1; nRd2=1; J2=0; K2=0;

        #5 nSd1=0; #10 nSd1=1;
        #5 nRd1=0; #10 nRd1=1;
        #5 J1=1; K1=1; #20;
        #5 J2=0; K2=1; #20;

    end
endmodule