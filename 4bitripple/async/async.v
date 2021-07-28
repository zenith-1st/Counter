module tff(clk,rst,t,q,qbar);       //if you are uding d ff then ip out of counter willl be change
  input clk,t,rst;
  output reg q;
  output qbar;
  
  assign qbar = ~q;
  
  always@(posedge clk)
    begin
      if (rst)
        q <= 0;
      else			//q = t ? q:~q;
        begin
          if (t==0)
            q<=q;
          else
            q<= ~q;
        end
    end
endmodule

module async(clk,rst,ip,out);
    //now as we know counter is seq circuit
    // and its asyn so clk will be different for all
    //& ip is by default high

    input clk,ip,rst;
    //now we will use the t ff so we have to make wires for connections

    wire q1,q2,q3,q4;
    wire q1b,q2b,q3b,q4b;
    output [3:0] out;       

    tff t1(clk,rst,1,q1,q1b);
    tff t2(q1b,rst,1,q2,q2b);
    tff t3(q2b,rst,1,q3,q3b);
    tff t4(q3b,rst,1,q4,q4b);

    assign out = {q4,q3,q2,q1};      //msb to lsb

endmodule