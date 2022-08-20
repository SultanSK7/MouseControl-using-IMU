clc
clear;
import java.awt.*;
import java.awt.Robot;
R=Robot(); 
delete(instrfindall);
a=serial('COM3','BaudRate',115200);
fopen(a);
tic
while(toc<60)
   yaw=fscanf(a,'%c');
   pitch=fscanf(a,'%c');
   y=str2double(yaw);
   p=str2double(pitch);
   yaw1=(y*8.5375+683);%8.5375
   pitch1=(-6.4*p+384);%-6.4..-4.8 was initial
   R.mouseMove(ceil(yaw1),ceil(pitch1));
end
fclose(a);


