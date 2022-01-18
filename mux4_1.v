//Description:	4:1 mux design

module mux4_1(a,
              sel,
              y);



// Defining the port directions

        input [3:0]a;
        input [1:0]sel;
        output  y;
        wire [3:0]a;
        wire [1:0]sel;
        reg y;


// MUX behaviour

       always@(*)
  begin
    case(sel)
      2'd0:y=a[0];
      2'd1:y=a[1];
      2'd2:y=a[2];
      2'd3:y=a[3];
    endcase
  end


endmodule

