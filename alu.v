//Description:	Arithmetic logic unit executing 16 operations

module alu(a,b,command,oe,y);

  parameter ADD  = 4'b0000, // Add two 4 bit numbers a and b.
            INC  = 4'b0001, // Increment a by 1.
            SUB  = 4'b0010, // Subtracts b from a.
            DEC  = 4'b0011, // Decrement a by 1.
            MUL  = 4'b0100, // Multiply 4 bit numbers a and b.
            DIV  = 4'b0101, // Divide a by b.
            SHL  = 4'b0110, // Shift a to left side by 1 bit.
            SHR  = 4'b0111, // Shift a to right by 1 bit.
            AND  = 4'b1000, // Logical AND
            OR   = 4'b1001, // Logical OR
            INV  = 4'b1010, // Compement
            NAND = 4'b1011, // Logical NAND
            NOR  = 4'b1100, // Logical NOR
            XOR  = 4'b1101, // Logical EXOR
            XNOR = 4'b1110, // Logical EXNOR
            BUF  = 4'b1111; // Buffer

           input [7:0] a,b;
  input [3:0] command;
  input oe;

  output [15:0] y;
  reg    [15:0] out;
           
  always@(command)
  begin
    case (command)

    //functionality 
            ADD : out=a+b;// Add two 4 bit numbers a and b.
            INC : out=a+1;// Increment a by 1.
            SUB : out=b-a; // Subtracts b from a.
            DEC : out=a-1; // Decrement a by 1.
            MUL : out=a*b;// Multiply 4 bit numbers a and b.
            DIV : out=a/b; // Divide a by b.
            SHL : out=a<<1'b1; //Shift a to left side by 1 bit.
            SHR : out=a>>1'b1;// Shift a to right by 1 bit.
            AND : out=a&b; // Logical AND
            OR  : out=a|b;// Logical OR
            INV : out=~a;// Complement
            NAND : out=~(a&b);// Logical NAND
            NOR : out=~(a|b);// Logical NOR
            XOR : out=a^b;// Logical EXOR
            XNOR : out=~(a^b);// Logical EXNOR
            BUF  : out=a;// Buffer
                default : out=16'bxxxx;

    endcase
  end
  assign y = (oe) ? out : 16'hzzzz;

endmodule
