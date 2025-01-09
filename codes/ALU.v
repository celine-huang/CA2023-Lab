`include "functions.vh"

module ALU
(
    reg_i,
    mux_i,
    ALUCtrl_i,
    ALU_o
);

// Ports
input signed    [31:0]  reg_i;
input signed    [31:0]  mux_i;
input           [2:0]   ALUCtrl_i;
output signed   [31:0]  ALU_o;
reg             [31:0]  ALU_o;

always @(reg_i or mux_i or ALUCtrl_i) begin
    case(ALUCtrl_i)
        `ADD_ALUCtrl:  ALU_o = reg_i + mux_i;
        `SUB_ALUCtrl:  ALU_o = reg_i - mux_i;
        `AND_ALUCtrl:  ALU_o = reg_i & mux_i;
        `XOR_ALUCtrl:  ALU_o = reg_i ^ mux_i;
        `SLL_ALUCtrl:  ALU_o = reg_i << mux_i;
        `MUL_ALUCtrl:  ALU_o = reg_i * mux_i;
        `SRAI_ALUCtrl: ALU_o = reg_i >>> mux_i;
    endcase
end

endmodule