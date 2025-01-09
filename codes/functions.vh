// opcode
`define Rtype_Opcode    7'b0110011
`define Itype_Opcode    7'b0010011

// R-type funct7+funct3
`define AND_funct       10'b0000000111
`define XOR_funct       10'b0000000100
`define SLL_funct       10'b0000000001
`define ADD_funct       10'b0000000000
`define SUB_funct       10'b0100000000
`define MUL_funct       10'b0000001000

// I type funct3
`define ADDI_funct      3'b000
`define SRAI_funct      3'b101

// ALUOps
`define Rtype_ALUOp     2'b10
`define Itype_ALUOp     2'b00

// ALUCtrls
`define ADD_ALUCtrl     3'b000
`define SUB_ALUCtrl     3'b001
`define AND_ALUCtrl     3'b010
`define XOR_ALUCtrl     3'b011
`define SLL_ALUCtrl     3'b100
`define MUL_ALUCtrl     3'b101
`define SRAI_ALUCtrl    3'b110
