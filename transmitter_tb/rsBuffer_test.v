//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2015 12:55:46 PM
// Design Name: 
// Module Name: rsBuffer_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rsBuffer_test;
// outputs
wire [7:0] shiftOut;
// inputs
reg [63:0] shiftIn;
reg clk;
reg push;
reg pop;

rsBuffer uut(shiftOut, shiftIn, clk, push, pop);

initial begin
    clk = 0;
    forever
        #5 clk = ~clk;
end

initial begin
    #5;
    pop = 0;
    push = 1;
    shiftIn = {8'b11111111,8'b00000000,8'b11111111,8'b00000000,8'b11111111,8'b00000000,8'b11111111,8'b00000000};
    #10;
    
    shiftIn = {8'b01010101,8'b00000000,8'b10101010,8'b11111111,8'b01010101,8'b00000000,8'b01010101,8'b11111111};
    #10;
  
    shiftIn = 1024;
    #10;
    
    shiftIn = 4096;
    #10;
    
    shiftIn = 32768;
    #10;

    shiftIn = 65536;
    #10;
end

endmodule
