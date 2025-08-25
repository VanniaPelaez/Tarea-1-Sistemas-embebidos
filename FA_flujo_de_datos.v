module FA_flujo_de_datos (
    input a, b, c,
    output y0, y1
);

    wire [2:0] x;

    assign x[0] = b ^ c;
    assign x[1] = b & c;
    assign x[2] = a & x[0];

    assign y0 = a ^ x[0];
    assign y1 = x[1] || x[2];

endmodule
