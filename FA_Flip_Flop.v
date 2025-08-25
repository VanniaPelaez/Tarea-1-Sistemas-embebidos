module FA_Flip_Flop (
    input D, clk, rst,   // Declaramos las entradas: 
                         // D = dato a almacenar en el flip-flop,
                         // clk = señal de reloj,
                         // rst = reset (reinicio asíncrono).
    output Q             // Declaramos la salida Q del flip-flop.
);

    reg Qn;              // Definimos una variable tipo registro (reg) llamada Qn 
                         // que se usará para almacenar el estado interno del flip-flop.

    assign Q = Qn;       // Asignamos la salida Q al valor almacenado en Qn 
                         // (la salida siempre refleja el estado interno).

    always @(posedge clk or posedge rst)  // Bloque secuencial sensible al flanco positivo del reloj (clk)
                                          // o al flanco positivo del reset (rst).
    begin
        if (rst == 1)    // Si la señal de reset está activa (en alto),
            Qn = 0;      // entonces forzamos Qn a 0 (reiniciamos el flip-flop).
        else
            Qn = D;      // De lo contrario, en cada flanco de subida del reloj,
                         // Qn toma el valor de la entrada D (almacena el dato).
    end

endmodule              // Fin de la descripción del módulo FA_Flip_Flop.
