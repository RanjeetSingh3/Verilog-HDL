//Description:	Testbench for 4:1 Mux

module mux4_1_tb();

// Declaration of required variables  
  reg [1:0]sel;
  reg [3:0]a;
  wire y ;

// Declaration of  required internal variables
  integer i,j;

//Instantiation of the Design
  mux4_1 m1(a,sel,y);

  task initialize;
  begin
		a=0;
        sel=0;
  end
  endtask


//Declaration of tasks for driving stimulus to DUT.
  task select(input [1:0]s);
  begin
    sel=s;
  end
  endtask

  task inps(input [3:0]data);
  begin
    a=data;
  end
  endtask


  initial
    begin
     initialize;
    #10;
    for(i=0;i<4;i=i+1)
     begin
      select(i);
      for(j=0;j<16;j=j+1)
       begin
        inps(j);
       #10;
       end
      end
     end

   initial
   $monitor("a[3:0]=%b  sel=%b  y=%d",a,sel,y);

  initial
   #800 $finish;

endmodule

