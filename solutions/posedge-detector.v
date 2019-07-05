//For each bit in an 8-bit vector, detect when the input signal changes from 0 in one clock 
//cycle to 1 the next (similar to positive edge detection). The output bit should be set the cycle 
//after a 0 to 1 transition occurs.

//************SOLUTION****************//
//output is set after one clock cycle delay

module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    
    reg [7:0] temp;
    wire [7:0] temp_out;
    
    always @(posedge clk)
        begin
            temp <= in;
        end
    
    assign temp_out = in & ~temp;
    
    always @(posedge clk)
        begin
            pedge <=temp_out;
        end
    

endmodule
