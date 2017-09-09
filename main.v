// Verilog LED blink pattern code
// Be sure that the top level entity and module name match
// Using Quartus II 14.1.0
// "LC Technology EPM240" cheap eBay CPLD development board

module MaxII_Blinky(clk, led);

input clk;
output led;

reg led;
reg [24:0] counter;
reg [3:0] state;

always @(posedge clk)
	begin
		// This "dev board has a 50MHz clock
		// 1/4 second = 12.5M cycles
		if ( counter < 12500000 )
			begin
				counter <= counter + 1;
			end
		else
			begin
				counter <= 0;
			end
	end

always @(posedge clk)
	begin
		if ( counter == 12500000 )
			begin
				if ( state <= 3 | state == 5 | state == 7 )
					begin
						led <= 1;
					end
				else
					begin
						led <= 0;
					end
				
				if ( state == 7)
					begin
						state <= 0;
					end
				else
					begin
						state <= state + 1;
					end
			end // if (counter)
	end // always
	
endmodule