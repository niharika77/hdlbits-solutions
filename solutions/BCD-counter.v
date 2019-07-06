



module top_module_tb();
 reg clk;
 reg reset;
 wire [3:1] ena;
 wire [15:0] q;
 
 top_module tm(.clk(clk), .reset(reset), .ena(ena), .q(q));
 
 initial begin
    clk = 1'b0;
    end
    
 always #5 clk = ~clk;
 
 
 initial 
 begin
   reset = 1'b1;
   #20 reset = 1'b0;
   end
 
 endmodule






module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output reg [3:1] ena,
    output reg [15:0] q);
    
    always @(posedge clk)
        begin
            if(reset)
                begin
                    q[3:0] <= 0;
                    ena[1] <= 1'b0;
                end
            else
                 begin
                     if (q[3:0] <9) 
                         begin
                            q[3:0] <= q[3:0] + 1;
                         end
                     else
                         begin
                            q[3:0] <= 0;
                         end
                     
                     if(q[3:0] == 8)
                         ena[1] <= 1'b1;
                     else
                         ena[1] <= 1'b0;
                 end
        end
    
    reg [3:0] count1;

                
      
    always @(posedge clk)
        begin
            if(reset)
                begin
                    q[7:4] <= 0;
                    ena[2] <= 1'b0;
                    count1 <= 0;
                end
            else
                 begin
                     if (q[7:4] <9) 
                         begin
                             if(ena[1]) begin
                             q[7:4] <= q[7:4] + 1;
                             end
                             else begin
                             q[7:4] <= q[7:4]; 
                             end
                         end
                     else if(ena[2])
                         q[7:4] <= 0;
                     else
                         q[7:4] <= q[7:4];
                 
                     
                     if(q[7:4] == 9)
                         begin
                             if(count1 == 8)
                                 begin
                                    ena[2] <= 1'b1;
                                    count1 <= 0;
                                 end
                             else
                                 begin
                                   count1 <= count1 + 1;
                                   ena[2] <= 1'b0;
                                 end
                          end
                          else
                          count1 <= 0;
                          
                 end
        end
    
    reg [6:0] count2;
    
        always @(posedge clk)
        begin
            if(reset)
                begin
                    q[11:8] <= 0;
                    ena[3] <= 1'b0;
                    count2 <= 0;
                end
            else
                 begin
                     if (q[11:8] <9) 
                         begin
                             if(ena[2]) begin
                                 q[11:8] <= q[11:8] + 1;
                             end
                             else begin
                                 q[11:8] <= q[11:8];
                             end
                         end
                     else if(ena[3])
                         q[11:8] <= 0;
                     else
                         q[11:8] <= q[11:8];
                     
                     if(q[11:8] == 9)
                         begin
                             if(count2 == 98)
                                 begin
                                     ena[3] <= 1'b1;
                                    count2 <= 0;
                                 end
                             else
                                 begin
                                   count2 <= count2 + 1;
                                     ena[3] <= 1'b0;
                                 end
                          end
                          else
                          count2 <= 0;
                 end
        end
    
    reg [10:0] count3;
    
      always @(posedge clk)
        begin
            if(reset)
                begin
                    q[15:12] <= 0;
                end
            else
                 begin
                     if (q[15:12] <9) 
                         begin
                             if(ena[3]) begin
                                 q[15:12] <= q[15:12] + 1;
                             end
                             else begin
                                 q[15:12] <= q[15:12];
                             end
                         end
                     else
                         begin
                             q[15:12] <= q[15:12];
                         end
                                          
                     if(q[15:12] == 9)
                         begin
                             if(count3 == 999)
                                 begin
                                    count3 <= 0;
                                     q[15:12] <= 0; 
                                 end
                             else
                                 begin
                                   count3 <= count3 + 1;
                                   
                                 end
                          end
                          else
                          count3 <= 0;
                     
                 end
        end
 

endmodule
