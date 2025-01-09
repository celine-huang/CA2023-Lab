module CPU
(
    clk_i, 
    rst_i
);

// Ports
input           clk_i;
input           rst_i;

wire [31:0] add_PC;
wire [31:0] instr_addr;

PC PC(
    .clk_i      (clk_i),
    .rst_i      (rst_i),
    .pc_i       (add_PC),
    .pc_o       (instr_addr)
);

Adder Add_PC(
    .data1_i    (instr_addr),
	.data2_i    (32'd4),
	.add_o      (add_PC)
);

wire [31:0] instruction;

Instruction_Memory Instruction_Memory(
    .addr_i     (instr_addr), 
    .instr_o    (instruction)
);

wire [1:0] control_ALUCtrl;
wire control_mux;
wire control_register;

Control Control(
    .instr_i    (instruction[6:0]),
	.ALUOp_o    (control_ALUCtrl),
	.ALUSrc_o   (control_mux),
    .RegWrite_o (control_register)
);

wire [31:0] ALUresult;
wire [31:0] register_ALU;
wire [31:0] register_mux;

Registers Registers(
    .rst_i      (rst_i),
    .clk_i      (clk_i),
    .RS1addr_i  (instruction[19:15]),       // Read Register 1
    .RS2addr_i  (instruction[24:20]),       // Read Register 2
    .RDaddr_i   (instruction[11:7]),        // Write Register
    .RDdata_i   (ALUresult),                // Write Data
    .RegWrite_i (control_register),         // RegWrite
    .RS1data_o  (register_ALU),             // Read Data 1
    .RS2data_o  (register_mux)              // Read Data 2
);

wire [31:0] sign_mux;

Sign_Extend Sign_Extend(
    .instr_i    (instruction),
    .sign_o     (sign_mux)
);

wire [31:0] mux_ALU;

MUX32 MUX_ALUSrc(
    .Regdata_i  (register_mux),
    .Signdata_i (sign_mux),
    .ALUSrc_i   (control_mux),
    .mux_o      (mux_ALU)
);

wire [9:0] instr_ALUCtrl;
assign instr_ALUCtrl = {instruction[31:25], instruction[14:12]};
wire [2:0] ALUCtrl_ALU;

ALU_Control ALU_Control(
    .instr_i     (instr_ALUCtrl),
    .ALUOp_i     (control_ALUCtrl),
    .ALUCtrl_o   (ALUCtrl_ALU)
);
  
ALU ALU(
    .reg_i       (register_ALU),
    .mux_i       (mux_ALU),
    .ALUCtrl_i   (ALUCtrl_ALU),
    .ALU_o       (ALUresult)
);

endmodule
