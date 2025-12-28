
module test_lzx_74HC161;
    reg MR_n;
    reg CP;
    reg CEP_n;
    reg CET_n;
    reg PE_n;
    reg [3:0] D;
    wire [3:0] Q;
    wire TC;

    HC161 u1( Q, TC, MR_n, CP, CEP_n, CET_n, PE_n, D );

    initial begin
        CP = 1'b0;
        forever #10 CP = ~CP;
    end


    initial begin
        MR_n  = 1'b1;
        PE_n  = 1'b1;
        CEP_n = 1'b1;
        CET_n = 1'b1;
        D     = 4'b0000;
        #5;
       
        MR_n = 1'b0;#10 
        MR_n = 1'b1; #5;

        PE_n = 1'b0;
        D    = 4'b1010; #20 
        PE_n = 1'b1;    #5;

        CEP_n = 1'b0;
        CET_n = 1'b0;
        #80; 
        #5;

        CEP_n = 1'b1; 
        #40;
        #5;

        CET_n = 1'b1;
        #20;
    end
endmodule