

module Tzh_donk(rst,clk,D_in,D_out,D_c);
    input rst,clk;
    input [1:0]D_in;
    output reg D_out,D_c;
    parameter s0=6'b000001,s1=6'b000010,s2=6'b000100,s3=6'b001000,s4=6'b010000,s5=6'b100000;
    reg [5:0]cur_state,next_state;
    
    always@(D_in,cur_state)
        begin
            case(cur_state)
                s0:begin
                    if(D_in[1]&D_in[0])next_state<=s3;
                    else if(D_in[1])next_state<=s2;
                    else if(D_in[0])next_state<=s1;
                    else next_state<=s0;
                    end
                s1:begin
                    if(D_in[1]&D_in[0])next_state<=s4;
                    else if(D_in[1])next_state<=s3;
                    else if(D_in[0])next_state<=s2;
                    else next_state<=s1;
                    end
                s2:begin
                    if(D_in[1]&D_in[0])next_state<=s5;
                    else if(D_in[1])next_state<=s4;
                    else if(D_in[0])next_state<=s3;
                    else next_state<=s2;
                    end
                s3:begin
                    if(D_in[1])next_state<=s5;
                    else if(D_in[0])next_state<=s4;
                    else next_state<=s3;
                    end
                default next_state<=s0;
            endcase
        end

    always@(posedge clk,negedge rst)
        begin
            if(!rst)cur_state<=s0;
            else cur_state<=next_state;
        end

    always@(cur_state)
        begin
            D_out=(cur_state==s4||cur_state==s5);
            D_c=(cur_state==s5);
        end
endmodule