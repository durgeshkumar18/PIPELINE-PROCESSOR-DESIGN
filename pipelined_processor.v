// pipelined_processor.v
module pipelined_processor(
    input clk,
    input rst
);

    // Instruction format: [15:12]=opcode, [11:8]=dest, [7:4]=src1, [3:0]=src2/addr
    // Opcodes: ADD=0001, SUB=0010, LOAD=0011

    reg [15:0] instr_mem [0:15];
    reg [7:0] data_mem [0:15];
    reg [7:0] reg_file [0:15];

    // Pipeline registers
    reg [15:0] IF_ID;
    reg [15:0] ID_EX;
    reg [7:0]  EX_MEM_val;
    reg [3:0]  EX_MEM_rd;
    reg [3:0]  EX_MEM_opcode;

    // Stage 1: Instruction Fetch
    reg [3:0] PC;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            PC <= 0;
            IF_ID <= 0;
        end else begin
            IF_ID <= instr_mem[PC];
            PC <= PC + 1;
        end
    end

    // Stage 2: Instruction Decode
    wire [3:0] opcode = IF_ID[15:12];
    wire [3:0] rd = IF_ID[11:8];
    wire [3:0] rs1 = IF_ID[7:4];
    wire [3:0] rs2_addr = IF_ID[3:0];

    reg [7:0] rs1_val, rs2_val;
    always @(posedge clk) begin
        rs1_val <= reg_file[rs1];
        rs2_val <= (opcode == 4'b0011) ? data_mem[rs2_addr] : reg_file[rs2_addr]; // load uses addr
        ID_EX <= IF_ID;
    end

    // Stage 3: Execute
    always @(posedge clk) begin
        case (ID_EX[15:12])
