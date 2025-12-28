module lzx_74HC85(A3, A2, A1, A0, B3, B2, B1, B0, IA_g, IA_e, IA_l, QA_g, QA_e, QA_l);
    input  A3, A2, A1, A0; 
    input  B3, B2, B1, B0;  
    input  IA_g;       
    input  IA_e;        
    input  IA_l;        
    output reg QA_g;
    output reg QA_e;
    output reg QA_l;


always @(*) begin

    QA_g = 1'b0;
    QA_e = 1'b0;
    QA_l = 1'b0;

    if (IA_g == 1'b1) begin QA_g = 1'b1;
    end else if (IA_l == 1'b1) begin QA_l = 1'b1;
    end else if (IA_e == 1'b1) 
    begin

        if (A3 > B3) begin QA_g = 1'b1;
        end else if (A3 < B3) begin QA_l = 1'b1;
        end else if (A2 > B2) begin QA_g = 1'b1;
        end else if (A2 < B2) begin QA_l = 1'b1;
        end else if (A1 > B1) begin QA_g = 1'b1;
        end else if (A1 < B1) begin QA_l = 1'b1;
        end else if (A0 > B0) begin QA_g = 1'b1;
        end else if (A0 < B0) begin QA_l = 1'b1;

        end else begin QA_e = 1'b1;
        end
    end
end

endmodule