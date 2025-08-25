module FA_Flip_Flop (
    input D, clk, rst,
    output Q
);

    reg Qn;
    assign Q = Qn;

    always @(posedge clk or posedge rst)
    begin
        if (rst == 1)
            Qn = 0;
        else
            Qn = D;
    end

endmodule
