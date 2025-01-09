`include "functions.vh"

module Control
(
    instr_i,
	ALUOp_o,
	ALUSrc_o,
    RegWrite_o
);

// Ports
input   [6:0]   instr_i;
output  [1:0]   ALUOp_o;
reg     [1:0]   ALUOp_o;
output          ALUSrc_o;
output          RegWrite_o;

assign RegWrite_o = 1'b1;
assign ALUSrc_o = (instr_i == `Itype_Opcode) ? 1'b1 : 1'b0;

always @(instr_i) begin
    case (instr_i)
        `Rtype_Opcode: ALUOp_o = `Rtype_ALUOp;
        `Itype_Opcode: ALUOp_o = `Itype_ALUOp;
    endcase
end

endmodule