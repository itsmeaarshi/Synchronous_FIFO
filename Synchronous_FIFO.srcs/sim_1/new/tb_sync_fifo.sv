`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.11.2026 17:13:09
// Design Name: 
// Module Name: tb_sync_fifo
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_sync_fifo;

    // Parameters
    parameter DATA_WIDTH = 8;
    parameter DEPTH = 8;

    // Testbench signals
    logic clk;
    logic rst;
    logic wr_en;
    logic rd_en;
    logic [DATA_WIDTH-1:0] data_in;

    logic [DATA_WIDTH-1:0] data_out;
    logic full;
    logic empty;

    // DUT (Device Under Test) instantiation
    sync_fifo #(
        .DATA_WIDTH(DATA_WIDTH),
        .DEPTH(DEPTH)
    ) DUT (
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty)
    );

    // Task to check FIFO flags
    task check_flag;
        input logic expected_full;
        input logic expected_empty;

        begin
            if (full !== expected_full || empty !== expected_empty)
                $display("TEST FAILED: full=%b, empty=%b | Expected full=%b, empty=%b",
                         full, empty, expected_full, expected_empty);
            else
                $display("TEST PASSED: full=%b, empty=%b", full, empty);
        end
    endtask

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test stimulus
    initial begin
        rst     = 1;
        wr_en   = 0;
        rd_en   = 0;
        data_in = 0;

        // Hold reset for 2 clock cycles
        repeat (2) @(posedge clk);
        @(negedge clk);

        // Release reset
        rst = 0;

        // Check FIFO status after reset
        @(posedge clk);
        #1;
        check_flag(1'b0, 1'b1);

        if (data_out !== 8'h00)
            $display("TEST FAILED: data_out should be 00 after reset");
        else
            $display("TEST PASSED: data_out reset correctly");

        // Write first data
        @(negedge clk);
        wr_en = 1;
        data_in = 8'hA5;
        
        @(posedge clk);
        #1;
        check_flag(1'b0, 1'b0);
        
        @(negedge clk);
        wr_en = 0;
        // Read first data
        @(negedge clk);
        rd_en = 1;

        @(negedge clk);
        rd_en = 0;
        #1;

        // Read first data
        @(negedge clk);
        rd_en = 1;
        
        @(posedge clk);
        #1;
        check_flag(1'b0, 1'b1);
        
        @(negedge clk);
        rd_en = 0;
        #1;
        
        // Check read data
        if (data_out !== 8'hA5)
            $display("TEST FAILED: Expected A5, Got %h", data_out);
        else
            $display("TEST PASSED: Data read correctly = %h", data_out);
        // End simulation
        #10;
        $finish;

    end

endmodule
