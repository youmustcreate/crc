module crc16_generator_tb;
    reg           clk;
    reg           rst;
    reg  [95:0]   data_in;
    wire [15:0]   crc_16;
    reg           start;
    wire          valid;

    // Instantiate the crc16_generator module
    crc16_generator uut (
        .data_in_ori   (data_in  ),
        .clk           (clk      ),
        .rst           (rst      ),
        .start         (start    ),
        .valid         (valid    ),
        .crc_16        (crc_16  )
    );

    // Clock generation
    always begin                 //  100MHz
        #5 clk = ~clk;
    end

    initial begin
        // Initialize inputs
        clk = 0;
        rst = 1;

        // Provide input data
        data_in <= 96'hAA5500112233445566778899;
        // data_in <= 16'hAA55;
        start   <= 1;


        // Release reset after a few clock cycles
        #10 rst = 0;



        // Wait for some time
        #100;

        // Check the CRC output
        // if (crc_out == 16'h1234) begin
        //     $display("CRC16 Test Passed!");
        // end else begin
        //     $display("CRC16 Test Failed! Expected: 16'h1234, Actual: %h", crc_out);
        // end

        // End the simulation
        // $finish;
    end
endmodule
