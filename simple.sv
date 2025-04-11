module simple (clk, reset, SW, LEDR);
	input logic clk, reset;
	input logic [1:0] SW;
	output logic [2:0]LEDR;
	
	// State variables
	enum logic [1:0] { s00, s01, s10, s11 } ps, ns;

	// Next State logic
	always_comb begin
		case (ps)
			s00: 
				if (~SW[0] && ~SW[1]) ns = s10;
				else if (~SW[0] && SW[1]) ns = s11;
				else if(SW[0] && ~SW[1]) ns = s01;
				else ns = s00;
			s01: 
				if (~SW[0] && ~SW[1]) ns = s00;
				else if (~SW[0] && SW[1]) ns = s11;
				else if(SW[0] && ~SW[1]) ns = s10;
				else ns = s00;
					
			s10: 
				if (~SW[0] && ~SW[1]) ns = s00;
				else if (~SW[0] && SW[1]) ns = s01;
				else if(SW[0] && ~SW[1]) ns = s11;
				else ns = s00;
					
			s11:
				if (~SW[0] && ~SW[1]) ns = s00;
				else if (~SW[0] && SW[1]) ns = s10;
				else if(SW[0] && ~SW[1]) ns = s01;
				else ns = s00;

		endcase
	end

	// Output logic - could also be another always_comb block.
	always_comb begin
		case (ps)
			s00: 
				LEDR = 3'b101;
			
			s01: 
				LEDR = 3'b001;
					
			s10: 
				LEDR = 3'b010;
					
			s11:
				LEDR = 3'b100;
				
		endcase
	end
	
	
	// DFFs
	always_ff @(posedge clk) begin
		if (~reset)
			ps <= s00;
		else
			ps <= ns;
	end
endmodule

module simple_testbench();
	logic clk, reset, w;
	logic out;
	simple dut (clk, reset, w, out);

	// Set up a simulated clock.
	parameter CLOCK_PERIOD=100;

	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk; // Forever toggle the clock
	end

	// Set up the inputs to the design. Each line is a clock cycle.
	initial begin
								@(posedge clk);
		reset <= 1;          @(posedge clk); //Always reset FSMs at start
		reset <= 0; w <= 0; @(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
						w <= 1; @(posedge clk);
						w <= 0; @(posedge clk);
						w <= 1; @(posedge clk);
					repeat (5) @(posedge clk);
						w <= 0; @(posedge clk);
								@(posedge clk);
		$stop; // End the simulation.
	end
endmodule
