/*
   This file was generated automatically by Alchitry Labs version 1.2.0.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module au_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input usb_rx,
    output reg usb_tx,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  
  wire [7-1:0] M_seg_seg;
  wire [4-1:0] M_seg_sel;
  reg [16-1:0] M_seg_values;
  multi_seven_seg_1 seg (
    .clk(clk),
    .rst(rst),
    .values(M_seg_values),
    .seg(M_seg_seg),
    .sel(M_seg_sel)
  );
  wire [16-1:0] M_gameMachine_debug_out;
  wire [16-1:0] M_gameMachine_p1_out;
  wire [16-1:0] M_gameMachine_p2_out;
  wire [1-1:0] M_gameMachine_debug_slowclock;
  wire [1-1:0] M_gameMachine_debug_vcclock;
  wire [1-1:0] M_gameMachine_decimal_counter_increase;
  wire [1-1:0] M_gameMachine_decimal_counter_rst;
  reg [1-1:0] M_gameMachine_p1_button;
  reg [1-1:0] M_gameMachine_p2_button;
  game_miniBeta_2 gameMachine (
    .clk(clk),
    .rst(rst),
    .p1_button(M_gameMachine_p1_button),
    .p2_button(M_gameMachine_p2_button),
    .debug_out(M_gameMachine_debug_out),
    .p1_out(M_gameMachine_p1_out),
    .p2_out(M_gameMachine_p2_out),
    .debug_slowclock(M_gameMachine_debug_slowclock),
    .debug_vcclock(M_gameMachine_debug_vcclock),
    .decimal_counter_increase(M_gameMachine_decimal_counter_increase),
    .decimal_counter_rst(M_gameMachine_decimal_counter_rst)
  );
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_3 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_edge_dt_btn_p1_out;
  reg [1-1:0] M_edge_dt_btn_p1_in;
  edge_detector_4 edge_dt_btn_p1 (
    .clk(clk),
    .in(M_edge_dt_btn_p1_in),
    .out(M_edge_dt_btn_p1_out)
  );
  wire [1-1:0] M_edge_dt_btn_p2_out;
  reg [1-1:0] M_edge_dt_btn_p2_in;
  edge_detector_4 edge_dt_btn_p2 (
    .clk(clk),
    .in(M_edge_dt_btn_p2_in),
    .out(M_edge_dt_btn_p2_out)
  );
  wire [1-1:0] M_btn_cond_p1_out;
  reg [1-1:0] M_btn_cond_p1_in;
  button_conditioner_5 btn_cond_p1 (
    .clk(clk),
    .in(M_btn_cond_p1_in),
    .out(M_btn_cond_p1_out)
  );
  wire [1-1:0] M_btn_cond_p2_out;
  reg [1-1:0] M_btn_cond_p2_in;
  button_conditioner_5 btn_cond_p2 (
    .clk(clk),
    .in(M_btn_cond_p2_in),
    .out(M_btn_cond_p2_out)
  );
  wire [16-1:0] M_dec_ctr_digits;
  reg [1-1:0] M_dec_ctr_rst;
  reg [1-1:0] M_dec_ctr_inc;
  multi_dec_ctr_6 dec_ctr (
    .clk(clk),
    .rst(M_dec_ctr_rst),
    .inc(M_dec_ctr_inc),
    .digits(M_dec_ctr_digits)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    usb_tx = usb_rx;
    led = 8'h00;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'hf;
    M_btn_cond_p1_in = io_button[4+0-:1];
    M_btn_cond_p2_in = io_button[3+0-:1];
    M_edge_dt_btn_p1_in = M_btn_cond_p1_out;
    M_edge_dt_btn_p2_in = M_btn_cond_p2_out;
    M_gameMachine_p1_button = M_edge_dt_btn_p1_out;
    M_gameMachine_p2_button = M_edge_dt_btn_p2_out;
    io_led[16+7-:8] = M_gameMachine_debug_out;
    io_led[0+7-:8] = M_gameMachine_p1_out;
    io_led[8+7-:8] = M_gameMachine_p2_out;
    led[0+0-:1] = M_gameMachine_debug_slowclock;
    led[1+0-:1] = M_gameMachine_debug_vcclock;
    M_dec_ctr_inc = M_gameMachine_decimal_counter_increase;
    M_dec_ctr_rst = M_gameMachine_decimal_counter_rst;
    M_seg_values = M_dec_ctr_digits;
    io_seg = ~M_seg_seg;
    io_sel = ~M_seg_sel;
  end
endmodule
