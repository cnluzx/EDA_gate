module lzx_74HC161( Q, TC, MR_n, CP, CEP_n, CET_n, PE_n, D );
    input MR_n;    
    input CP;     
    input CEP_n;  
    input CET_n;   
    input PE_n;    
    input [3:0] D;
    output reg [3:0] Q; 
    output TC;    

   
    always @(negedge MR_n or posedge CP) begin
        if (!MR_n) begin  
            Q <= 4'b0000;
        end 
        else if (!PE_n) begin
            Q <= D;
        end
        else if (!CEP_n && !CET_n) begin
            Q <= Q + 1'b1;
        end

        else begin
            Q <= Q;
        end
    end
    assign TC = (Q == 4'hF) && !CET_n;

endmodule