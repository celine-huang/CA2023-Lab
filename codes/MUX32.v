module MUX32
(
    Regdata_i,
    Signdata_i,
    ALUSrc_i,
    mux_o
);

// Ports
input   [31:0]   Regdata_i;
input   [31:0]   Signdata_i;
input            ALUSrc_i;
output  [31:0]   mux_o;

assign mux_o = (ALUSrc_i == 1'b0) ? Regdata_i : Signdata_i;

endmodule