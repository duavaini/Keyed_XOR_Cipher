// xor_unit.v
module xor_unit(
    input  wire [7:0] data_in,
    input  wire [7:0] keystream,
    output wire [7:0] data_out
);
    assign data_out = data_in ^ keystream; // xors the  data_in and the key stream and stores it in data_output
endmodule
