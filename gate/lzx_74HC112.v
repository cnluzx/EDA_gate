module lzx_74HC112(nSd1, nRd1, nClk1, J1, K1, Q1, nQ1, nSd2, nRd2, nClk2, J2, K2, Q2, nQ2);
    // channel 1
    input  nSd1;   
    input  nRd1;   
    input  nClk1;  
    input  J1;   
    input  K1;    
    output reg Q1;
    output reg nQ1;

    // channel 2
    input  nSd2;  
    input  nRd2;  
    input  nClk2; 
    input  J2;     
    input  K2;    
    output reg Q2; 
    output reg nQ2;

// 
always @(negedge nClk1 or negedge nSd1 or negedge nRd1) begin
    if (!nSd1) begin
        Q1  <= 1'b1;
        nQ1 <= 1'b0;
    end
    else if (!nRd1) begin
        Q1  <= 1'b0;
        nQ1 <= 1'b1;
    end
    else begin
        case ({J1, K1})
            2'b00: begin // J=0,K=0：//stay
                Q1  <= Q1;
                nQ1 <= nQ1;
            end
            2'b01: begin // J=0,K=1：//set 0
                Q1  <= 1'b0;
                nQ1 <= 1'b1;
            end
            2'b10: begin // J=1,K=0：/set 1
                Q1  <= 1'b1;
                nQ1 <= 1'b0;
            end
            2'b11: begin // J=1,K=1：//toggle
                Q1  <= ~Q1;
                nQ1 <= ~nQ1;
            end
        endcase
    end
end

// 
always @(negedge nClk2 or negedge nSd2 or negedge nRd2) begin
    if (!nSd2) begin
        Q2  <= 1'b1;
        nQ2 <= 1'b0;
    end
    else if (!nRd2) begin
        Q2  <= 1'b0;
        nQ2 <= 1'b1;
    end
    else begin
        case ({J2, K2})
            2'b00: begin Q2 <= Q2; nQ2 <= nQ2; end
            2'b01: begin Q2 <= 1'b0; nQ2 <= 1'b1; end
            2'b10: begin Q2 <= 1'b1; nQ2 <= 1'b0; end
            2'b11: begin Q2 <= ~Q2; nQ2 <= ~nQ2; end
        endcase
    end
end

endmodule