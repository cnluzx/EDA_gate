module lzx_BasGate (A,B,Y1,Y2,Y3,Y4,Y5,Y6);
    input A,B;
    output reg Y1,Y2,Y3,Y4,Y5,Y6;
always @(A,B)
begin
    Y1  <= A & B;
    Y2  <= ~(A & B);
    Y3  <= A ||B ;
    Y4  <=~(A||B);
    Y5  <= A ^ B;  
    Y6  <= ~ A ;
end 
endmodule