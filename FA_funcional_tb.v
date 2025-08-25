`timescale 1ns/1ps          // Unidad de tiempo = 1 ns, precisión = 1 ps para interpretar retardos (#).

module FA_funcional_tb;     // Declaración del testbench (no tiene puertos externos).

    reg a;                  // Señal de estímulo para la entrada 'a' del DUT.
    reg b;                  // Señal de estímulo para la entrada 'b'.
    reg c;                  // Señal de estímulo para la entrada 'c'.
    wire y0;                // Cable para observar la salida 'y0' (bit de suma) del DUT.
    wire y1;                // Cable para observar la salida 'y1' (acarreo) del DUT.

    // Instanciación del módulo a probar (Device Under Test, DUT)
    FA_funcional fa1 (      // Crea la instancia 'fa1' del módulo FA_funcional.
        .a(a),              // Conecta la señal local 'a' a la entrada 'a' del DUT.
        .b(b),              // Conecta 'b'.
        .c(c),              // Conecta 'c'.
        .y0(y0),            // Conecta la salida 'y0' del DUT al cable local 'y0'.
        .y1(y1)             // Conecta la salida 'y1' del DUT al cable local 'y1'.
    );

    initial begin           // Bloque inicial: genera la secuencia de estímulos una sola vez.

        // Condiciones iniciales
        a = 0; b = 0; c = 0;    // Arranque con todas las entradas en cero.

        // Todas las combinaciones posibles (8 casos para 3 bits)
        #10 a = 0; b = 0; c = 0;  // t=10ns  → (a,b,c) = 000
        #10 a = 0; b = 0; c = 1;  // t=20ns  → 001
        #10 a = 0; b = 1; c = 0;  // t=30ns  → 010
        #10 a = 0; b = 1; c = 1;  // t=40ns  → 011
        #10 a = 1; b = 0; c = 0;  // t=50ns  → 100
        #10 a = 1; b = 0; c = 1;  // t=60ns  → 101
        #10 a = 1; b = 1; c = 0;  // t=70ns  → 110
        #10 a = 1; b = 1; c = 1;  // t=80ns  → 111
        #10                     // t=90ns: espera extra para estabilización/observación final.

        $finish;               // Termina la simulación limpia y explícitamente.
    end

endmodule                  // Fin del testbench.
