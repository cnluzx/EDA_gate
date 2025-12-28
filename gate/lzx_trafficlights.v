module lzx_trafficlights (R,Y,G,Z);
    input  R,Y,G; 
    output Z;  

    assign Z = ~(R | Y | G) | (R & Y) | (R & G) | (Y & G);

endmodule