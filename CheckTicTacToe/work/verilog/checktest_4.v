/*
   This file was generated automatically by Alchitry Labs version 1.1.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module checktest_4 (
    input clk,
    input rst,
    input [8:0] user,
    output reg [15:0] out,
    output reg [7:0] debug
  );
  
  
  
  wire [1-1:0] M_sclk_value;
  counter_6 sclk (
    .clk(clk),
    .rst(rst),
    .value(M_sclk_value)
  );
  reg M_btn_d, M_btn_q = 1'h0;
  
  localparam INIT_loadcheck = 3'd0;
  localparam S1_loadcheck = 3'd1;
  localparam S2_loadcheck = 3'd2;
  localparam S3_loadcheck = 3'd3;
  localparam S4_loadcheck = 3'd4;
  localparam END_loadcheck = 3'd5;
  localparam IDLE_loadcheck = 3'd6;
  
  reg [2:0] M_loadcheck_d, M_loadcheck_q = INIT_loadcheck;
  
  wire [9-1:0] M_check_p1;
  wire [9-1:0] M_check_p2;
  wire [16-1:0] M_check_aluout;
  wire [9-1:0] M_check_debug;
  reg [1-1:0] M_check_psel;
  reg [2-1:0] M_check_asel;
  reg [9-1:0] M_check_user;
  reg [1-1:0] M_check_p1en;
  reg [1-1:0] M_check_p2en;
  reg [6-1:0] M_check_alufn;
  checkplace_7 check (
    .clk(clk),
    .rst(rst),
    .psel(M_check_psel),
    .asel(M_check_asel),
    .user(M_check_user),
    .p1en(M_check_p1en),
    .p2en(M_check_p2en),
    .alufn(M_check_alufn),
    .p1(M_check_p1),
    .p2(M_check_p2),
    .aluout(M_check_aluout),
    .debug(M_check_debug)
  );
  
  localparam ORALUFN = 6'h1e;
  
  localparam ANDALUFN = 6'h18;
  
  localparam AALUFN = 6'h1a;
  
  localparam CMPEQALUFN = 6'h33;
  
  always @* begin
    M_loadcheck_d = M_loadcheck_q;
    M_btn_d = M_btn_q;
    
    if (M_btn_q == 1'h0 && rst == 1'h1) begin
      M_btn_d = 1'h1;
    end
    M_check_p1en = 1'h0;
    M_check_p2en = 1'h0;
    M_check_alufn = 1'h0;
    out = M_check_aluout;
    M_check_user = 1'h0;
    
    case (M_loadcheck_q)
      INIT_loadcheck: begin
        if (M_btn_q == 1'h1) begin
          M_btn_d = 1'h0;
        end
        M_check_psel = 1'h0;
        M_check_asel = 1'h0;
        M_check_p1en = 1'h1;
        M_check_p2en = 1'h0;
        M_check_user = user;
        M_check_alufn = 6'h1a;
        debug = 8'h00;
        M_loadcheck_d = S1_loadcheck;
      end
      S1_loadcheck: begin
        M_check_psel = 1'h0;
        M_check_asel = 1'h0;
        M_check_p1en = 1'h0;
        M_check_p2en = 1'h1;
        M_check_user = 9'h007;
        M_check_alufn = 6'h18;
        debug = 8'h01;
        M_loadcheck_d = S2_loadcheck;
      end
      S2_loadcheck: begin
        M_check_psel = 1'h1;
        M_check_asel = 1'h0;
        M_check_p1en = 1'h0;
        M_check_p2en = 1'h0;
        M_check_user = 9'h007;
        M_check_alufn = 6'h33;
        debug = 8'h03;
        if (M_check_aluout != 1'h1) begin
          M_loadcheck_d = S3_loadcheck;
        end else begin
          M_loadcheck_d = END_loadcheck;
        end
      end
      S3_loadcheck: begin
        M_check_psel = 1'h0;
        M_check_asel = 1'h0;
        M_check_p1en = 1'h0;
        M_check_p2en = 1'h1;
        M_check_user = 9'h038;
        M_check_alufn = 6'h18;
        debug = 8'h07;
        M_loadcheck_d = S4_loadcheck;
      end
      S4_loadcheck: begin
        M_check_psel = 1'h1;
        M_check_asel = 1'h0;
        M_check_p1en = 1'h0;
        M_check_p2en = 1'h0;
        M_check_user = 9'h038;
        M_check_alufn = 6'h33;
        debug = 8'h0f;
        if (M_check_aluout != 1'h1) begin
          M_loadcheck_d = IDLE_loadcheck;
        end else begin
          M_loadcheck_d = END_loadcheck;
        end
      end
      IDLE_loadcheck: begin
        M_check_psel = 1'h0;
        M_check_asel = 1'h0;
        M_check_p1en = 1'h0;
        M_check_p2en = 1'h0;
        debug = 8'hff;
        if (M_btn_q == 1'h1) begin
          M_loadcheck_d = INIT_loadcheck;
        end
      end
      END_loadcheck: begin
        debug = 8'h55;
        M_check_psel = 1'h0;
        M_check_asel = 1'h0;
        M_check_p1en = 1'h0;
        M_check_p2en = 1'h0;
        if (M_btn_q == 1'h1) begin
          M_loadcheck_d = INIT_loadcheck;
        end
      end
      default: begin
        M_check_user = 1'h0;
        M_check_psel = 1'h0;
        M_check_asel = 1'h0;
        M_check_p1en = 1'h0;
        M_check_p2en = 1'h0;
        M_check_alufn = 6'h1a;
        debug = 8'h00;
      end
    endcase
  end
  
  always @(posedge clk) begin
    M_btn_q <= M_btn_d;
  end
  
  
  always @(posedge M_sclk_value) begin
    M_loadcheck_q <= M_loadcheck_d;
  end
  
endmodule
