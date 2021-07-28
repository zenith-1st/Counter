module sync(clk,rst,out);
    parameter n = 4;      //as its 4 bit sync
    input clk,rst;
    output reg [n-1:0] out;   //as we are not giving ip out must be reg coz we shoud know the previous value 

    always @(posedge clk) begin
        if(rst) begin
            out<=0;
        end

        else begin
            out <=out+1;
        end
    end


endmodule