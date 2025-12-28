module test_lzx_74HC148;
    reg [7:0]  din;
    reg        EI_n;  
    wire [2:0] dout_n;
    wire       GS_n;  
    wire       EO_n;  


    lzx_74HC148 u5(
        .din    (din),
        .EI_n   (EI_n),
        .dout_n   (dout_n),
        .GS_n   (GS_n),
        .EO_n   (EO_n)
    );


    initial begin
        EI_n = 1'b1; din = 8'b00000000; #20;
        EI_n = 1'b0; din = 8'b11111111; #20;
        EI_n = 1'b0; din = 8'b11111110; #20;//dout_n = 3'b000;
        EI_n = 1'b0; din = 8'b11111101; #20;
        EI_n = 1'b0; din = 8'b11111011; #20;
        EI_n = 1'b0; din = 8'b11110111; #20;
        EI_n = 1'b0; din = 8'b11101111; #20;
        EI_n = 1'b0; din = 8'b11011111; #20;
        EI_n = 1'b0; din = 8'b10111111; #20;
        EI_n = 1'b0; din = 8'b01111111; #20;
        EI_n = 1'b0; din = 8'b11111111; #20;
        EI_n = 1'b0; din = 8'b01010101; #20;
       
        $finish;
    end

endmodule