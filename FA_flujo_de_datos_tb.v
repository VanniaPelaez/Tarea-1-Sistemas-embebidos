`timescale 1ns/1ps              // Define la escala de tiempo para la simulación:
                                // unidad de tiempo = 1 ns, precisión = 1 ps.

module FA_flujo_de_datos_tb;    // Declaración del módulo testbench (no tiene entradas/salidas externas).

    reg a;                      // Señal de prueba para la entrada 'a' del DUT.
    reg b;                      // Señal de prueba para la entrada 'b'.
    reg c;                      // Señal de prueba para la entrada 'c'.
    wire y0;                    // Señal conectada a la salida 'y0' del DUT (suma).
    wire y1;                    // Señal conectada a la salida 'y1' del DUT (acarreo).

    // Instanciación del módulo sumador completo (Device Under Test - DUT).
    FA_flujo_de_datos fa1 (     // Se crea una instancia del módulo a probar llamada "fa1".
        .a(a),                  // Conexión de la señal 'a' del testbench a la entrada 'a' del DUT.
        .b(b),                  // Conexión de la señal 'b' al DUT.
        .c(c),                  // Conexión de la señal 'c' al DUT.
        .y0(y0),                // Conexión de la salida 'y0' del DUT al testbench.
        .y1(y1)                 // Conexión de la salida 'y1' del DUT al testbench.
    );

    initial begin               // Bloque inicial: genera estímulos de prueba.

        // Condiciones iniciales
        a = 0; b = 0; c = 0;    // Al inicio, todas las entradas están en 0.

        // Aplicación de todas las combinaciones posibles (8 casos en total).
        #10 a = 0; b = 0; c = 0;   // Tiempo 10 ns: entradas (0,0,0).
        #10 a = 0; b = 0; c = 1;   // Tiempo 20 ns: entradas (0,0,1).
        #10 a = 0; b = 1; c = 0;   // Tiempo 30 ns: entradas (0,1,0).
        #10 a = 0; b = 1; c = 1;   // Tiempo 40 ns: entradas (0,1,1).
        #10 a = 1; b = 0; c = 0;   // Tiempo 50 ns: entradas (1,0,0).
        #10 a = 1; b = 0; c = 1;   // Tiempo 60 ns: entradas (1,0,1).
        #10 a = 1; b = 1; c = 0;   // Tiempo 70 ns: entradas (1,1,0).
        #10 a = 1; b = 1; c = 1;   // Tiempo 80 ns: entradas (1,1,1).

    end

endmodule                       // Fin del testbench.
