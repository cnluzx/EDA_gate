module lzx_fsm(clk,rst,ina,dataout);

    input clk,rst,ina;
    output reg dataout;
    parameter s0=4'b0001, s1=4'b0010, s2=4'b0100,s3=4'b1000;
    reg [3:0]current_state, next_state;


    always@(current_state,ina)
        begin
            case(current_state)
                s0:next_state=ina?s1:s0;
                s1:next_state=ina?s1:s2;
                s2:next_state=ina?s3:s0;
                s3:next_state=ina?s1:s2;
                default :next_state=s0;
            endcase
        end


    always@(posedge clk,negedge rst) 
        begin   
            if(!rst) 
                current_state <= s0;
            else 
                current_state <= next_state;
        end

    always@(current_state) 
        dataout=(current_state==s3);
endmodule