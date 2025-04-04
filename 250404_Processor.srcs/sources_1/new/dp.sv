module DataPath (
    input logic clk,
    input logic reset,
    input logic AsrcMuxSel,
    input logic AEn,
    output logic ALt10,
    input logic OutBuf,
    output logic [7:0] outPort


);

endmodule



module register (
    input logic clk,
    input logic reset,
    input logic en,
    input logic [7:0] d,  //input
    output logic [7:0] q  //output
);

    always_ff @(posedge clk, posedge reset) begin  //ff설계
        if (reset) begin
            q <= 0;
        end else begin
            if (en) begin
                q <= d;
            end
        end

    end

endmodule


module adder (
    input  logic [7:0] a,
    input  logic [7:0] b,
    output logic [7:0] sum
);
    assign sum = a + b;


endmodule


module comparator (
    input logic [7:0] a,
    input logic [7:0] b,
    output logic lt
);

    assign lt = a < b;

endmodule
