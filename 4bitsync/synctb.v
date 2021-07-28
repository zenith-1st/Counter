module asynctb();
    reg clk,rst;
    wire [3:0] out;

    always #5 clk= ~clk;

    sync s1(clk,rst,out);

    initial begin
        clk=0;
        rst=1;

        #6 rst=0;
        #300 $finish;
    end

    initial begin
        $monitor("time=%0t, out=%d",$time,out);
    end

endmodule