module ControlUnit (
    input  logic clk,
    input  logic reset,
    output logic AsrcMuxSel,
    output logic AEn,
    input  logic ALt10,
    output logic OutBuf
);


    localparam S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4;
    logic [2:0] state, state_next;

    always_ff @(posedge clk, posedge reset) begin
        if (reset) state <= S0;
        else state <= state_next;
    end


    always_comb begin
        state_next = state;
        AsrcMuxSel = 0;
        AEn = 1;
        OutBuf = 0;
        case (state)
            S0: begin
                AsrcMuxSel = 0;
                AEn = 1;
                OutBuf = 0;
                state_next = S1;
            end

            S1: begin
                AsrcMuxSel = 0;
                AEn = 0;
                OutBuf = 0;
                if (ALt10) state_next = S2;
                else state_next = S4;
            end


            S2: begin
                AsrcMuxSel = 0;
                AEn = 0;
                OutBuf = 1;
                state_next = S3;
            end

            S3: begin
                AsrcMuxSel = 0;
                AEn = 0;
                OutBuf = 0;
                state_next = S4;
            end

        endcase
    end




endmodule



