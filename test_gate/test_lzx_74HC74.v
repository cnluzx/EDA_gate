module test_lzx_74HC74;
    reg  SD1;
    reg  RD1;
    reg  CLK1;
    reg  D1;
    wire Q1;
    wire Q_N1;
    wire Q2;
    wire Q_N2;


    lzx_74HC74 u11(
        SD1, RD1, CLK1, D1, Q1, Q_N1,
        1'b1, 1'b1, 1'b0, 1'b0, Q2, Q_N2  
    );

    initial begin
        CLK1 = 1'b0;
        forever #10 CLK1 = ~CLK1;
    end

    initial begin
        SD1 = 1'b1;
        RD1 = 1'b1; 
        D1  = 1'b0; #5; 

        SD1 = 1'b0;
        #10 SD1 = 1'b1; 
        #5;

        RD1 = 1'b0;
        #10 RD1 = 1'b1; 
        #5;

        D1 = 1'b1;
        #20; 
        #5;

        D1 = 1'b0;
        #20;

        $finish;
    end
endmodule