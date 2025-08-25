`timescale 1ns/1ps         // Define la escala de tiempo para la simulación:
                           // unidad de tiempo = 1 ns, precisión = 1 ps.

module FA_estructural_tb;  // Declaración del testbench (no tiene entradas/salidas externas).

    reg a;                 // Señal de prueba para la entrada 'a' del DUT (Device Under Test).
    reg b;                 // Señal de prueba para la entrada 'b'.
    reg c;                 // Señal de prueba para la entrada 'c'.
    wire y0;               // Señal de salida conectada al DUT: bit de suma.
    wire y1;               // Señal de salida conectada al DUT: bit de acarreo.

    // Instanciación del módulo sumador completo (Device Under Test).
    FA_estructural fa1 (   // Creamos una instancia llamada "fa1".
        .a(a),             // Conecta la señal 'a' del testbench a la entrada 'a' del DUT.
        .b(b),             // Conecta 'b'.
        .c(c),             // Conecta 'c'.
        .y0(y0),           // Conecta la salida de suma 'y0'.
        .y1(y1)            // Conecta la salida de acarreo 'y1'.
    );

    initial begin          // Bloque inicial que define los estímulos de prueba.

        // Condiciones iniciales
        a = 0; b = 0; c = 0;   // Todas las entradas comienzan en 0.

        // Aplicación de todas las combinaciones posibles de entradas
        #10 a = 0; b = 0; c = 0;  // Tiempo 10 ns: caso (0,0,0).
        #10 a = 0; b = 0; c = 1;  // Tiempo 20 ns: caso (0,0,1).
        #10 a = 0; b = 1; c = 0;  // Tiempo 30 ns: caso (0,1,0).
        #10 a = 0; b = 1; c = 1;  // Tiempo 40 ns: caso (0,1,1).
        #10 a = 1; b = 0; c = 0;  // Tiempo 50 ns: caso (1,0,0).
        #10 a = 1; b = 0; c = 1;  // Tiempo 60 ns: caso (1,0,1).
        #10 a = 1; b = 1; c = 0;  // Tiempo 70 ns: caso (1,1,0).
        #10 a = 1; b = 1; c = 1;  // Tiempo 80 ns: caso (1,1,1).

        #10                   // Espera adicional de 10 ns (tiempo 90 ns).
        $finish;              // Termina la simulación.
    end

endmodule                  // Fin del testbench.
