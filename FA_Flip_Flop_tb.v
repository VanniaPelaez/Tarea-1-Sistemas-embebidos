`timescale 1ns/1ps     // Define la unidad de tiempo (1 ns) y la precisión (1 ps)
                       // para la simulación. Sirve para interpretar los retardos (#).

module FA_Flip_Flop_tb;   // Declaración del módulo de prueba (testbench) llamado FA_Flip_Flop_tb.

    reg D;             // Declaramos D como registro (reg), porque se asignará en bloques initial.
    reg clk;           // Señal de reloj, también tipo reg (se genera dentro del testbench).
    reg rst;           // Señal de reset, tipo reg.
    wire Q;            // Señal de salida del flip-flop, conectada como wire.

    // Instanciación del módulo a probar (DUT: Device Under Test).
    FA_Flip_Flop fa1 (    // Creamos una instancia llamada "fa1" del módulo FA_Flip_Flop.
		.D(D),           // Conectamos la entrada D del testbench a la entrada D del DUT.
		.clk(clk),       // Conectamos la señal clk del testbench al DUT.
		.rst(rst),       // Conectamos la señal rst del testbench al DUT.
		.Q(Q)            // Conectamos la salida Q del DUT a la señal Q del testbench.
    );

    initial begin          // Bloque inicial: se ejecuta una vez al inicio de la simulación.
		// Activar el reloj: inicializa clk en 0.
		clk = 0; 
        forever #10 clk = ~clk;  // Genera un reloj de periodo 20 ns (toggle cada 10 ns).
	end
	
	initial begin
        // Condiciones iniciales
        D = 0; rst = 0;      // Al inicio, D = 0 y reset = 0.

        // Aplicación de estímulos al DUT
		#10 D = 0; rst = 0;  // A los 10 ns: D=0, rst=0.
		#10 D = 0; rst = 1;  // A los 20 ns: D=0, reset=1 (reinicia el FF).
		#10 D = 1; rst = 0;  // A los 30 ns: D=1, reset=0 (flip-flop captura valor de D).
		#10 D = 0; rst = 1;  // A los 40 ns: D=0, reset=1 (reinicia nuevamente).
		#10                  // Espera 10 ns más.

		$finish;             // Finaliza la simulación en este punto.
    end

endmodule                // Fin del testbench.
