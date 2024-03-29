module RealTankSoC(input  wire       clk,
                   input  wire       RSTn,
                   inout  wire       SWDIO,  
                   input  wire       SWCLK,
                   input  wire[3:0]  col,
                   input  wire       BGM_sw,
                   output wire[3:0]  row,
                   output wire       PWM_out,
                   output wire       LCD_CS,
                   output wire       LCD_RS,
                   output wire       LCD_WR,
                   output wire       LCD_RD,
                   output wire       LCD_RST,
                   output wire[15:0] LCD_DATA,
                   output wire       LCD_BL_CTR,
                   input wire        RXD,
                   output wire       TXD);
 
//------------------------------------------------------------------------------
// DEBUG IOBUF 
//------------------------------------------------------------------------------

    wire SWDO;
    wire SWDOEN;
    wire SWDI;

    assign SWDI = SWDIO;
    assign SWDIO = (SWDOEN) ?  SWDO : 1'bz;

//------------------------------------------------------------------------------
// Interrupt
//------------------------------------------------------------------------------

    wire KeyboardIRQ,TimerIRQ,RXIRQ;
    wire [31:0] IRQ;
    assign IRQ = {29'b0,RXIRQ,TimerIRQ,KeyboardIRQ};

    wire RXEV;
    assign RXEV = 1'b0;

//------------------------------------------------------------------------------
// AHB
//------------------------------------------------------------------------------

    wire [31:0] HADDR;
    wire [ 2:0] HBURST;
    wire        HMASTLOCK;
    wire [ 3:0] HPROT;
    wire [ 2:0] HSIZE;
    wire [ 1:0] HTRANS;
    wire [31:0] HWDATA;
    wire        HWRITE;
    wire [31:0] HRDATA;
    wire        HRESP;
    wire        HMASTER;
    wire        HREADY;

//------------------------------------------------------------------------------
// RESET AND DEBUG
//------------------------------------------------------------------------------

    wire SYSRESETREQ;
    reg cpuresetn;

    always @(posedge clk or negedge RSTn)begin
            if (~RSTn) cpuresetn <= 1'b0;
            else if (SYSRESETREQ) cpuresetn <= 1'b0;
            else cpuresetn <= 1'b1;
    end

    wire CDBGPWRUPREQ;
    reg CDBGPWRUPACK;

    always @(posedge clk or negedge RSTn)begin
            if (~RSTn) CDBGPWRUPACK <= 1'b0;
            else CDBGPWRUPACK <= CDBGPWRUPREQ;
    end


//------------------------------------------------------------------------------
// Instantiate Cortex-M0 processor logic level
//------------------------------------------------------------------------------

    cortexm0ds_logic u_logic (

        // System inputs
        .FCLK           (clk),           //FREE running clock 
        .SCLK           (clk),           //system clock
        .HCLK           (clk),           //AHB clock
        .DCLK           (clk),           //Debug clock
        .PORESETn       (RSTn),          //Power on reset
        .HRESETn        (cpuresetn),     //AHB and System reset
        .DBGRESETn      (RSTn),          //Debug Reset
        .RSTBYPASS      (1'b0),          //Reset bypass
        .SE             (1'b0),          // dummy scan enable port for synthesis

        // Power management inputs
        .SLEEPHOLDREQn  (1'b1),          // Sleep extension request from PMU
        .WICENREQ       (1'b0),          // WIC enable request from PMU
        .CDBGPWRUPACK   (CDBGPWRUPACK),  // Debug Power Up ACK from PMU

        // Power management outputs
        .CDBGPWRUPREQ   (CDBGPWRUPREQ),
        .SYSRESETREQ    (SYSRESETREQ),

        // System bus
        .HADDR          (HADDR[31:0]),
        .HTRANS         (HTRANS[1:0]),
        .HSIZE          (HSIZE[2:0]),
        .HBURST         (HBURST[2:0]),
        .HPROT          (HPROT[3:0]),
        .HMASTER        (HMASTER),
        .HMASTLOCK      (HMASTLOCK),
        .HWRITE         (HWRITE),
        .HWDATA         (HWDATA[31:0]),
        .HRDATA         (HRDATA[31:0]),
        .HREADY         (HREADY),
        .HRESP          (HRESP),

        // Interrupts
        .IRQ            (IRQ),          //Interrupt
        .NMI            (1'b0),         //Watch dog interrupt
        .IRQLATENCY     (8'h0),
        .ECOREVNUM      (28'h0),

        // Systick
        .STCLKEN        (1'b0),
        .STCALIB        (26'h0),

        // Debug - JTAG or Serial wire
        // Inputs
        .nTRST          (1'b1),
        .SWDITMS        (SWDI),
        .SWCLKTCK       (SWCLK),
        .TDI            (1'b0),
        // Outputs
        .SWDO           (SWDO),
        .SWDOEN         (SWDOEN),

        .DBGRESTART     (1'b0),

        // Event communication
        .RXEV           (RXEV),         // Generate event when a DMA operation completed.
        .EDBGRQ         (1'b0)          // multi-core synchronous halt request
    );

//------------------------------------------------------------------------------
// Instantiate BuzzerSoC AHB Bus Matrix
//------------------------------------------------------------------------------

    //AHB to APB Port
    wire       AHB2APB_HSEL;
    wire[31:0] AHB2APB_HADDR;
    wire[1:0]  AHB2APB_HTRANS;
    wire[2:0]  AHB2APB_HSIZE;
    wire[3:0]  AHB2APB_HPROT;
    wire       AHB2APB_HWRITE;
    wire       AHB2APB_HREADY;
    wire[31:0] AHB2APB_HWDATA;

    wire       AHB2APB_HREADYOUT;
    wire[31:0] AHB2APB_HRDATA;
    wire       AHB2APB_HRESP;

    //Printer DMA Port
    wire       PTFIFO_HSEL;
    wire[31:0] PTFIFO_HADDR;
    wire[1:0]  PTFIFO_HTRANS;
    wire[2:0]  PTFIFO_HSIZE;
    wire[3:0]  PTFIFO_HPROT;
    wire       PTFIFO_HWRITE;
    wire       PTFIFO_HREADY;
    wire[31:0] PTFIFO_HWDATA;

    wire       PTFIFO_HREADYOUT;
    wire[31:0] PTFIFO_HRDATA;
    wire       PTFIFO_HRESP; 

    //SBDMA Port
    wire[31:0] SBDMA_HADDR;
    wire[1:0]  SBDMA_HTRANS;
    wire       SBDMA_HWRITE;
    wire[31:0] SBDMA_HRDATA;
    wire       SBDMA_HREADY;

    //BBDMA Port
    wire[31:0] BBDMA_HADDR;
    wire[1:0]  BBDMA_HTRANS;
    wire       BBDMA_HWRITE;
    wire[31:0] BBDMA_HRDATA;
    wire       BBDMA_HREADY;

    //Buzzer Port
    wire[31:0] BUZZER_HADDR;
    wire[1:0]  BUZZER_HTRANS;
    wire       BUZZER_HWRITE;
    wire[31:0] BUZZER_HRDATA;
    wire       BUZZER_HREADY;
    wire       BUZZER_HREADYOUT;

    //Printer DMA Port
    wire[31:0] PTDMA_HADDR;
    wire[1:0]  PTDMA_HTRANS;
    wire       PTDMA_HWRITE;
    wire[31:0] PTDMA_HRDATA;
    wire       PTDMA_HREADY;
    wire[31:0] MTX_PTDMA_HRDATA;
    wire       MTX_PTDMA_HREADY;
    wire[31:0] FIFO_PTDMA_HRDATA;
    wire       FIFO_PTDMA_HREADY;

    //RAMCODE Port
    wire       RAMCODE_HSEL;
    wire[31:0] RAMCODE_HADDR;
    wire[1:0]  RAMCODE_HTRANS;
    wire[2:0]  RAMCODE_HSIZE;
    wire[3:0]  RAMCODE_HPROT;
    wire       RAMCODE_HWRITE;
    wire[31:0] RAMCODE_HWDATA;
    wire       RAMCODE_HREADY;
    wire       RAMCODE_HREADYOUT;
    wire[31:0] RAMCODE_HRDATA;
    wire[1:0]  RAMCODE_HRESP;

    //RAMDATA Port
    wire       RAMDATA_HSEL;
    wire[31:0] RAMDATA_HADDR;
    wire[1:0]  RAMDATA_HTRANS;
    wire[2:0]  RAMDATA_HSIZE;
    wire[3:0]  RAMDATA_HPROT;
    wire       RAMDATA_HWRITE;
    wire[31:0] RAMDATA_HWDATA;
    wire       RAMDATA_HREADY;
    wire       RAMDATA_HREADYOUT;
    wire[31:0] RAMDATA_HRDATA;
    wire[1:0]  RAMDATA_HRESP;

    //Inflate core port
    //APB
    wire       INFLATE_PWRITE;
    wire       INFLATE_PSEL;
    wire       INFLATE_PENABLE;
    wire[31:0] INFLATE_PWDATA;
    wire[31:0] INFLATE_PADDR;
    wire[31:0] INFLATE_PRDATA;
    //AHB
    wire       INFLATE_HREADY;
    wire[31:0] INFLATE_HRDATA;
    wire[31:0] INFLATE_HADDR;
    wire[1:0]  INFLATE_HTRANS;
    //FIFO
    wire[15:0] INFLATE_data_out;
    wire       INFLATE_data_out_vld;
    wire       INFLATE_data_out_rdy;
    //intr
    wire       INFLATE_decode_finish;

    reg        INFLATE_EN;
    reg        INFLATE_WR_EN;

    //Buzzer subsystem mst mux
    cmsdk_ahb_master_mux #(
    // Parameters to enable/disable ports
    .PORT0_ENABLE(0),
    .PORT1_ENABLE(1),
    .PORT2_ENABLE(1),
    .DW          (32)
    ) Buzzer_mst_mux
    (
        // --------------------------------------------------------------------------------
        // I/O declaration
        // --------------------------------------------------------------------------------

        .HCLK                (clk      ),       // Clock
        .HRESETn             (cpuresetn),    // Reset

        // AHB connection to master #0
        .HSELS0              (1'b0),
        .HADDRS0             (32'b0),
        .HTRANSS0            (2'b0),
        .HSIZES0             (3'b0),
        .HWRITES0            (1'b0),
        .HREADYS0            (1'b0),
        .HPROTS0             (4'b0),
        .HBURSTS0            (3'b0),
        .HMASTLOCKS0         (1'b0),
        .HWDATAS0            (32'b0),

        .HREADYOUTS0         (),
        .HRESPS0             (),
        .HRDATAS0            (),

        // AHB connection to master #1
        .HSELS1              (1'b1),
        .HADDRS1             (BBDMA_HADDR),
        .HTRANSS1            (BBDMA_HTRANS),
        .HSIZES1             (3'b001),
        .HWRITES1            (1'b0),
        .HREADYS1            (BBDMA_HREADY),
        .HPROTS1             (4'b0),
        .HBURSTS1            (3'b0),
        .HMASTLOCKS1         (1'b0),
        .HWDATAS1            (32'b0),

        .HREADYOUTS1         (BBDMA_HREADY),
        .HRESPS1             (),
        .HRDATAS1            (BBDMA_HRDATA),

        // AHB connection to master #2
        .HSELS2              (1'b1),
        .HADDRS2             (SBDMA_HADDR),
        .HTRANSS2            (SBDMA_HTRANS),
        .HSIZES2             (3'b001),
        .HWRITES2            (1'b0),
        .HREADYS2            (SBDMA_HREADY),
        .HPROTS2             (4'b0),
        .HBURSTS2            (3'b0),
        .HMASTLOCKS2         (1'b0),
        .HWDATAS2            (32'b0),

        .HREADYOUTS2         (SBDMA_HREADY),
        .HRESPS2             (),
        .HRDATAS2            (SBDMA_HRDATA),

        // AHB output master port
        .HSELM               (),
        .HADDRM              (BUZZER_HADDR),
        .HTRANSM             (BUZZER_HTRANS),
        .HSIZEM              (),
        .HWRITEM             (),
        .HREADYM             (BUZZER_HREADY),
        .HPROTM              (),
        .HBURSTM             (),
        .HMASTLOCKM          (),
        .HWDATAM             (),

        .HREADYOUTM          (BUZZER_HREADYOUT),
        .HRESPM              (1'b0),
        .HRDATAM             (BUZZER_HRDATA),

        .HMASTERM            ()
    );

    RealTankSoCBusMtx RealTankSoCBusMtx(
        //General Signals
        .HCLK           (clk),
        .HRESETn        (cpuresetn),
        .REMAP          (4'b0),

        //Master0 Signals Cortex-M0
        .HSELS0                             (1'b1),
        .HADDRS0                            (HADDR),
        .HTRANSS0                           (HTRANS),
        .HWRITES0                           (HWRITE),
        .HSIZES0                            (HSIZE),
        .HBURSTS0                           (HBURST),
        .HPROTS0                            (HPROT),
        .HMASTERS0                          (4'b0000),
        .HWDATAS0                           (HWDATA),
        .HMASTLOCKS0                        (HMASTLOCK),
        .HREADYS0                           (HREADY),
        .HAUSERS0                           (32'b0),
        .HWUSERS0                           (32'b0),
        .HRDATAS0                           (HRDATA),
        .HREADYOUTS0                        (HREADY),
        .HRESPS0                            (HRESP),
        .HRUSERS0                           (),

        //Master1 Signals Buzzer subsystem
        .HSELS1                             (1'b1),
        .HADDRS1                            (BUZZER_HADDR),
        .HTRANSS1                           (BUZZER_HTRANS),
        .HWRITES1                           (1'b0),
        .HSIZES1                            (3'b001),
        .HBURSTS1                           (3'b000),
        .HPROTS1                            (4'b0000),
        .HMASTERS1                          (4'b0000),
        .HWDATAS1                           (32'b0),
        .HMASTLOCKS1                        (1'b0),
        .HREADYS1                           (BUZZER_HREADY),
        .HAUSERS1                           (32'b0),
        .HWUSERS1                           (32'b0),
        .HREADYOUTS1                        (BUZZER_HREADYOUT),
        .HRESPS1                            (),
        .HRUSERS1                           (),
        .HRDATAS1                           (BUZZER_HRDATA),

        //Master2 Signals BBDMA
        .HSELS2                             (1'b1),
        .HADDRS2                            (INFLATE_HADDR),
        .HTRANSS2                           (INFLATE_HTRANS),
        .HWRITES2                           (1'b0),
        .HSIZES2                            (3'b001),
        .HBURSTS2                           (3'b000),
        .HPROTS2                            (4'b0000),
        .HMASTERS2                          (4'b0000),
        .HWDATAS2                           (32'b0),
        .HMASTLOCKS2                        (1'b0),
        .HREADYS2                           (INFLATE_HREADY),
        .HAUSERS2                           (32'b0),
        .HWUSERS2                           (32'b0),
        .HREADYOUTS2                        (INFLATE_HREADY),
        .HRESPS2                            (),
        .HRUSERS2                           (),
        .HRDATAS2                           (INFLATE_HRDATA),

        //Master3 Signals Printer DMA
        .HSELS3                             (~INFLATE_EN),
        .HADDRS3                            (PTDMA_HADDR),
        .HTRANSS3                           (PTDMA_HTRANS),
        .HWRITES3                           (1'b0),
        .HSIZES3                            (3'b001),
        .HBURSTS3                           (3'b000),
        .HPROTS3                            (4'b0000),
        .HMASTERS3                          (4'b0000),
        .HWDATAS3                           (32'b0),
        .HMASTLOCKS3                        (1'b0),
        .HREADYS3                           (PTDMA_HREADY),
        .HAUSERS3                           (32'b0),
        .HWUSERS3                           (32'b0),
        .HREADYOUTS3                        (MTX_PTDMA_HREADY),
        .HRESPS3                            (),
        .HRUSERS3                           (),
        .HRDATAS3                           (MTX_PTDMA_HRDATA),

        //Slave0 Signals RAMCODE
        .HSELM0                             (RAMCODE_HSEL),
        .HADDRM0                            (RAMCODE_HADDR),
        .HTRANSM0                           (RAMCODE_HTRANS),
        .HWRITEM0                           (RAMCODE_HWRITE),
        .HSIZEM0                            (RAMCODE_HSIZE),
        .HBURSTM0                           (),
        .HPROTM0                            (RAMCODE_HPROT),
        .HMASTERM0                          (),
        .HWDATAM0                           (RAMCODE_HWDATA),
        .HMASTLOCKM0                        (),
        .HREADYMUXM0                        (RAMCODE_HREADY),
        .HAUSERM0                           (),
        .HWUSERM0                           (),
        .HRDATAM0                           (RAMCODE_HRDATA),
        .HREADYOUTM0                        (RAMCODE_HREADYOUT),
        .HRESPM0                            (RAMCODE_HRESP),
        .HRUSERM0                           (32'b0),

        //Slave1 Signals RAMDATA
        .HSELM1                             (RAMDATA_HSEL),
        .HADDRM1                            (RAMDATA_HADDR),
        .HTRANSM1                           (RAMDATA_HTRANS),
        .HWRITEM1                           (RAMDATA_HWRITE),
        .HSIZEM1                            (RAMDATA_HSIZE),
        .HBURSTM1                           (),
        .HPROTM1                            (RAMDATA_HPROT),
        .HMASTERM1                          (),
        .HWDATAM1                           (RAMDATA_HWDATA),
        .HMASTLOCKM1                        (),
        .HREADYMUXM1                        (RAMDATA_HREADY),
        .HAUSERM1                           (),
        .HWUSERM1                           (),
        .HRDATAM1                           (RAMDATA_HRDATA),
        .HREADYOUTM1                        (RAMDATA_HREADYOUT),
        .HRESPM1                            (RAMDATA_HRESP),
        .HRUSERM1                           (32'b0),

        //Slave2 Signals AHB2APB
        .HSELM2                             (AHB2APB_HSEL),
        .HADDRM2                            (AHB2APB_HADDR),
        .HTRANSM2                           (AHB2APB_HTRANS),
        .HWRITEM2                           (AHB2APB_HWRITE),
        .HSIZEM2                            (AHB2APB_HSIZE),
        .HBURSTM2                           (),
        .HPROTM2                            (AHB2APB_HPROT),
        .HMASTERM2                          (),
        .HWDATAM2                           (AHB2APB_HWDATA),
        .HMASTLOCKM2                        (),
        .HREADYMUXM2                        (AHB2APB_HREADY),
        .HAUSERM2                           (),
        .HWUSERM2                           (),
        .HRDATAM2                           (AHB2APB_HRDATA),
        .HREADYOUTM2                        (AHB2APB_HREADYOUT),
        .HRESPM2                            (AHB2APB_HRESP),
        .HRUSERM2                           (32'b0),

        //Slave3 Signals Printer FIFO
        .HSELM3                             (PTFIFO_HSEL),
        .HADDRM3                            (PTFIFO_HADDR),
        .HTRANSM3                           (PTFIFO_HTRANS),
        .HWRITEM3                           (PTFIFO_HWRITE),
        .HSIZEM3                            (PTFIFO_HSIZE),
        .HBURSTM3                           (),
        .HPROTM3                            (PTFIFO_HPROT),
        .HMASTERM3                          (),
        .HWDATAM3                           (PTFIFO_HWDATA),
        .HMASTLOCKM3                        (),
        .HREADYMUXM3                        (PTFIFO_HREADY),
        .HAUSERM3                           (),
        .HWUSERM3                           (),
        .HRDATAM3                           (PTFIFO_HRDATA),
        .HREADYOUTM3                        (PTFIFO_HREADYOUT),
        .HRESPM3                            (PTFIFO_HRESP),
        .HRUSERM3                           (32'b0),

        //Scan chain
        .SCANENABLE                         (1'b0),
        .SCANINHCLK                         (1'b0),
        .SCANOUTHCLK                        ()
    );

//------------------------------------------------------------------------------
// Synq AHB to APB Bridge
//------------------------------------------------------------------------------

    //APB Port
    wire[15:0]          PADDR;
    wire                PENABLE;
    wire                PWRITE;
    wire[31:0]          PWDATA;
    wire                PSEL;

    wire[31:0]          PRDATA;
    wire                PREADY;
    wire                PSLVERR;

    cmsdk_ahb_to_apb #(
        .ADDRWIDTH(16),
        .REGISTER_RDATA(0),
        .REGISTER_WDATA(0)
    ) ahb_to_apb(
        //General Signals
        .HCLK           (clk),
        .HRESETn        (cpuresetn),
        .PCLKEN         (1'b1),

        //AHB Port
        .HSEL           (AHB2APB_HSEL),
        .HADDR          (AHB2APB_HADDR[15:0]),
        .HTRANS         (AHB2APB_HTRANS),
        .HSIZE          (AHB2APB_HSIZE),
        .HPROT          (AHB2APB_HPROT),
        .HWRITE         (AHB2APB_HWRITE),
        .HREADY         (AHB2APB_HREADY),
        .HWDATA         (AHB2APB_HWDATA),
        
        .HREADYOUT      (AHB2APB_HREADYOUT),
        .HRDATA         (AHB2APB_HRDATA),
        .HRESP          (AHB2APB_HRESP),

        //APB Port
        .PADDR          (PADDR),
        .PENABLE        (PENABLE),
        .PWRITE         (PWRITE),
        .PSTRB          (),
        .PPROT          (),
        .PWDATA         (PWDATA),
        .PSEL           (PSEL),

        .APBACTIVE      (),
        
        .PRDATA         (PRDATA),
        .PREADY         (PREADY),
        .PSLVERR        (PSLVERR)
    );

//------------------------------------------------------------------------------
// APB Slave MUX
//------------------------------------------------------------------------------

    //BDMAC port
    wire[31:0] BDMAC_PRDATA;
    wire       BDMAC_PREADYOUT;
    wire[1:0]  BDMAC_PRESP;
    wire       BDMAC_PSEL;
    wire       BDMAC_PREADY;
    wire[31:0] BDMAC_PADDR;
    wire[1:0]  BDMAC_PTRANS;
    wire       BDMAC_PWRITE;
    wire[31:0] BDMAC_PWDATA;

    //Keyboard Port
    wire[31:0] Keyboard_PRDATA;

    //UART Port
    wire       UART_PSEL;
    wire       UART_PREADY;
    wire[31:0] UART_PRDATA;
    wire       UART_PSLVERR;

    //Timer Port
    wire[31:0] Timer_PRDATA;

    cmsdk_apb_slave_mux #(
        .PORT0_ENABLE (1),
        .PORT1_ENABLE (1),
        .PORT2_ENABLE (1),
        .PORT3_ENABLE (1),
        .PORT4_ENABLE (1),
        .PORT5_ENABLE (0),
        .PORT6_ENABLE (0),
        .PORT7_ENABLE (0),
        .PORT8_ENABLE (0),
        .PORT9_ENABLE (0),
        .PORT10_ENABLE(0),
        .PORT11_ENABLE(0),
        .PORT12_ENABLE(0),
        .PORT13_ENABLE(0),
        .PORT14_ENABLE(0),
        .PORT15_ENABLE(0)
    )
    cmsdk_apb_slave_mux(
        .DECODE4BIT     (PADDR[15:12]),
        .PSEL           (PSEL),

        //Buzzer DMA
        .PSEL0          (BDMAC_PSEL),
        .PREADY0        (BDMAC_PREADYOUT),
        .PRDATA0        (BDMAC_PRDATA),
        .PSLVERR0       (1'b0),

        //Keyboard
        .PSEL1          (),
        .PREADY1        (1'b1),
        .PRDATA1        (Keyboard_PRDATA),
        .PSLVERR1       (1'b0),

        //UART
        .PSEL2          (UART_PSEL),
        .PREADY2        (UART_PREADY),
        .PRDATA2        (UART_PRDATA),
        .PSLVERR2       (UART_PSLVERR),

        //Timer
        .PSEL3          (),
        .PREADY3        (1'b1),
        .PRDATA3        (Timer_PRDATA),
        .PSLVERR3       (1'b0),

        .PSEL4          (INFLATE_PSEL),
        .PREADY4        (1'b1),
        .PRDATA4        (INFLATE_PRDATA),
        .PSLVERR4       (1'b0),

        .PSEL5          (),
        .PREADY5        (1'b0),
        .PRDATA5        (32'b0),
        .PSLVERR5       (1'b0),

        .PSEL6          (),
        .PREADY6        (1'b0),
        .PRDATA6        (32'b0),
        .PSLVERR6       (1'b0),

        .PSEL7          (),
        .PREADY7        (1'b0),
        .PRDATA7        (32'b0),
        .PSLVERR7       (1'b0),

        .PSEL8          (),
        .PREADY8        (1'b0),
        .PRDATA8        (32'b0),
        .PSLVERR8       (1'b0),

        .PSEL9          (),
        .PREADY9        (1'b0),
        .PRDATA9        (32'b0),
        .PSLVERR9       (1'b0),

        .PSEL10         (),
        .PREADY10       (1'b0),
        .PRDATA10       (32'b0),
        .PSLVERR10      (1'b0),

        .PSEL11         (),
        .PREADY11       (1'b0),
        .PRDATA11       (32'b0),
        .PSLVERR11      (1'b0),

        .PSEL12         (),
        .PREADY12       (1'b0),
        .PRDATA12       (32'b0),
        .PSLVERR12      (1'b0),

        .PSEL13         (),
        .PREADY13       (1'b0),
        .PRDATA13       (32'b0),
        .PSLVERR13      (1'b0),

        .PSEL14         (),
        .PREADY14       (1'b0),
        .PRDATA14       (32'b0),
        .PSLVERR14      (1'b0),

        .PSEL15         (),
        .PREADY15       (1'b0),
        .PRDATA15       (32'b0),
        .PSLVERR15      (1'b0),

        .PREADY         (PREADY),
        .PRDATA         (PRDATA),
        .PSLVERR        (PSLVERR)
    );

//------------------------------------------------------------------------------
// Instantiate Buzzer
//------------------------------------------------------------------------------

    wire PWM;

    Buzzer #(.isSim(0) ,.isAHB(0)) Buzzer(
        //General Signals
        .clk            (clk),
        .rst_n          (cpuresetn),
        
        //BDMAC Master Port
        .BDMAC_RDATA    (BDMAC_PRDATA),
        .BDMAC_READYOUT (BDMAC_PREADYOUT),
        .BDMAC_RESP     (BDMAC_PRESP),
        .BDMAC_SEL      (BDMAC_PSEL),
        .BDMAC_READY    (BDMAC_PREADY),
        .BDMAC_ADDR     (BDMAC_PADDR),
        .BDMAC_TRANS    (BDMAC_PTRANS),
        .BDMAC_WRITE    (BDMAC_PWRITE),
        .BDMAC_WDATA    (BDMAC_PWDATA),

        //SBDMA Slave Port
        .SBDMA_HADDR     (SBDMA_HADDR),
        .SBDMA_HTRANS    (SBDMA_HTRANS),
        .SBDMA_HWRITE    (SBDMA_HWRITE),
        .SBDMA_HRDATA    (SBDMA_HRDATA),
        .SBDMA_HREADY    (SBDMA_HREADY),

        //BBDMA Slave Port
        .BBDMA_HADDR     (BBDMA_HADDR),
        .BBDMA_HTRANS    (BBDMA_HTRANS),
        .BBDMA_HWRITE    (BBDMA_HWRITE),
        .BBDMA_HRDATA    (BBDMA_HRDATA),
        .BBDMA_HREADY    (BBDMA_HREADY),

        //PWM
        .PWM(PWM)
    );

    assign BDMAC_READY = 1'b1;
    assign BDMAC_PADDR = {16'b0,PADDR};
    assign BDMAC_PTRANS = {1'b0,PENABLE};
    assign BDMAC_PWRITE = PWRITE;
    assign BDMAC_PWDATA = PWDATA;
    assign PWM_out      = BGM_sw?PWM:1'b0;

//------------------------------------------------------------------------------
// AHB RAMCODE
//------------------------------------------------------------------------------

    wire [31:0] RAMCODE_RDATA,RAMCODE_WDATA;
    wire [13:0] RAMCODE_WADDR;
    wire [13:0] RAMCODE_RADDR;
    wire [3:0]  RAMCODE_WRITE;

    AHBlite_Block_RAM RAMCODE_Interface(
        .HCLK           (clk),
        .HRESETn        (cpuresetn),
        .HSEL           (RAMCODE_HSEL),
        .HADDR          (RAMCODE_HADDR),
        .HPROT          (RAMCODE_HPROT),
        .HSIZE          (RAMCODE_HSIZE),
        .HTRANS         (RAMCODE_HTRANS),
        .HWDATA         (RAMCODE_HWDATA),
        .HWRITE         (RAMCODE_HWRITE),
        .HRDATA         (RAMCODE_HRDATA),
        .HREADY         (RAMCODE_HREADY),
        .HREADYOUT      (RAMCODE_HREADYOUT),
        .HRESP          (RAMCODE_HRESP),
        .BRAM_WRADDR    (RAMCODE_WADDR),
        .BRAM_RDADDR    (RAMCODE_RADDR),
        .BRAM_RDATA     (RAMCODE_RDATA),
        .BRAM_WDATA     (RAMCODE_WDATA),
        .BRAM_WRITE     (RAMCODE_WRITE)
    );

//------------------------------------------------------------------------------
// AHB RAMDATA
//------------------------------------------------------------------------------

wire [31:0] RAMDATA_RDATA;
wire [31:0] RAMDATA_WDATA;
wire [13:0] RAMDATA_WADDR;
wire [13:0] RAMDATA_RADDR;
wire [3:0]  RAMDATA_WRITE;

    AHBlite_Block_RAM RAMDATA_Interface(
        .HCLK           (clk),
        .HRESETn        (cpuresetn),
        .HSEL           (RAMDATA_HSEL),
        .HADDR          (RAMDATA_HADDR),
        .HPROT          (RAMDATA_HPROT),
        .HSIZE          (RAMDATA_HSIZE),
        .HTRANS         (RAMDATA_HTRANS),
        .HWDATA         (RAMDATA_HWDATA),
        .HWRITE         (RAMDATA_HWRITE),
        .HRDATA         (RAMDATA_HRDATA),
        .HREADY         (RAMDATA_HREADY),
        .HREADYOUT      (RAMDATA_HREADYOUT),
        .HRESP          (RAMDATA_HRESP),
        .BRAM_WRADDR    (RAMDATA_WADDR),
        .BRAM_RDADDR    (RAMDATA_RADDR),
        .BRAM_WDATA     (RAMDATA_WDATA),
        .BRAM_RDATA     (RAMDATA_RDATA),
        .BRAM_WRITE     (RAMDATA_WRITE)
    );

//------------------------------------------------------------------------------
// RAM
//------------------------------------------------------------------------------

    Block_RAM RAM_CODE(
        .clka           (clk),
        .addra          (RAMCODE_WADDR),
        .addrb          (RAMCODE_RADDR),
        .dina           (RAMCODE_WDATA),
        .doutb          (RAMCODE_RDATA),
        .wea            (RAMCODE_WRITE)
    );

    Block_RAM RAM_DATA(
        .clka           (clk),
        .addra          (RAMDATA_WADDR),
        .addrb          (RAMDATA_RADDR),
        .dina           (RAMDATA_WDATA),
        .doutb          (RAMDATA_RDATA),
        .wea            (RAMDATA_WRITE)
    );

//------------------------------------------------------------------------------
// APB_Keyboard
//------------------------------------------------------------------------------

    APB_Keyboard APB_Keyboard(
        .clk            (clk),
        .rst_n          (cpuresetn),
        .col_in         (col),
        .row            (row),
        .PRDATA         (Keyboard_PRDATA),
        .KeyboardINT    (KeyboardIRQ)
    );

//------------------------------------------------------------------------------
// AHB_FIFO_Interface
//------------------------------------------------------------------------------

    wire       PTFIFO_wfull;
    wire       PTFIFO_winc;
    wire[31:0] PTFIFO_wdata;

    AHB_FIFO_Interface AHB_FIFO_Interface(
        .clk            (clk),
        .rst_n          (cpuresetn),
        .wfull          (PTFIFO_wfull),
        .HSEL           (PTFIFO_HSEL&(~PTFIFO_HADDR[2])),
        .HWRITE         (PTFIFO_HWRITE),
        .HREADY         (PTFIFO_HREADY),
        .HTRANS         (PTFIFO_HTRANS),
        .HWDATA         (PTFIFO_HWDATA),
        .HREADYOUT      (PTFIFO_HREADYOUT),
        .HRDATA         (PTFIFO_HRDATA),
        .HRESP          (PTFIFO_HRESP),
        .winc           (PTFIFO_winc),
        .wdata          (PTFIFO_wdata)
    );

//------------------------------------------------------------------------------
// Inflate core 
//------------------------------------------------------------------------------

inflate_core inflate_core(
    .clk                (clk),
    .rst_n              (cpuresetn),
    //APB Slave intf
    .PWRITE             (INFLATE_PWRITE ),
    .PSEL               (INFLATE_PSEL   ),
    .PENABLE            (INFLATE_PENABLE),
    .PWDATA             (INFLATE_PWDATA ),
    .PADDR              (INFLATE_PADDR  ),
    .PRDATA             (INFLATE_PRDATA ),
    //AHB Slave intf
    .HREADY             (INFLATE_HREADY ),
    .HRDATA             (INFLATE_HRDATA ),
    .HADDR              (INFLATE_HADDR  ),
    .HTRANS             (INFLATE_HTRANS ),
    //FIFO intf
    .data_out           (INFLATE_data_out    ),
    .data_out_vld       (INFLATE_data_out_vld),
    .data_out_rdy       (INFLATE_data_out_rdy),
    //intr
    .decode_finish      (INFLATE_decode_finish)
);

assign INFLATE_PWRITE  = PWRITE;
assign INFLATE_PENABLE = PENABLE;
assign INFLATE_PWDATA  = PWDATA;
assign INFLATE_PADDR   = {16'b0,PADDR};

//------------------------------------------------------------------------------
// PTFIFO
//------------------------------------------------------------------------------

    wire       PTFIFO_rempty;
    wire       PTFIFO_rinc;
    wire[31:0] PTFIFO_rdata;

    FIFO_synq #(
        .width(32),
        .depth(5)
    ) PTFIFO(
        .clk            (clk),
        .rst_n          (cpuresetn),
        .winc           (PTFIFO_winc),
        .rinc           (PTFIFO_rinc),
        .wdata          (PTFIFO_wdata),
        .wfull          (PTFIFO_wfull),
        .rempty         (PTFIFO_rempty),
        .rdata          (PTFIFO_rdata)
    );


//------------------------------------------------------------------------------
// Printer
//------------------------------------------------------------------------------

    wire       INFIFO_wfull;
    wire       INFIFO_winc;
    wire[16:0] INFIFO_wdata;



    always @(posedge clk) begin
        INFLATE_WR_EN <= PTFIFO_HADDR[2] & PTFIFO_HSEL & PTFIFO_HTRANS[1] & PTFIFO_HWRITE & PTFIFO_HREADY;
    end

    always @(posedge clk or negedge cpuresetn) begin
        if(cpuresetn == 1'b0)begin
            INFLATE_EN <= 1'b0;
        end
        else begin
            if(INFLATE_WR_EN == 1'b1)
                INFLATE_EN <= PTFIFO_HWDATA[0];
        end
    end

    Printer Printer(
        .clk            (clk),
        .rst_n          (cpuresetn),
        .rempty         (PTFIFO_rempty),
        .wfull          (INFIFO_wfull),
        .rdata          (PTFIFO_rdata),
        .HREADY         (PTDMA_HREADY),
        .HRDATA         (PTDMA_HRDATA),
        .winc           (INFIFO_winc),
        .rinc           (PTFIFO_rinc),
        .wdata          (INFIFO_wdata),
        .HADDR          (PTDMA_HADDR),
        .HTRANS         (PTDMA_HTRANS),
        .HWRITE         (PTDMA_HWRITE)
    );

    AHB_FIFO_Read inflate_fifo_read(
        .clk                (clk),
        .rst_n              (cpuresetn),
        .data_in_vld        (INFLATE_data_out_vld),
        .data_in            (INFLATE_data_out),
        .HSEL               (INFLATE_EN),
        .HWRITE             (1'b0),
        .HREADY             (PTDMA_HREADY),
        .HTRANS             (PTDMA_HTRANS),
        .HADDR              (PTDMA_HADDR),
        .HREADYOUT          (FIFO_PTDMA_HREADY),
        .HRDATA             (FIFO_PTDMA_HRDATA),
        .HRESP              (),
        .data_in_rdy        (INFLATE_data_out_rdy)
    );

    assign PTDMA_HRDATA = INFLATE_EN ? FIFO_PTDMA_HRDATA : MTX_PTDMA_HRDATA;
    assign PTDMA_HREADY = INFLATE_EN ? FIFO_PTDMA_HREADY : MTX_PTDMA_HREADY;


//------------------------------------------------------------------------------
// Interface_9341_FIFO
//------------------------------------------------------------------------------

    wire       INFIFO_rempty;
    wire       INFIFO_rinc;
    wire[16:0] INFIFO_rdata;

    FIFO_synq #(
        .width(17),
        .depth(4)
    ) Interface_9341_FIFO(
        .clk            (clk),
        .rst_n          (cpuresetn),
        .winc           (INFIFO_winc),
        .rinc           (INFIFO_rinc),
        .wdata          (INFIFO_wdata),
        .wfull          (INFIFO_wfull),
        .rempty         (INFIFO_rempty),
        .rdata          (INFIFO_rdata)
    );



//------------------------------------------------------------------------------
// Interface_9341
//------------------------------------------------------------------------------

    Interface_9341 Interface_9341(
        .clk            (clk),
        .rst_n          (cpuresetn),
        .rempty         (INFIFO_rempty),
        .rdata          (INFIFO_rdata),
        .rinc           (INFIFO_rinc),
        .LCD_DATA       (LCD_DATA),
        .LCD_CS         (LCD_CS),
        .LCD_WR         (LCD_WR),
        .LCD_RS         (LCD_RS),
        .LCD_RD         (LCD_RD),
        .LCD_RST        (LCD_RST),
        .LCD_BL_CTR     (LCD_BL_CTR)
    );

//------------------------------------------------------------------------------
// Timer
//------------------------------------------------------------------------------

    Timer #(
        .hiFq(0)
    ) Timer(
        .clk            (clk),
        .rst_n          (cpuresetn),
        .HRDATA         (Timer_PRDATA),
        .TimerIRQ       (TimerIRQ)
    );

//------------------------------------------------------------------------------
// APB_UART
//------------------------------------------------------------------------------

    cmsdk_apb_uart UART(
        .PCLK           (clk),
        .PCLKG          (clk),
        .PRESETn        (cpuresetn),
        .PSEL           (UART_PSEL),
        .PADDR          (PADDR[11:2]),
        .PENABLE        (PENABLE),
        .PWRITE         (PWRITE),
        .PWDATA         (PWDATA),
        .ECOREVNUM      (4'b0),
        .PRDATA         (UART_PRDATA),
        .PREADY         (UART_PREADY),
        .PSLVERR        (UART_PSLVERR),
        .RXD            (RXD),
        .TXD            (TXD),
        .TXEN           (),
        .BAUDTICK       (),
        .TXINT          (),
        .RXINT          (RXIRQ),
        .TXOVRINT       (),
        .RXOVRINT       (),
        .UARTINT        ()
    );

endmodule