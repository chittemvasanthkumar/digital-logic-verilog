module traffic_light (
    input wire clk,
    input wire reset,
    output reg red,
    output reg yellow,
    output reg green
);

    // State encoding
    parameter RED    = 2'b00;
    parameter GREEN  = 2'b01;
    parameter YELLOW = 2'b10;

    reg [1:0] state, next_state;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= RED;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            RED:    next_state = GREEN;
            GREEN:  next_state = YELLOW;
            YELLOW: next_state = RED;
            default: next_state = RED;
        endcase
    end

    // Output logic (Moore)
    always @(*) begin
        red = 0; yellow = 0; green = 0;
        case (state)
            RED:    red = 1;
            GREEN:  green = 1;
            YELLOW: yellow = 1;
        endcase
    end
endmodule
