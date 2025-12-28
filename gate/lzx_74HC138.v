module lzx_74HC138(E1_n,E2_n,E3,A,Y);
    input  E1_n;  
    input  E2_n;  
    input  E3;    
    input  [2:0] A;     
    output reg [7:0] Y; 


always @(*) begin
    Y = 8'b11111111;

    if (~E1_n && ~E2_n && E3) begin
        case(A)
            3'b000: Y = 8'b11111110; // A=000
            3'b001: Y = 8'b11111101; // A=001
            3'b010: Y = 8'b11111011; // A=010 
            3'b011: Y = 8'b11110111; // A=011
            3'b100: Y = 8'b11101111; // A=100
            3'b101: Y = 8'b11011111; // A=101 
            3'b110: Y = 8'b10111111; // A=110 
            3'b111: Y = 8'b01111111; // A=111
        endcase
    end
end

endmodule