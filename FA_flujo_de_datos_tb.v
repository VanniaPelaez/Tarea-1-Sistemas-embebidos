`timescale 1ns/1ps

module FA_flujo_de_datos_tb;

    reg a;
    reg b;
    reg c;
    wire y0;
    wire y1;

    // Instanciación del módulo sumador completo
    FA_flujo_de_datos fa1 (
        .a(a),
        .b(b),
        .c(c),
        .y0(y0),
        .y1(y1)
    );

    initial begin
        // Condiciones iniciales
        a = 0; b = 0; c = 0;

        // Todas las combinaciones posibles
        #10 a = 0; b = 0; c = 0;
        #10 a = 0; b = 0; c = 1;
        #10 a = 0; b = 1; c = 0;
        #10 a = 0; b = 1; c = 1;
        #10 a = 1; b = 0; c = 0;
        #10 a = 1; b = 0; c = 1;
        #10 a = 1; b = 1; c = 0;
        #10 a = 1; b = 1; c = 1;
    end

endmodule
