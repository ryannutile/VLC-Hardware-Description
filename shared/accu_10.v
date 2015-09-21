module accu10(out, overflow, in, clk, rst);
	// Module to take a single bit input and turn it into a 10 bit output
	input in;
	input clk;
	input rst;
	output wire [9:0] out;
	output reg overflow;
	always@(posedge clk or negedge rst) begin
		if(rst) begin
			out <= 'b0;
			overflow <= 'b0;
		end else begin
			{overflow, out} <= out + A;
		end
	end
endmodule