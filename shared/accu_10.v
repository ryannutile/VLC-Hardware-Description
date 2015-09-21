module accu10(out, enable_out, in, clk, rst);
	// Module to take a single bit input and turn it into a 10 bit output
	input in;
	input clk;
	input rst;
	reg [3:0] counter;
	reg [7:0] buffer;
	output wire [7:0] out;
	reg overflow;
	always@(posedge clk or negedge rst) begin
		if (counter == 7) begin
			out <= buffer;
			count <= counter + 1;
			enable_out <= 1;
		end else if(rst or counter > 7) begin
			counter <= 'b0;
			out <= 'b0;
			buffer <= 'b0;
			enable_out <= 'b0;
		end else begin
			{overflow, buffer} <= out + in;
			counter <= counter + 1;
		end
	end
endmodule