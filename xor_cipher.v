// xor_cipher.v
module xor_cipher(
    input  wire        clk,
    input  wire        reset,
    input  wire        load_key,
    input  wire [7:0]  data_in,   // plaintext or ciphertext as lfsr decoding and encoding uses the same operation
    input  wire [7:0]  key,       // this is the keystream genereated key tht is used to encrypt  
    output wire [7:0]  data_out   // result after xor it could be cipher text or the plain text depending on data_in
);
    wire [7:0] ks;

    keystream_lfsr ks_gen (
        // calls the keystream generation function
        .clk(clk),
        .reset(reset),
        .load_key(load_key),
        .key(key),
        .keystream(ks)
    );

    xor_unit xu (
        // calls the xor_unit module which is used to actually xor the keystream and data_in
        .data_in(data_in),
        .keystream(ks),
        .data_out(data_out)
    );
endmodule
