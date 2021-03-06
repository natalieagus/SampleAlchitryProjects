/*
   This file was generated automatically by Alchitry Labs version 1.2.0.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     ADDRESS_SIZE = 4
     MATRIX_WIDTH = 64
*/
module matrix_ram_sample_2 (
    input clk,
    input rst,
    input [3:0] row_address,
    input [5:0] col_address,
    output reg [2:0] top_out,
    output reg [2:0] bottom_out
  );
  
  localparam ADDRESS_SIZE = 3'h4;
  localparam MATRIX_WIDTH = 7'h40;
  
  
  localparam ROW_DATA_BOTTOM = 192'h924924924924924924924924924924924924924924924924;
  
  localparam ROW_DATA_TOP = 192'h249249249249249fb6db6df6db6dbedb6db6db6db6db6db6;
  
  reg [9:0] M_ram_writer_address_d, M_ram_writer_address_q = 1'h0;
  
  wire [3-1:0] M_top_ram_read_data;
  reg [10-1:0] M_top_ram_address;
  reg [3-1:0] M_top_ram_write_data;
  reg [1-1:0] M_top_ram_write_en;
  simple_ram_4 #(.SIZE(2'h3), .DEPTH(12'h400)) top_ram (
    .clk(clk),
    .address(M_top_ram_address),
    .write_data(M_top_ram_write_data),
    .write_en(M_top_ram_write_en),
    .read_data(M_top_ram_read_data)
  );
  
  wire [3-1:0] M_bottom_ram_read_data;
  reg [10-1:0] M_bottom_ram_address;
  reg [3-1:0] M_bottom_ram_write_data;
  reg [1-1:0] M_bottom_ram_write_en;
  simple_ram_4 #(.SIZE(2'h3), .DEPTH(12'h400)) bottom_ram (
    .clk(clk),
    .address(M_bottom_ram_address),
    .write_data(M_bottom_ram_write_data),
    .write_en(M_bottom_ram_write_en),
    .read_data(M_bottom_ram_read_data)
  );
  
  
  localparam LOAD_ADDRESS_ram_state = 2'd0;
  localparam LOAD_WAIT_ram_state = 2'd1;
  localparam LOOP_ram_state = 2'd2;
  
  reg [1:0] M_ram_state_d, M_ram_state_q = LOAD_ADDRESS_ram_state;
  
  always @* begin
    M_ram_state_d = M_ram_state_q;
    M_ram_writer_address_d = M_ram_writer_address_q;
    
    top_out = M_top_ram_read_data;
    bottom_out = M_bottom_ram_read_data;
    M_top_ram_address = row_address * col_address;
    M_bottom_ram_address = row_address * col_address;
    M_top_ram_write_data = 1'h0;
    M_bottom_ram_write_data = 1'h0;
    M_top_ram_write_en = 1'h0;
    M_bottom_ram_write_en = 1'h0;
    
    case (M_ram_state_q)
      LOAD_ADDRESS_ram_state: begin
        M_top_ram_address = M_ram_writer_address_q;
        M_bottom_ram_address = M_ram_writer_address_q;
        M_top_ram_write_data = ROW_DATA_TOP[(M_ram_writer_address_q)*3+2-:3];
        M_bottom_ram_write_data = ROW_DATA_BOTTOM[(M_ram_writer_address_q)*3+2-:3];
        M_top_ram_write_en = 1'h1;
        M_bottom_ram_write_en = 1'h1;
        M_ram_state_d = LOAD_WAIT_ram_state;
        if ((&M_ram_writer_address_q) == 1'h1) begin
          M_ram_state_d = LOOP_ram_state;
        end
      end
      LOAD_WAIT_ram_state: begin
        M_ram_writer_address_d = M_ram_writer_address_q + 1'h1;
        M_ram_state_d = LOAD_ADDRESS_ram_state;
      end
      LOOP_ram_state: begin
        M_ram_state_d = LOOP_ram_state;
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_ram_writer_address_q <= 1'h0;
    end else begin
      M_ram_writer_address_q <= M_ram_writer_address_d;
    end
  end
  
  
  always @(posedge clk) begin
    M_ram_state_q <= M_ram_state_d;
  end
  
endmodule
