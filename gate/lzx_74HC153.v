module lzx_74HC153(E1_n, E2_n, S, D1, D2, Y1, Y2);
    input  E1_n;  
    input  E2_n;
    input  [1:0] S;     
    input  [3:0] D1;   
    input  [3:0] D2;
    output reg   Y1;   
    output reg   Y2;    

always @(*) begin
   
    if (~E1_n) begin 
        case(S)
            2'b00: Y1 = D1[0]; // S1=0,S0=0 ? D1[0]
            2'b01: Y1 = D1[1]; // S1=0,S0=1 ? D1[1]
            2'b10: Y1 = D1[2]; // S1=1,S0=0 ? D1[2]
            2'b11: Y1 = D1[3]; // S1=1,S0=1 ? D1[3]
        endcase
    end else begin 
        Y1 = 1'b0;
    end

    if (~E2_n) begin 
        case(S)
            2'b00: Y2 = D2[0]; 
            2'b01: Y2 = D2[1]; 
            2'b10: Y2 = D2[2]; 
            2'b11: Y2 = D2[3]; 
        endcase
    end else begin
        Y2 = 1'b0;
    end
end

endmodule
