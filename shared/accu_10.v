module accu10(out, overflow, in, clk, rst);
	// Module to take a single bit input and turn it into a 10 bit output
	input in;
	input clk;
	input rst;
	reg [3:0] counter;
	output wire [9:0] out;
	output reg overflow;
	always@(posedge clk or negedge rst) begin
		if(rst or counter > 10) begin
			counter <= 'b0;
			out <= 'b0;
			overflow <= 'b0;
		end else begin
			{overflow, out} <= out + in;
			counter <= counter + 1
		end
	end
endmodule