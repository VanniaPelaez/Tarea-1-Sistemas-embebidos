module FA_funcional (           // Declaración del módulo llamado FA_funcional.
    input a, b, c,              // Entradas de 1 bit: a, b y c (dos operandos + acarreo de entrada).
    output y0, y1               // Salidas de 1 bit: y0 (suma), y1 (acarreo).
);

    reg [1:0] y;                // Registro de 2 bits para guardar temporalmente el resultado:
                                // y[0] = suma, y[1] = acarreo.

    assign y0 = y[0];           // Conexión: la salida y0 refleja el bit menos significativo de y.
    assign y1 = y[1];           // Conexión: la salida y1 refleja el bit más significativo de y.

    always @(a or b or c)       // Bloque secuencial que se ejecuta cada vez que cambia alguna entrada.
    begin
        case ({a, b, c})        // Se evalúa el vector de 3 bits formado por {a, b, c}.
                                // Esto corresponde a todas las combinaciones posibles de las entradas.
            3'b001 : y = 2'b01; // Caso: a=0, b=0, c=1 → suma=1, acarreo=0 → (y1,y0)=01.
            3'b010 : y = 2'b01; // Caso: a=0, b=1, c=0 → suma=1, acarreo=0.
            3'b100 : y = 2'b01; // Caso: a=1, b=0, c=0 → suma=1, acarreo=0.
            3'b011 : y = 2'b10; // Caso: a=0, b=1, c=1 → suma=0, acarreo=1.
            3'b101 : y = 2'b10; // Caso: a=1, b=0, c=1 → suma=0, acarreo=1.
            3'b110 : y = 2'b10; // Caso: a=1, b=1, c=0 → suma=0, acarreo=1.
            3'b111 : y = 2'b11; // Caso: a=1, b=1, c=1 → suma=1, acarreo=1.
            default: y = 2'b00; // Caso por defecto: suma=0, acarreo=0 (seguridad).
        endcase
    end

endmodule                       // Fin del módulo.
