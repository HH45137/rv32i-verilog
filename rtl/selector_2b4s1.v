module selector_2b4s1(
    input   wire    [1:0]   in_0        ,
    input   wire    [1:0]   in_1        ,
    input   wire    [1:0]   in_2        ,
    input   wire    [1:0]   in_3        ,
    input   wire    [1:0]   control_in  ,

    output  reg     [1:0]   out         
);

always @(*) begin
    case (control_in)
        2'b00:      out = in_0;
        2'b01:      out = in_1;
        2'b10:      out = in_2;
        2'b11:      out = in_3;
        default:    out = in_0;
    endcase
end

initial begin            
    $dumpfile("./sim/wave.vcd");
    $dumpvars(0, selector_2b4s1);
end
    
endmodule