// *****************************************************************************
// (c) Copyright 2022-2032 , Inc. All rights reserved.
// Module Name  :
// Design Name  :
// Project Name :
// Create Date  : 2022-12-21
// Description  :
//
// *****************************************************************************

module harness;

// -------------------------------------------------------------------
// Constant Parameter
// -------------------------------------------------------------------
parameter                                        PERIOD_CLK = 10;

// -------------------------------------------------------------------
// Internal Signals Declarations
// -------------------------------------------------------------------
logic                                            clk;
logic                                            rst_n;

wire                                             SWDIO;
logic                                            SWCLK;
logic                                      [3:0] col;
logic                                            BGM_sw;
logic                                      [3:0] row;
logic                                            PWM_out;
logic                                            LCD_CS;
logic                                            LCD_RS;
logic                                            LCD_WR;
logic                                            LCD_RD;
logic                                            LCD_RST;
logic                                     [15:0] LCD_DATA;
logic                                            LCD_BL_CTR;
logic                                            RXD;
logic                                            TXD;
// -------------------------------------------------------------------
// fadb wave
// -------------------------------------------------------------------
initial begin
  $fsdbDumpfile("harness.fsdb");
  $fsdbDumpvars(0,"harness");
  $fsdbDumpMDA();
end

function integer myclog2 (input integer n);
begin
  n                                              = n - 1;
  for (myclog2 = 0; n > 0; myclog2 = myclog2 + 1)
    n                                            = n >> 1;
end
endfunction

// -------------------------------------------------------------------
// clock & reset
// -------------------------------------------------------------------
initial begin
  clk                        = 1'b0;
  rst_n                      = 1'b1;
  # 100 rst_n = 1'b0;
  # 100 rst_n = 1'b1;
end

always #(PERIOD_CLK/2) clk = ~clk;

// -------------------------------------------------------------------
// Main Code
// -------------------------------------------------------------------

// -----------------> testcase load
`include "./testcase.sv"

// -----------------> DUT Instance

RealTankSoC DUT(
                .clk         (clk),
                .RSTn        (rst_n),
                .*
                );
// -------------------------------------------------------------------
// Assertion Declarations
// -------------------------------------------------------------------
`ifdef SOC_ASSERT_ON

`endif
endmodule
