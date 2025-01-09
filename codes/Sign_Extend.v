`include "functions.vh"

module Sign_Extend
(
    instr_i,
    sign_o
);

// Ports
input   [31:0]   instr_i;
output  [31:0]   sign_o;
reg     [11:0]   immediate;

assign sign_o = {{20{immediate[11]}}, immediate[11:0]};

always @(instr_i)    begin
    if (instr_i[6:0] == `Itype_Opcode)   begin
        if (instr_i[14:12] == `ADDI_funct)   begin
            immediate[11:0] = instr_i[31:20];
        end
        else if (instr_i[14:12] == `SRAI_funct)   begin
            immediate[11:0] = {{7{instr_i[24]}}, instr_i[24:20]};
        end
    end
end

endmodule
