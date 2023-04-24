// *****************************************************************************
// (c) Copyright 2022-2032 , Inc. All rights reserved.
// Module Name  :
// Design Name  :
// Project Name :
// Create Date  : 2022-12-21
// Description  :
//
// *****************************************************************************

// -------------------------------------------------------------------
// Constant Parameter
// -------------------------------------------------------------------

// -------------------------------------------------------------------
// Internal Signals Declarations
// -------------------------------------------------------------------

// -------------------------------------------------------------------
// initial
// -------------------------------------------------------------------
initial begin
  #10000  $finish;
end

initial begin
  BGM_sw = 1'b1;
  RXD = 1'b1;
  clk = 0;
  rst_n = 0;
  col = 4'b1111;
  #10;
  rst_n = 1;
  col = 4'b1111;

end



// -------------------------------------------------------------------
// Main Code
// -------------------------------------------------------------------

// -------------------------------------------------------------------
// Assertion Declarations
// -------------------------------------------------------------------
`ifdef SOC_ASSERT_ON

`endif