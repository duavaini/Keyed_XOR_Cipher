// keystream_lfsr.v
module keystream_lfsr(
    input  wire        clk,                         //define clk                                                    
    input  wire        reset,                       //define reset
    input  wire        load_key,                    //define the load key
    input  wire [7:0]  key,                         // define the key
    output reg  [7:0]  keystream                    // define the output register keystream
);
    wire feedback;
    assign feedback = keystream[7] ^ keystream[5] ^ keystream[4] ^ keystream[3];
 //assign feedback the xor of bit 7 ,5,4,3
 // next block should run only when there is a rising edge on the clock or reset goes from zero to one
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            keystream <= 8'h01;                         // loads hexa decimal 01 into lfsr if reset is 1
        end else if (load_key) begin
            keystream <= (key == 8'h00) ? 8'h01 : key;  
            // if reset is not active but load_key is then load key into keystream but if all keys are 00 then we must replace with 01 to avoid lockup just as we did above
        end else begin
            keystream <= {keystream[6:0], feedback};
            // this is the normal lfsr if there is no reset and no load key
            // that is it shifts the register left and adds the feedback bit at rightmost bit(bit 0)
            // the feedback bit is a temp wire with value the xor of bit 7 5 4 3
        end
    end
endmodule
