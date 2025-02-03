`timescale 1ns/1ns

module tb_selector_2b4s1();

reg    [1:0]   in_0         ;
reg    [1:0]   in_1         ;
reg    [1:0]   in_2         ;
reg    [1:0]   in_3         ;
reg    [1:0]   control_in   ;

wire     [1:0]   out        ;

initial begin
    in_0        <= 2'b0;
    in_1        <= 2'b0;
    in_2        <= 2'b0;
    in_3        <= 2'b0;
    control_in  <= 2'b0;
end

always #10 in_0         <= {$random} % 4;
always #10 in_1         <= {$random} % 4;
always #10 in_2         <= {$random} % 4;
always #10 in_3         <= {$random} % 4;
always #10 control_in   <= {$random} % 4;

initial begin
    $timeformat(-9, 0, "ns", 6);
    $monitor("@time %t:in_0=%b in_1=%b in_2=%b in_3=%b control_in=%b out=%b", $time, in_0, in_1, in_2, in_3, control_in, out);
end

selector_2b4s1 selector_2b4s1_inst (
    .in_0(in_0),
    .in_1(in_1),
    .in_2(in_2),
    .in_3(in_3),
    .control_in(control_in),
    .out(out)
);

endmodule
