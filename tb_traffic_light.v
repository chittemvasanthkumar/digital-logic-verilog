module tb_traffic_light;
    reg clk, reset;
    wire red, yellow, green;

    traffic_light uut (
        .clk(clk),
        .reset(reset),
        .red(red),
        .yellow(yellow),
        .green(green)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        #10 reset = 0;
        #100 $stop;
    end
endmodule
