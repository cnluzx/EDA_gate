module HC161( Q, TC, MR, CP, CEP, CET, PE, D );
    input MR, CP, CEP, CET, PE;
    input [3:0] D;
    output [3:0] Q;
    output TC;
    
    reg [3:0] Q;

    always @(negedge MR, posedge CP) begin
        if (!MR) begin  

            Q <= 4'b0000;
        end 
        else if (!PE) begin

            Q <= D;
        end
        else if (CEP && CET) begin

            Q <= Q + 1'b1;
        end

    end

    assign TC = (Q == 4'hF) && CET;

endmodule