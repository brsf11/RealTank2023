module AHB_FIFO_Read(input wire        clk,rst_n,
                     input wire        data_in_vld,
                     input wire[15:0]  data_in,
                     input wire        HSEL,
                     input wire        HWRITE,
                     input wire        HREADY,
                     input wire[1:0]   HTRANS,
                     input wire[31:0]  HADDR,
                     output reg        HREADYOUT,
                     output wire[31:0] HRDATA,
                     output wire       HRESP,
                     output reg        data_in_rdy);

    assign HRESP  = 1'b0;

    parameter AddrPh = 1'b0;
    parameter DataPh = 1'b1;
    reg curr_state,next_state;

    always @(posedge clk) begin
        if(!rst_n) curr_state <= AddrPh;
        else curr_state <= next_state;
    end

    always @(*) begin
        case(curr_state)
            AddrPh:begin
                data_in_rdy = 1'b0;
                if(HTRANS[1]&HSEL&(~HWRITE)&HREADY)begin
                    next_state  = DataPh;
                    HREADYOUT   = 1'b1;
                end
                else begin
                    next_state  = AddrPh;
                    HREADYOUT   = 1'b1;
                end
            end
            DataPh:begin
                data_in_rdy = 1'b1;
                if(data_in_vld == 1'b1)begin
                    next_state  = AddrPh;
                    HREADYOUT   = 1'b1;
                end
                else begin
                    next_state  = DataPh;
                    HREADYOUT   = 1'b0;
                end
            end
            default:begin
                next_state  = AddrPh;
                HREADYOUT   = 1'b1;
                data_in_rdy = 1'b0;
            end
        endcase
    end

    reg HADDR_1_reg;
    always @(posedge clk) begin
        if((curr_state == AddrPh) && (next_state == DataPh))
            HADDR_1_reg <= HADDR[1];
    end

    assign HRDATA = HADDR_1_reg ? {data_in,16'b0} : {16'b0,data_in};

endmodule