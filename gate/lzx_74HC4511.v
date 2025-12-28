module lzx_74HC4511(BI_n, LT_n, LE, D, seg);

    input  BI_n;  
    input  LT_n;    
    input  LE;  
    input  [3:0] D;  
    output reg [6:0] seg ;

reg [3:0] D_latch;  

always @(*) begin
    if (!LE) begin  
        D_latch = D;
    end
end

always @(*) begin
   
    if (!BI_n) begin
        seg = 7'b0000000;  
    end
    else if (!LT_n) begin
        seg = 7'b1111111;  
    end
    else begin
        case(D_latch)
            4'h0: seg = 7'b1111110;  // 0
            4'h1: seg = 7'b0110000;  // 1
            4'h2: seg = 7'b1101101;  // 2
            4'h3: seg = 7'b1111001;  // 3
            4'h4: seg = 7'b0110011;  // 4
            4'h5: seg = 7'b1011011;  // 5
            4'h6: seg = 7'b1011111;  // 6
            4'h7: seg = 7'b1110000;  // 7
            4'h8: seg = 7'b1111111;  // 8
            4'h9: seg = 7'b1111011;  // 9
            4'hA: seg = 7'b1110111;  // A
            4'hB: seg = 7'b0011111;  // B
            4'hC: seg = 7'b1001110;  // C
            4'hD: seg = 7'b0111101;  // D
            4'hE: seg = 7'b1001111;  // E
            4'hF: seg = 7'b1000111;  // F
            default: seg = 7'b0000000;  
        endcase
    end
end

endmodule
