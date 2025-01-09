`include "functions.vh"

module ALU_Control
(
    instr_i,
    ALUOp_i,
    ALUCtrl_o
);

// Ports
input   [9:0]   instr_i;
input   [1:0]   ALUOp_i;
output  [2:0]   ALUCtrl_o;
reg     [2:0]   ALUCtrl_o;

always @(instr_i or ALUOp_i) begin
    case(ALUOp_i)
        `Rtype_ALUOp:
            case(instr_i)
                `AND_funct: ALUCtrl_o = `AND_ALUCtrl;
                `XOR_funct: ALUCtrl_o = `XOR_ALUCtrl;
                `SLL_funct: ALUCtrl_o = `SLL_ALUCtrl;
                `ADD_funct: ALUCtrl_o = `ADD_ALUCtrl;
                `SUB_funct: ALUCtrl_o = `SUB_ALUCtrl;
                `MUL_funct: ALUCtrl_o = `MUL_ALUCtrl;
            endcase
        `Itype_ALUOp:
            case(instr_i[2:0])
                `ADDI_funct: ALUCtrl_o = `ADD_ALUCtrl;
                `SRAI_funct: ALUCtrl_o = `SRAI_ALUCtrl;
            endcase
    endcase
end

endmodule