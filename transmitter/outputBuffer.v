//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2015 04:15:57 PM
// Design Name: 
// Module Name: outputBuffer
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


module outputBuffer(
    input [7:0] shiftIn,
    input push,
    input pop,
    input clk,
    output reg [7:0] shiftOut
    );
    
integer BUFF_SIZE = 1024;
reg dataBuffer [1023:0];
integer popLoc = 0;
integer pushLoc = 0;

always @(posedge clk)
begin
    if(push)
    begin
        dataBuffer[pushLoc] = shiftIn;
        pushLoc = (pushLoc + 1) % BUFF_SIZE;
    end
    
    if(pop)
    begin
        shiftOut <= dataBuffer[popLoc];
        //dataBuffer[popLoc] = 0; // clear buffer at the popped location
        popLoc = (popLoc + 1) % BUFF_SIZE;
    end
    
    
end
    
endmodule
