`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.11.2026 22:30:44
// Design Name: 
// Module Name: sync_fifo
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


module sync_fifo #( //Parameter port list
    parameter DATA_WIDTH = 8,
    parameter DEPTH = 8,
    parameter ADDR_WIDTH = $clog2(DEPTH),
    parameter COUNT_WIDTH = $clog2(DEPTH+1)
)(
    input logic clk,  //common clock
    input logic rst,  //synchronous active high reset
    
    input logic wr_en, //write request
    input logic rd_en, //read request
    
    input logic [DATA_WIDTH-1:0]data_in, //data entering FIFO
    output logic [DATA_WIDTH-1:0]data_out, //data leaving FIFO
    
    output logic full, //FIFO is full
    output logic empty //FIFO is empty
);
    //FIFO Memory
    logic [DATA_WIDTH-1:0]mem[0:DEPTH-1];
    
    //Read and Write Pointers
    logic [ADDR_WIDTH-1:0]wr_ptr;
    logic [ADDR_WIDTH-1:0]rd_ptr;
    
    //Number of elements stored in FIFO (Occupancy Counter)
    logic [COUNT_WIDTH-1:0]count;
    
    //Full and Empty (Status Flags)
    assign full = (count==DEPTH);
    assign empty = (count==0);
    
    // Accepted operations
    wire wr_fire = wr_en && !full;
    wire rd_fire = rd_en && !empty;
    
    always_ff@(posedge clk) begin
        if (rst) begin
            wr_ptr <= '0;
            rd_ptr <= '0;
            count <= '0;
            data_out <= '0;
        end
        else begin
            // Write operation
            if (wr_fire) begin
                mem[wr_ptr] <= data_in;
            
                if (wr_ptr == DEPTH-1)
                    wr_ptr <= '0;
                else
                    wr_ptr <= wr_ptr + 1'b1;
            end
            
             // Read operation
            if (rd_fire) begin
                data_out <= mem[rd_ptr];
            
                if (rd_ptr == DEPTH-1)
                    rd_ptr <= '0;
                else
                    rd_ptr <= rd_ptr + 1'b1;
            end 
            
            // Occupancy counter
            case ({wr_fire, rd_fire})
            
                2'b10: count <= count + 1'b1;
            
                2'b01: count <= count - 1'b1;
            
                default: count <= count;
            
            endcase 
        end
    end
                
endmodule
