// 4-State Moore state machine
// A Moore machine's outputs are dependent only on the current state.
// The output is written only when the state changes.  (State
// transitions are synchronous.)

//OBS: O template dessa máquina pode ser encontrado no site da altera abaixo.
//http://www.altera.com/support/examples/verilog/ver-state-machine.html 

//Essa calculadora Soma e Subtrai.
//Entrada: 8 bits - data_in
//Saída: 8 bits - result
//Se o primeiro bit do data_in é '0', então soma.
//Se é '1',então subtrai.

module calculadora_soma_sub(reset, enter, data_in, result);
	input	reset, enter;
	input [7:0] data_in;
	output reg [7:0] result;
	
	// Declare state register
	reg [1:0]state;
	reg [7:0] reg_a, reg_b;
	reg [3:0] reg_op;
	wire overflow, zero, cout;
	wire [7:0] wire_result;
	reg [3:0] op_def;

	// Declare states
	//s0 = first  //pega o A // A = data_in
	//s1 = second //pega o B // B = data_in
	//s2 = operand // pega o operand // operador = data_in (1 ou 0)
	//s3 = calc and show //mostra o resultado
	parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3;
	
	//ula_of_infinity(a, b, op, cout, result, overflow, zero)
	ula_of_infinity ula_of_destiny (reg_a, reg_b, reg_op, cout, wire_result, overflow, zero);
	// Output depends only on the state
	always @ (state) begin
		case (data_in[0])
			1'b0:
				op_def = 4'b0010;
			1'b1:
				op_def = 4'b0110;
			default:
				op_def = 4'b0010;
		endcase
			
		case (state)
			S0:
				reg_a = data_in;
			S1:
				reg_b = data_in;
			S2:
				reg_op = op_def;
			S3:
				result = wire_result;
			default:
				reg_a = data_in;
			endcase
	end
	
	// Determine the next state
	always @ (posedge enter or posedge reset) begin
		if (reset)
			state <= S0;
		else
			case (state)
				S0:
						state <= S1;
				S1:
						state <= S2;
				S2:
						state <= S3;
				S3:
						state <= S0;
				default:
					state <= S0;
			endcase
	end
	
endmodule