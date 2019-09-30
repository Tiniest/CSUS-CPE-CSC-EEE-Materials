// Ryan Kozak
// CSC137 Class #32509
// 
// mux4x1.v, 4x1 multiplexor, gate synthesis
// compile: ~changw/ivl/bin/iverilog mux4x2.1
// run: ./a.out

module MuxMod(s1, s0, d0, d1, d2, d3, o);

   input s1, s0, d0, d1, d2, d3;
   output o;

   wire s_inv1, s_inv0, and0, and1, and2, and3; // additional needed wires

   not(s_inv1, s1);          // "not" is built-in gate
   not(s_inv0, s0);         // "not" is built-in gate
  
   and(and0, s_inv1, s_inv0, d0 ); // "and" is built-in gate
   and(and1, s_inv1, s0, d1); // "and" is built-in gate
   and(and2, s1, s_inv0,  d2); // "and" is built-in gate
   and(and3, s1, s0, d3); // "and" is built-in gate

   or(o, and0, and1, and2, and3); // "or" is built-in gate

endmodule

module TestMod;
   reg s1, s0, d0, d1, d2, d3;
   wire o;

   MuxMod my_mux(s1, s0, d0, d1, d2, d3, o);

   initial begin
      $display("Time\ts1\ts0\td0\td1\td2\td3\to");
      $display("---------------------------------------------------------");
      $monitor("%0d\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, s1, s0, d0, d1, d2, d3, o);
   end

   initial begin
      s1 = 0; s0 = 0;  d0 = 0; d1 = 0; d2 = 0; d3 = 0; // 0 0 0 0 0 0 //0 
      #1;
      s1 = 0; s0 = 0;  d0 = 0; d1 = 0; d2 = 0; d3 = 1; // 0 0 0 0 0 1 //1
      #1;                     
      s1 = 0; s0 = 0;  d0 = 0; d1 = 0; d2 = 1; d3 = 0; // 0 0 0 0 1 0 //2
      #1;                   
      s1 = 0; s0 = 0;  d0 = 0; d1 = 0; d2 = 1; d3 = 1; // 0 0 0 0 1 1 //3
      #1;                   
      s1 = 0; s0 = 0;  d0 = 0; d1 = 1; d2 = 0; d3 = 0; // 0 0 0 1 0 0 //4
      #1;                  
      s1 = 0; s0 = 0;  d0 = 0; d1 = 1; d2 = 0; d3 = 1; // 0 0 0 1 0 1 //5
      #1;                    
      s1 = 0; s0 = 0;  d0 = 0; d1 = 1; d2 = 1; d3 = 0; // 0 0 0 1 1 0 //6
      #1;
      s1 = 0; s0 = 0;  d0 = 0; d1 = 1; d2 = 1; d3 = 1; // 0 0 0 1 1 1 //7
      #1;
      s1 = 0; s0 = 0;  d0 = 1; d1 = 0; d2 = 0; d3 = 0; // 0 0 1 0 0 0 //8
      #1;
      s1 = 0; s0 = 0;  d0 = 1; d1 = 0; d2 = 0; d3 = 1; // 0 0 1 0 0 1 //9
      #1;
      s1 = 0; s0 = 0;  d0 = 1; d1 = 0; d2 = 1; d3 = 0; // 0 0 1 0 1 0 //10
      #1;
      s1 = 0; s0 = 0;  d0 = 1; d1 = 0; d2 = 1; d3 = 1; // 0 0 1 0 1 1 //11
      #1 ;
      s1 = 0; s0 = 0;  d0 = 1; d1 = 1; d2 = 0; d3 = 0; // 0 0 1 1 0 0 //12
      #1 ;    
      s1 = 0; s0 = 0;  d0 = 1; d1 = 1; d2 = 0; d3 = 1; // 0 0 1 1 0 1 //13
      #1;
      s1 = 0; s0 = 0;  d0 = 1; d1 = 1; d2 = 1; d3 = 0; // 0 0 1 1 1 0 //14
      #1;
      s1 = 0; s0 = 0;  d0 = 1; d1 = 1; d2 = 1; d3 = 1; // 0 0 1 1 1 1 //15
      #1;
      s1 = 0; s0 = 1;  d0 = 0; d1 = 0; d2 = 0; d3 = 0; // 0 1 0 0 0 0 //16
      #1;
      s1 = 0; s0 = 1;  d0 = 0; d1 = 0; d2 = 0; d3 = 1; // 0 1 0 0 0 1 //17
      #1;
      s1 = 0; s0 = 1;  d0 = 0; d1 = 0; d2 = 1; d3 = 0; // 0 1 0 0 0 1 //18
      #1;
      s1 = 0; s0 = 1;  d0 = 0; d1 = 0; d2 = 1; d3 = 1; // 0 1 0 0 1 1 //19
      #1;
      s1 = 0; s0 = 1;  d0 = 0; d1 = 1; d2 = 0; d3 = 0; // 0 1 0 1 0 0 //20
      #1;
      s1 = 0; s0 = 1;  d0 = 0; d1 = 1; d2 = 0; d3 = 1; // 0 1 0 1 0 1 //21
      #1;
      s1 = 0; s0 = 1;  d0 = 0; d1 = 1; d2 = 1; d3 = 0; // 0 1 0 1 1 0 //22
      #1;
      s1 = 0; s0 = 1;  d0 = 0; d1 = 1; d2 = 1; d3 = 1; // 0 1 0 1 1 1 //23
      #1;
      s1 = 0; s0 = 1;  d0 = 1; d1 = 0; d2 = 0; d3 = 0; // 0 1 1 0 0 0 //24
      #1;
      s1 = 0; s0 = 1;  d0 = 1; d1 = 0; d2 = 0; d3 = 1; // 0 1 1 0 0 1 //25
      #1;
      s1 = 0; s0 = 1;  d0 = 1; d1 = 0; d2 = 1; d3 = 0; // 0 1 0 0 0 1 //26
      #1;
      s1 = 0; s0 = 1;  d0 = 1; d1 = 0; d2 = 1; d3 = 1; // 0 1 1 0 1 1 //27
      #1;
      s1 = 0; s0 = 1;  d0 = 1; d1 = 1; d2 = 0; d3 = 0; // 0 1 1 1 0 0 //28
      #1;
      s1 = 0; s0 = 1;  d0 = 1; d1 = 1; d2 = 0; d3 = 1; // 0 1 1 1 0 1 //29
      #1;
      s1 = 0; s0 = 1;  d0 = 1; d1 = 1; d2 = 1; d3 = 0; // 0 1 1 1 1 0 //30
      #1;
      s1 = 0; s0 = 1;  d0 = 1; d1 = 1; d2 = 1; d3 = 1; // 0 1 1 1 1 1 //31
      #1;
      s1 = 1; s0 = 0;  d0 = 0; d1 = 0; d2 = 0; d3 = 0; // 1 0 0 0 0 0 //32
      #1;
      s1 = 1; s0 = 0;  d0 = 0; d1 = 0; d2 = 0; d3 = 1; // 1 0 0 0 0 1 //33
      #1;
      s1 = 1; s0 = 0;  d0 = 0; d1 = 0; d2 = 1; d3 = 0; // 1 0 0 0 1 0 //34
      #1;
      s1 = 1; s0 = 0;  d0 = 0; d1 = 0; d2 = 1; d3 = 1; // 1 0 0 0 0 0 //35
      #1;
      s1 = 1; s0 = 0;  d0 = 0; d1 = 1; d2 = 0; d3 = 0; // 1 0 0 1 0 0 //36
      #1;
      s1 = 1; s0 = 0;  d0 = 0; d1 = 1; d2 = 0; d3 = 1; // 1 0 0 1 0 1 //37
      #1;
      s1 = 1; s0 = 0;  d0 = 0; d1 = 1; d2 = 1; d3 = 0; // 1 0 0 1 1 0 //38
      #1;
      s1 = 1; s0 = 0;  d0 = 0; d1 = 1; d2 = 1; d3 = 1; // 1 0 0 1 1 1 //39
      #1;
      s1 = 1; s0 = 0;  d0 = 1; d1 = 0; d2 = 0; d3 = 0; // 1 0 1 0 0 0 //40
      #1;
      s1 = 1; s0 = 0;  d0 = 1; d1 = 0; d2 = 0; d3 = 1; // 1 0 1 0 0 1 //41
      #1;
      s1 = 1; s0 = 0;  d0 = 1; d1 = 0; d2 = 1; d3 = 0; // 1 0 1 0 1 0 //42
      #1;
      s1 = 1; s0 = 0;  d0 = 1; d1 = 0; d2 = 1; d3 = 1; // 1 0 1 0 1 1 //43
      #1;
      s1 = 1; s0 = 0;  d0 = 1; d1 = 1; d2 = 0; d3 = 0; // 1 0 1 1 0 0 //44
      #1;
      s1 = 1; s0 = 0;  d0 = 1; d1 = 1; d2 = 0; d3 = 1; // 1 0 1 1 0 1 //45
      #1;
      s1 = 1; s0 = 0;  d0 = 1; d1 = 1; d2 = 1; d3 = 0; // 1 0 1 1 1 0 //46
      #1;
      s1 = 1; s0 = 0;  d0 = 1; d1 = 1; d2 = 1; d3 = 1; // 1 0 1 1 1 1 //47
      #1;
      s1 = 1; s0 = 1;  d0 = 0; d1 = 0; d2 = 0; d3 = 0; // 1 1 0 0 0 0 //48
      #1;
      s1 = 1; s0 = 1;  d0 = 0; d1 = 0; d2 = 0; d3 = 1; // 1 0 0 0 0 1 //49
      #1;
      s1 = 1; s0 = 1;  d0 = 0; d1 = 0; d2 = 1; d3 = 0; // 1 1 0 0 1 0 //50
      #1;
      s1 = 1; s0 = 1;  d0 = 0; d1 = 0; d2 = 1; d3 = 1; // 1 1 0 0 1 1 //51
      #1;
      s1 = 1; s0 = 1;  d0 = 0; d1 = 1; d2 = 0; d3 = 0; // 1 1 0 1 0 0 //52
      #1;
      s1 = 1; s0 = 1;  d0 = 0; d1 = 1; d2 = 0; d3 = 1; // 1 1 0 1 0 1 //53
      #1;
      s1 = 1; s0 = 1;  d0 = 0; d1 = 1; d2 = 1; d3 = 0; // 1 1 0 1 1 0 //54
      #1;
      s1 = 1; s0 = 1;  d0 = 0; d1 = 1; d2 = 1; d3 = 1; // 1 1 0 1 1 1 //55
      #1;
      s1 = 1; s0 = 1;  d0 = 1; d1 = 0; d2 = 0; d3 = 0; // 1 1 1 0 0 0 //56
      #1;
      s1 = 1; s0 = 1;  d0 = 1; d1 = 0; d2 = 0; d3 = 1; // 1 1 1 0 0 1 //57
      #1;
      s1 = 1; s0 = 1;  d0 = 1; d1 = 0; d2 = 1; d3 = 0; // 1 1 1 0 1 0 //58
      #1;
      s1 = 1; s0 = 1;  d0 = 1; d1 = 0; d2 = 1; d3 = 1; // 1 1 1 0 1 1 //59
      #1;
      s1 = 1; s0 = 1;  d0 = 1; d1 = 1; d2 = 0; d3 = 0; // 1 1 1 1 0 0 //60
      #1;
      s1 = 1; s0 = 1;  d0 = 1; d1 = 1; d2 = 0; d3 = 1; // 1 1 1 1 0 1 //61
      #1;
      s1 = 1; s0 = 1;  d0 = 1; d1 = 1; d2 = 1; d3 = 0; // 1 1 1 1 1 0 //62
      #1;
      s1 = 1; s0 = 1;  d0 = 1; d1 = 1; d2 = 1; d3 = 1; // 1 1 1 1 1 1 //63
  end
endmodule