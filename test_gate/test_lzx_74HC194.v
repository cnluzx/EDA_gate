module test_lzx_74HC194;
    reg MR, CLK, DSR, DSL;
    reg [1:0] S;
    reg [3:0] D;
    wire [3:0] Q;

    lzx_74HC194 u14(MR, CLK, DSR, DSL, S, D, Q);

    initial begin
        CLK = 0;
        forever #10 CLK = ~CLK;
    end

    initial begin

        MR=1; S=2'b00; DSR=0; DSL=0; D=4'hA; #5;

        MR=0; #10 MR=1; #5;

        S=2'b11; D=4'h5; #20; #5;

        S=2'b01; DSR=1; #40; #5;

        S=2'b10; DSL=0; #40; #5;

        S=2'b00; #20;

    end
endmodule