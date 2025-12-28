module lzx_74HC85(A, B, IA_g, IA_e, IA_l, QA_g, QA_e, QA_l);

    input  [3:0] A;  
    input  [3:0] B;  
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

    if (IA_g == 1'b1) begin 
        QA_g = 1'b1;
    end else if (IA_l == 1'b1) begin 
        QA_l = 1'b1;
    end else if (IA_e == 1'b1) begin

        if (A[3] > B[3]) begin  QA_g = 1'b1;
        end else if (A[3] < B[3]) begin QA_l = 1'b1;
        end else if (A[2] > B[2]) begin  QA_g = 1'b1;
        end else if (A[2] < B[2]) begin  QA_l = 1'b1;
        end else if (A[1] > B[1]) begin  QA_g = 1'b1;
        end else if (A[1] < B[1]) begin  QA_l = 1'b1;
        end else if (A[0] > B[0]) begin  QA_g = 1'b1;
        end else if (A[0] < B[0]) begin  QA_l = 1'b1;
        end else begin  QA_e = 1'b1;
        end
    end
end

endmodule