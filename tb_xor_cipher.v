`timescale 1ns / 1ps

module tb_xor_cipher;
    reg clk;
    reg reset;
    reg load_key;
    reg [7:0] key;
    reg [7:0] plaintext;
    wire [7:0] ciphertext;
    wire [7:0] decrypted;

    // Encryption instance
    xor_cipher enc (
        .clk(clk),
        .reset(reset),
        .load_key(load_key),
        .data_in(plaintext),
        .key(key),
        .data_out(ciphertext)
    );

    // Decryption instance
    xor_cipher dec (
        .clk(clk),
        .reset(reset),
        .load_key(load_key),
        .data_in(ciphertext),
        .key(key),
        .data_out(decrypted)
    );

    // clock
    initial clk = 0;
    always #5 clk = ~clk;

    // A reusable test task
    task run_test;
        input [7:0] key_in;
        input [7:0] plaintext_in;
        begin
            reset = 1;
            load_key = 0;
            key = key_in;
            plaintext = 8'h00;
            #10;
            reset = 0;

            load_key = 1; #10;
            load_key = 0; #10;

            plaintext = plaintext_in;
            #10;
            $display("KEY=%h  PLAINTEXT=%h  -->  CIPHERTEXT=%h  DECRYPTED=%h",
                     key, plaintext, ciphertext, decrypted);
            #10;
        end
    endtask

    initial begin
        $dumpfile("sim/xor_cipher.vcd");
        $dumpvars(0, tb_xor_cipher);
        $display("\n--- XOR Cipher Simulation Started ---\n");

        // << TEST CASES BEGIN >>
        // --- Original test cases ---
        run_test(8'hB3, 8'hCA); // Test 1
        run_test(8'hAC, 8'h41); // Test 2
        run_test(8'h00, 8'hFF); // Test 3
        run_test(8'hB3, 8'h4F); // added from terminal
        // << TEST CASES END >>

        #20;
        $display("\n--- Simulation Finished ---\n");
        $finish;
    end
endmodule
