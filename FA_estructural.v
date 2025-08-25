module FA_estructural (
    input a, b, c,
    output y0, y1
);

    reg [1:0] y;

    assign y = a + b + c;
    assign y0 = y[0];
    assign y1 = y[1];

endmodule
