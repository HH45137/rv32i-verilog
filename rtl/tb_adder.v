`timescale 1ns/1ns

module tb_adder#(
    parameter WIDTH = 8
)();

// inputs
reg    [WIDTH-1:0]     in_x            ;
reg    [WIDTH-1:0]     in_y            ;

// unsigned
wire    [WIDTH-1:0]     out_result      ;
wire                    out_carry       ;
wire                    out_overflow    ;
// signed
wire    [WIDTH-1:0]     out_result_signed      ;
wire                    out_carry_signed       ;
wire                    out_overflow_signed    ;

// unsigned
initial begin
    in_x            <= 8'b0;
    in_y            <= 8'b0;
end

// unsigned and signed
always #10 in_x <= $signed($urandom_range(2**(WIDTH-1)-1, -(2**(WIDTH-1))));
always #10 in_y <= $signed($urandom_range(2**(WIDTH-1)-1, -(2**(WIDTH-1))));

// unsigned
adder #(.WIDTH(WIDTH), .SIGNED(0)) adder_unsigned_inst(
    .in_x(in_x),
    .in_y(in_y),
    .out_result(out_result),
    .out_carry(out_carry),
    .out_overflow(out_overflow)
);

// signed
adder #(.WIDTH(WIDTH), .SIGNED(1)) adder_signed_inst(
    .in_x(in_x),
    .in_y(in_y),
    .out_result(out_result_signed),
    .out_carry(out_carry_signed),
    .out_overflow(out_overflow_signed)
);

endmodule