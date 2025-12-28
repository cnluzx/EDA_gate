module lzx_74HC74(SD1, RD1, CLK1, D1, Q1, Q_N1, SD2, RD2, CLK2, D2, Q2, Q_N2);
    input  SD1;    
    input  RD1;    
    input  CLK1;  
    input  D1;    
    output reg Q1;
    output reg Q_N1;

    input  SD2;    
    input  RD2;   
    input  CLK2;  
    input  D2;    
    output reg Q2;
    output reg Q_N2;

    always @(posedge CLK1 or negedge SD1 or negedge RD1) begin
        if (!SD1) begin
            Q1    <= 1'b1; 
            Q_N1  <= 1'b0;
        end
        
        else if (!RD1) begin
            Q1    <= 1'b0;
            Q_N1  <= 1'b1;
        end
        else begin
            Q1    <= D1;
            Q_N1  <= ~D1;
        end
    end

    always @(posedge CLK2 or negedge SD2 or negedge RD2) begin
        if (!SD2) begin
            Q2    <= 1'b1;
            Q_N2  <= 1'b0;
        end
        else if (!RD2) begin
            Q2    <= 1'b0;
            Q_N2  <= 1'b1;
        end
        else begin
            Q2    <= D2;
            Q_N2  <= ~D2;
        end
    end

endmodule