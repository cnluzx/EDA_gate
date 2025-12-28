
module test_lzx_VM;

    reg         clk;       
    reg         rst_n;     
    reg  [1:0]  In;       


    wire        D_out;     
    wire        C;          

    lzx_VM u_vending_machine(
        .clk(clk),
        .rst_n(rst_n),
        .In(In),
        .D_out(D_out),
        .C(C)
    );

  
    initial begin
        clk = 1'b0;
        forever #10 clk = ~clk;  
    end


    initial begin
       
        rst_n = 1'b0;  
        In = 2'b00;  
        #15;          

       
        rst_n = 1'b1;
        #20;

        In = 2'b00;
        #20;

        In = 2'b01;
        #20;

        In = 2'b00;
        #20;

        In = 2'b01;
        #20;

        In = 2'b10;
        #20;
        
        In = 2'b00;
        #20;


        In = 2'b10;
        #20;

        In = 2'b01;
        #20;
        In = 2'b10;
        #20;

        In = 2'b00;
        #20;
        In = 2'b10;
        #20;
        In = 2'b01;
        #20;
        In = 2'b01;
        #20;

        rst_n = 1'b0;
        #20;
        rst_n = 1'b1;
        #20;


    end

endmodule