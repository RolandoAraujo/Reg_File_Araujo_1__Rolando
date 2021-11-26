module decoder(

input [4:0] a,                                 

input en,                                      
 
output [31:0] enc );                       

wire [3:0] w;                                

decoder2x4 x1(w,a[4:3],en);                                                             

decoder3x8 x2(enc[7:0], a[2:0],w[0]);  

decoder3x8 x3(enc[15:8], a[2:0],w[1]);

decoder3x8 x4(enc[23:16], a[2:0],w[2]);

decoder3x8 x5(enc[31:24], a[2:0],w[3]);

endmodule



module decoder2x4(

output reg [3:0] enc,

input [1:0] a,

input en);

always @(a,en)               


if(en)

case(a)

2'b00: enc=4'b0001;    

2'b01: enc=4'b0010;

2'b10: enc=4'b0100;

2'b11: enc=4'b1000;

default: enc=0;

endcase

else enc=0;              

endmodule



module decoder3x8(

output reg [7:0] enc,

input [2:0] a,

input en);

always @(a,en)

if(en)

case(a)                                  


0: enc =8'b00000001;           

1: enc =8'b00000010;           

2: enc =8'b00000100;

3: enc =8'b00001000;

4: enc =8'b00010000;

5: enc =8'b00100000;

6: enc =8'b01000000;

7: enc =8'b10000000;

default: enc=0;

endcase

else enc=0;        

endmodule
