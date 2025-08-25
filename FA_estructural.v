module FA_estructural (       // Declaración del módulo llamado FA_estructural.
    input a, b, c,            // Entradas de 1 bit: a, b y c (típicamente Cin).
    output y0, y1             // Salidas de 1 bit: y0 (suma) y y1 (acarreo).
);

    reg [1:0] y;              // Registro de 2 bits para guardar el resultado {y1,y0}.
                              // OJO: 'reg' se usa para asignaciones en bloques always.
                              // Con 'assign' (asignación continua) debería ser 'wire'.

    assign y = a + b + c;     // Asignación continua: suma de tres bits (resultado cabe en 2 bits).
                              // y[0] será la suma (LSB) y y[1] el acarreo (MSB).
                              // ILEGAL en Verilog estándar: 'assign' no puede escribir a 'reg'.

    assign y0 = y[0];         // Conecta el bit menos significativo (suma) a la salida y0.
    assign y1 = y[1];         // Conecta el bit más significativo (acarreo) a la salida y1.

endmodule                     // Fin del módulo.
