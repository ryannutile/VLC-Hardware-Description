module inputBuffer_test;
// outputs
wire [31:0] shiftOut;
// inputs
reg clock;
reg pop;
reg [7:0] shiftIn;


inputBuffer uut(shiftOut, shiftIn, pop, clock);

initial begin
    clock = 0;
    forever
        #5 clock = ~clock;
end

initial begin
    #5;
    pop = 0;
    shiftIn = 8'b00000001;
    #10;
    
    pop = 0;
    shiftIn = 8'b00000010;
    #10;
    
    pop = 0;
    shiftIn = 8'b00000100;
    #10;
    
    pop = 0;
    shiftIn = 8'b00001000;
    #10;
    
    pop = 0;
    shiftIn = 8'b00010000;
    #10;
    
    pop = 0;
    shiftIn = 8'b00100000;
    #10;
    
    pop = 0;
    shiftIn = 8'b01000000;
    #10;
    
    pop = 0;
    shiftIn = 8'b10000000;
    #10;
    
    pop = 0;
    shiftIn = 8'b00000011;
    #10;
    
    pop = 0;
    shiftIn = 8'b00000110;
    #10;
    
    pop = 0;
    shiftIn = 8'b00001100;
    #10;
    
    pop = 0;
    shiftIn = 8'b00011000;
    #10;
    
    pop = 0;
    shiftIn = 8'b00110000;
    #10;
    
    pop = 0;
    shiftIn = 8'b01100000;
    #10;
    
    pop = 0;
    shiftIn = 8'b11000100;
    #10;
    
    pop = 0;
    shiftIn = 8'b00000111;
    #10;
    
    pop = 0;
    shiftIn = 8'b00001110;
    #10;
    
    pop = 0;
    shiftIn = 8'b00011100;
    #10;
    
    pop = 0;
    shiftIn = 8'b00111000;
    #10;
    
    pop = 0;
    shiftIn = 8'b01110000;
    #10;
    
    pop = 0;
    shiftIn = 8'b11100000;
    #10;
    
    pop = 0;
    shiftIn = 8'b00001111;
    #10;
    
    pop = 0;
    shiftIn = 8'b11110000;
    #10;
    
    pop = 1;
    shiftIn = 8'b00011111;
    #10;
    
end

endmodule