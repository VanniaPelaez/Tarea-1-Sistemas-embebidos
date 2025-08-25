`timescale 1ns/1ps

module FA_Flip_Flop_tb;

    reg D;
    reg clk;
    reg rst;
    wire Q;

    // Instanciación del módulo sumador completo
    FA_Flip_Flop fa1 (	  
		.D(D),
		.clk(clk),
		.rst(rst),
		.Q(Q)
    );

    initial begin			  
		// activar el reloj
		clk = 0; forever #10 clk = ~clk;  
	end
	
	initial begin
        // Condiciones iniciales
        D = 0; rst = 0;

        // Todas las combinaciones posibles
		#10 D = 0; rst = 0;
		#10 D = 0; rst = 1;
		#10 D = 1; rst = 0;	 
		#10 D = 0; rst = 1;	  
		#10
		$finish;
		
    end

endmodule