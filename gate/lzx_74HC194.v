
module lzx_74HC194(MR, CLK, DSR, DSL, S, D, Q);
    input MR, CLK, DSR, DSL;
    input [1:0] S;      
    input [3:0] D;      
    output reg [3:0] Q; 

    always @(negedge MR or posedge CLK) begin

        if (!MR) begin
            Q <= 4'b0000; 
        end
        else begin
            case (S)
                2'b00: Q <= Q;                 
                2'b01: Q <= {DSR, Q[3:1]};      
                2'b10: Q <= {Q[2:0], DSL};       
                2'b11: Q <= D;                  
            endcase
        end
    end

endmodule