//Description:	Asynchronous Single port Random access memory (16x8)

module ram(data,
           we,
           enable,
           addr);

  input we,
        enable;
  input [3:0] addr;
  inout [7:0] data;
// Declarationof 8 bit wide memory having 16 locations.
  reg [7:0] mem [15:0];


  always@(data,we,enable,addr)
    if (we && !enable)
       mem[addr]=data;

  assign data= (enable && !we) ? mem[addr] : 8'hzz;

endmodule

