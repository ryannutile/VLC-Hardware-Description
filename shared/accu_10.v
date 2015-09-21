module accu10(out, enable_out, in, clk, rst);
	// Module to take a single bit input and turn it into a 10 bit output
	input in;
	input clk;
	input rst;
	reg [3:0] counter = 0;
	reg [7:0] buffer;
	output wire [7:0] out;
	reg overflow;
	always@(posedge clk or negedge rst) begin
		if (counter == 7) begin
			out <= buffer;
			buffer <= 'b0;
			count <= 'b0;
			enable_out <= 1;
		end else begin
			enable_out <= 'b0;
			{overflow, buffer} <= out + in;
			counter <= counter + 1;
		end
	end
endmodule