module top_module (
    input clk,
    input areset,
    input in,
    output reg out
);

    parameter A = 0, B = 1;
    reg state, next_state;

    // Combinational logic for next state
    always @(*) begin
        case (state)
            A:begin
                out=0;
                if (in)
                    next_state = A;
                else
                    next_state = B;
            end
            B:begin
                 out=1;
                if (in)
                    next_state = B;
                else
                    next_state = A;
            end
            default: next_state = B;
        endcase
    end

    // Synchronous state transition
    always @(posedge clk or posedge areset) begin
        if (areset)
            state <= B;
        else
            state <= next_state;
    end

    // Moore output logic (depends only on state)
    //we can directly give output within the case statement or else 
    /*we can do like this seperately
    always @(*) begin
        case (state)
            A: out = 0;
            B: out = 1 ;// You can change this to `1` if needed
            default: out = 0;
        endcase
    end*/

endmodule
