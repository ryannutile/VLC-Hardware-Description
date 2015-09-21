//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2015 04:15:57 PM
// Design Name: 
// Module Name: rsBuffer
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


module rsBuffer(
    output reg [7:0] shiftOut,
    input [63:0] shiftIn,
    input clk,
    input push,
    input pop
    );
    
integer BUFF_SIZE = 512;
reg [7:0] dataBuffer [511:0]; // 8-bit buffer, depth 512
integer popLoc = 0; // buffer index to pop
integer pushLoc = 0; // buffer index to push
integer ovrwrError = 0; // flag for overwrite detection

always @(posedge clk)
begin
    // if push, store input in buffer as 8 separate bytes
    if(push)
    begin
      dataBuffer[pushLoc] = shiftIn[63:56];
      pushLoc = (pushLoc + 1) % BUFF_SIZE;
      dataBuffer[pushLoc] = shiftIn[55:48];
      pushLoc = (pushLoc + 1) % BUFF_SIZE;
      dataBuffer[pushLoc] = shiftIn[47:40];
      pushLoc = (pushLoc + 1) % BUFF_SIZE;
      dataBuffer[pushLoc] = shiftIn[39:32];
      pushLoc = (pushLoc + 1) % BUFF_SIZE;
      dataBuffer[pushLoc] = shiftIn[31:24];
      pushLoc = (pushLoc + 1) % BUFF_SIZE;
      dataBuffer[pushLoc] = shiftIn[23:16];
      pushLoc = (pushLoc + 1) % BUFF_SIZE;
      dataBuffer[pushLoc] = shiftIn[15:8];
      pushLoc = (pushLoc + 1) % BUFF_SIZE;
      dataBuffer[pushLoc] = shiftIn[7:0];
      pushLoc = (pushLoc + 1) % BUFF_SIZE;
    
    end
    
    if(pop)
    begin
      // if push/pop at same index, overwrite error, throw flag
      if(pushLoc == popLoc)
      begin
        ovrwrError = 1;
        $display("DATA OVERWRITTEN");
      end
      
      // otherwise, pop the buffer at the pop index
      // and increment the pop index
      shiftOut <= dataBuffer[popLoc];
      popLoc = (popLoc + 1) % BUFF_SIZE;
    end  
    
end
    
endmodule
