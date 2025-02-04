module adder
#(
    parameter WIDTH = 8,
    parameter SIGNED = 0
)
(
    input   wire    [WIDTH-1:0]     in_x           ,
    input   wire    [WIDTH-1:0]     in_y           ,

    output  wire    [WIDTH-1:0]     out_result     ,
    output  wire                    out_carry      ,
    output  wire                    out_overflow
);

// Calculate result and carry (no signed)
assign {out_carry, out_result} = in_x + in_y;

generate
    // Use for signed number
    if (SIGNED) begin
        wire    signed  [WIDTH-1:0]     s_x = in_x;
        wire    signed  [WIDTH-1:0]     s_y = in_y;
        wire    signed  [WIDTH-1:0]     s_result = s_x + s_y;
        // Calculate it's overflow
        assign out_overflow = (s_x[WIDTH-1] == s_y[WIDTH-1]) && (s_result[WIDTH-1] != s_x[WIDTH-1]);
    end else begin
        assign out_overflow = 1'b0;
    end
endgenerate

initial begin            
    $dumpfile("./sim/wave.vcd");
    $dumpvars(0, adder);
end

endmodule