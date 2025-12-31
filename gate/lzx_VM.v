
module lzx_VM(clk, rst_n, In, D_out, C);
    input         clk;        
    input         rst_n;     
    input  [1:0]  In;        
    output reg    D_out;     
    output reg    C;          



parameter s0 = 5'b00001,  // 0
          s1 = 5'b00010,  // 0.5
          s2 = 5'b00100,  // 1
          s3 = 5'b01000,  // 1.5
          s4 = 5'b10000,  // 2
          s5 = 5'b10001;  // 2.5

reg [4:0] current_state;  
reg [4:0] next_state;     


always @(current_state or In) begin
    case(current_state)
        s0: begin  
            if(In[0] == 1'b1) begin        
                next_state = s1;
            end else if(In[1] == 1'b1) begin 
                next_state = s2;
            end else begin                  
                next_state = s0;
            end
        end
        s1: begin  
            if(In[0] == 1'b1) begin            
                next_state = s2;
            end else if(In[1] == 1'b1) begin    
                next_state = s3;
            end else begin                     
                next_state = s1;
            end
        end
        s2: begin  
            if(In[0] == 1'b1) begin             
                next_state = s3;
            end else if(In[1] == 1'b1) begin     
                next_state = s4;
            end else begin                   
                next_state = s2;
            end
        end
        s3: begin 
            if(In[0] == 1'b1) begin           
                next_state = s4;
            end else if(In[1] == 1'b1) begin    
                next_state = s5;
            end else begin                      
                next_state = s3;
            end
        end
        s4: begin 
            next_state = s0;
        end
        s5: begin  
            next_state = s0;
        end
        default: next_state = s0;  
    endcase
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        current_state <= s0;
    end else begin    
        current_state <= next_state;
    end
end


always @(current_state) begin
    D_out = 1'b0;
    C = 1'b0;
    case(current_state)
        s4: begin  //
            D_out = 1'b1;
            C = 1'b0;
        end
        s5: begin  
            D_out = 1'b1;
            C = 1'b1;
        end
        default: begin  
            D_out = 1'b0;
            C = 1'b0;
        end
    endcase
end

endmodule