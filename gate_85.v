
module HC85( 
    input [3:0] A,        
    input [3:0] B, 
    input IAGB, IASB, IAEB, 
    output reg QAGB, QASB, QAEB 
);

    always @(*) begin

        QAGB = 1'b0; 
        QASB = 1'b0; 
        QAEB = 1'b0;

        if (A > B) begin
            QAGB = 1'b1;
        end
        else if (A < B) begin
            QASB = 1'b1;
        end
        else begin 

            if (IAEB) begin
                QAEB = 1'b1;
            end
            else if (IAGB && !IASB) begin
                QAGB = 1'b1;
            end
            else if (!IAGB && IASB) begin
                QASB = 1'b1;
            end
            else if (!IAGB && !IASB) begin
                QAGB = 1'b1; 
                QASB = 1'b1;
            end

        end
    end

endmodule