`include "defines.v"
module pc_reg (
    input   clk,
    input   rst,
    output  reg [`InstAddrBus]   PC,
    output  reg ce  
);
    always @(posedge clk) begin
        if (rst == `RstEnable) begin
            ce = `ChipDisable;
        end else 
            ce = `ChipEnable;
    end

    always @(posedge clk ) begin
        if (ce == `ChipDisable) begin
            PC = 32'h00000000;
        end else
            PC = PC +4'h4;
    end
endmodule