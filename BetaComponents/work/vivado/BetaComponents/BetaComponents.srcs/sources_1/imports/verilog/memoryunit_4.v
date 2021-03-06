/*
   This file was generated automatically by Alchitry Labs version 1.2.0.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     DEPTH = 16
*/
module memoryunit_4 (
    input clk,
    input [5:0] raddr,
    input [5:0] waddr,
    input [31:0] data_memory_input,
    input xwr,
    output reg [31:0] data_memory_output,
    input [5:0] ia,
    input instruction_write_enable,
    input [31:0] instruction_towrite,
    output reg [31:0] instruction
  );
  
  localparam DEPTH = 5'h10;
  
  
  wire [32-1:0] M_instruction_memory_read_data;
  reg [4-1:0] M_instruction_memory_address;
  reg [32-1:0] M_instruction_memory_write_data;
  reg [1-1:0] M_instruction_memory_write_en;
  simple_ram_9 #(.SIZE(6'h20), .DEPTH(5'h10)) instruction_memory (
    .clk(clk),
    .address(M_instruction_memory_address),
    .write_data(M_instruction_memory_write_data),
    .write_en(M_instruction_memory_write_en),
    .read_data(M_instruction_memory_read_data)
  );
  
  wire [32-1:0] M_data_memory_read_data;
  reg [4-1:0] M_data_memory_waddr;
  reg [32-1:0] M_data_memory_write_data;
  reg [1-1:0] M_data_memory_write_en;
  reg [4-1:0] M_data_memory_raddr;
  simple_dual_ram_10 #(.SIZE(6'h20), .DEPTH(5'h10)) data_memory (
    .wclk(clk),
    .rclk(clk),
    .waddr(M_data_memory_waddr),
    .write_data(M_data_memory_write_data),
    .write_en(M_data_memory_write_en),
    .raddr(M_data_memory_raddr),
    .read_data(M_data_memory_read_data)
  );
  
  always @* begin
    M_instruction_memory_write_data = instruction_towrite;
    M_instruction_memory_address = ia[2+3-:4];
    M_instruction_memory_write_en = instruction_write_enable;
    instruction = M_instruction_memory_read_data;
    M_data_memory_raddr = raddr[2+3-:4];
    M_data_memory_waddr = waddr[2+3-:4];
    M_data_memory_write_data = data_memory_input;
    M_data_memory_write_en = xwr;
    data_memory_output = M_data_memory_read_data;
  end
endmodule
