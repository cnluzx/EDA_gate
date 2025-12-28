module test_lzx_74HC283;
    reg  [3:0] A;
    reg  [3:0] B;
    reg        Cin;
    wire [3:0] S;
    wire       Cout;

    wire [3:0] G;
    wire [3:0] P;
    wire [3:0] C;

    lzx_74HC283 u1(
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout),
        .G(G),  
        .P(P),  
        .C(C)   
    );

    initial begin

        A = 4'b0101; B = 4'b0010; Cin = 1'b0; #20; 
        A = 4'b0011; B = 4'b0100; Cin = 1'b0; #20;
        A = 4'b1001; B = 4'b0111; Cin = 1'b0; #20;
        A = 4'b1111; B = 4'b0001; Cin = 1'b0; #20;
        A = 4'b0001; B = 4'b0000; Cin = 1'b1; #20;
        A = 4'b0110; B = 4'b0001; Cin = 1'b1; #20;
        A = 4'b1111; B = 4'b1111; Cin = 1'b1; #20;
        A = 4'b1110; B = 4'b0001; Cin = 1'b1; #20;

    end
endmodule