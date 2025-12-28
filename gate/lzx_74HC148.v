module lzx_74HC148(din,EI_n,dout_n,GS_n,EO_n);

    input  [7:0] din;   
    input        EI_n;
    output reg[2:0] dout_n;     
    output reg      GS_n;     
    output reg      EO_n;     

always @(*) begin

    dout_n   = 3'b111;
    GS_n   = 1'b1;  
    EO_n   = 1'b1; 

    if (!EI_n) begin 
        casex (din)
            8'b11111111 : begin dout_n = 3'b111; EO_n = 1'b0; end 
            8'b0xxxxxxx : begin dout_n = 3'b000; GS_n = 1'b0; end //I7_n
            8'b10xxxxxx : begin dout_n = 3'b001; GS_n = 1'b0; end
            8'b110xxxxx : begin dout_n = 3'b010; GS_n = 1'b0; end
            8'b1110xxxx : begin dout_n = 3'b011; GS_n = 1'b0; end
            8'b11110xxx : begin dout_n = 3'b100; GS_n = 1'b0; end
            8'b111110xx : begin dout_n = 3'b101; GS_n = 1'b0; end
            8'b1111110x : begin dout_n = 3'b110; GS_n = 1'b0; end
            8'b11111110 : begin dout_n = 3'b111; GS_n = 1'b0; end //I0_n
            
        endcase
    end
end

endmodule
