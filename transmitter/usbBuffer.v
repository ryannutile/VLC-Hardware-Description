//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2015 04:15:57 PM
// Design Name: 
// Module Name: usbBuffer
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


// NOTE : CURRENTLY WILL OVERWRITE IF FULL, BUT THROWS ERROR FLAG

module usbBuffer(
    output reg [31:0] shiftOut,
    input [7:0] shiftIn,
    input clk,
    input pop
    );
    
integer BUFF_SIZE = 64;
reg[31:0] dataBuffer [63:0]; // 32-bit buffer, depth 64
reg[31:0] bytesIn = 0; // 32-bit accumulator
integer popLoc = 0; // buffer index to pop
integer pushLoc = 0; // buffer index to push
integer bytesGot = 0; // bytes currently stored in accumulator
integer byteIndex = 0; // index for accumulator loop
integer dataReady = 0; // flag indicating buffer has fresh data to pop

/* Need to figure out how we want to deal with buffer full / empty errors...
-In final implementation they should never occur, so this is more for debugging purposes */
integer ovrwrError = 0; // flag indicating valid data has been overwritten

always @(posedge clk)
begin
  
  // MSB first accumulator implementation
  for(byteIndex=0; byteIndex < 8; byteIndex = byteIndex+1)
  begin
    bytesIn[8*bytesGot+byteIndex] = shiftIn[byteIndex];
  end
  
  bytesGot = bytesGot + 1; // track bytes in accumulator
  
  // when accumulator full, push contents to buffer
  // and reset all relevant counters / indices
  if(bytesGot == 4)
  begin
    // if push/pop at same index and data ready,
    // overwrite error is occurring, throw flag
    // (dataReady prevents this error from throwing on 1st entry)
    if(pushLoc == popLoc && dataReady)
    begin
      ovrwrError = 1;
      $display("DATA OVERWRITTEN");
    end
    dataBuffer[pushLoc] = bytesIn;
    bytesIn = 0;
    bytesGot = 0;
    dataReady = 1;
    pushLoc = (pushLoc + 1) % BUFF_SIZE; // circular buffer implementation
  end
  
  // if new data to pop and pop is high,
  // shift out contents of buffer at pop location,
  // increment the pop location, and check if there
  // is still more fresh data
  if(pop && dataReady)
  begin
    shiftOut <= dataBuffer[popLoc];
    popLoc = (popLoc + 1) % BUFF_SIZE; // circular buffer implementation
    dataReady = (pushLoc - popLoc) > 0; // if push/pop not same, still fresh data
  end
  
end
    
endmodule
