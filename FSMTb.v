module FSMTb;
reg clk, areset,in;
wire out;
top_module uut (
    .clk(clk),
    .areset(areset),
    .in(in),
    .out(out)
);
initial begin 
    clk=0;
    areset=1;
    in=0;
end
always begin
    #5 clk = ~clk; // Clock generation
end
initial begin
    $dumpfile("FSMTb.vcd");
    $dumpvars(0, FSMTb);
end
initial begin
    // Initial state
    $monitor("clk=%b | areset=%b | in=%b |out=%b", clk, areset, in, out);
    #10 areset = 0; in = 0; #10
    in= 1; #10; // Transition to state 1
    in= 0; #10; // Transition to state 2
    in= 1; #10; // Transition to state 3
    in= 0; #10; // Transition to state 4
    in= 1; #10; // Transition to state 5
    in= 0; #10; // Transition to state 6
    $finish;
end
endmodule