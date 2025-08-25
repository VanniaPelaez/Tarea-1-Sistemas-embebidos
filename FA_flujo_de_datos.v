module FA_flujo_de_datos (     // Declaración del módulo llamado FA_flujo_de_datos.
    input a, b, c,             // Entradas de 1 bit: a, b, c (dos operandos + acarreo de entrada).
    output y0, y1              // Salidas de 1 bit: y0 = suma, y1 = acarreo de salida.
);

    wire [2:0] x;              // Vector de 3 bits de tipo wire para señales intermedias.

    assign x[0] = b ^ c;       // x[0] = XOR de b y c (suma parcial de esos dos bits).
    assign x[1] = b & c;       // x[1] = AND de b y c (acarreo generado entre b y c).
    assign x[2] = a & x[0];    // x[2] = AND de a con la suma parcial (acarreo entre a y (b⊕c)).

    assign y0 = a ^ x[0];      // y0 = XOR de a con la suma parcial (bit de suma final).
    assign y1 = x[1] || x[2];  // y1 = acarreo de salida, es la OR de los dos acarreos parciales.
                               // Aquí se usa '||' (OR lógico), aunque lo más común es '|'
                               // (OR bit a bit). Para señales de 1 bit funcionan igual,
                               // pero lo recomendado es usar '|'.

endmodule                      // Fin del módulo.
