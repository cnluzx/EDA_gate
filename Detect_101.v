//三、实验内容
//   完成以下状态机实验，并按要求完成实验报告。
//1、状态机实验1——序列检测电路状态机的设计、综合、仿真及烧录测试。设计一个串行数据检测电路，要求：当连续输入的 3位或4位数为下列序列之一时，输出1，否则输出0。用Moore型状态机实现。
//学号尾号	0	1	2	3	4	5	6	7	8	9
//检测序列	010	101	0010	0100	0101	0110	1001	1010	1011	1101
//注：根据自己的学号尾号完成对应的序列检测。


//designed by oypp 独热码

//问题：试验箱不能正常表示10101 闪烁两次可以实现101101
//无法正常运行


module lzx_fsm(clk,rst,ina,dataout)

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

/////////////////////////////////////////////////////////////////////////////
//online https://blog.csdn.net/vivid117/article/details/102171881

module Detect_101(
    input           clk,
    input           rst_n,
    input           data,
    output          flag_101
    );

parameter   S0 = 0,
            S1 = 1,
            S2 = 2,
            S3 = 3;

reg     [1:0]   state;

always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        state <= S0;
    end
    else begin
        case(state)
        S0: 
            if(data == 1)
                state <= S1;
            else 
                state <= S0;
        S1: 
            if(data == 0)
                state <= S2;
            else 
                state <= S1;
        S2:
            if(data == 1)
                state <= S3;
            else 
                state <= S0;
        S3:
            if(data == 1)
                state <= S1;
            else 
                state <= S2;
        default:
                state <=S0;       
        endcase
    end
end

assign  flag_101 = (state == S3)? 1'b1: 1'b0;

endmodule


////////////////////////////////////////////////////////////////////

