module FA_funcional (
    input a, b, c,
    output y0, y1
);

    reg [1:0] y;

    assign y0 = y[0];
    assign y1 = y[1];

    always @(a or b or c)
    begin
        case ({a, b, c})
            3'b001 : y = 2'b01;
            3'b010 : y = 2'b01;
            3'b100 : y = 2'b01;
            3'b011 : y = 2'b10;
            3'b101 : y = 2'b10;
            3'b110 : y = 2'b10;
            3'b111 : y = 2'b11;
            default: y = 2'b00;
        endcase
    end

endmodule