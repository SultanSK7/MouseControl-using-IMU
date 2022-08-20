clc;
import java.awt.*;
import java.awt.Robot;
global a;
a=serial('COM3','BaudRate',115200);
a.BytesAvailableFcn=@mycallback;
a.BytesAvailableFcnMode='byte';
a.InputBufferSize=5000;
a.BytesAvailableFcnCount=24;
fopen(a);
while 1
    pause(2.2);
    final_code;
    %11.2716 is ~ time for c
end
***********************************************************************************************
%24 cha 16 kelay due to removal of roll
flushinput(a);

----------------------------------------------------------------------------------------------------------------------------------------------

function mycallback(obj,event)  
import java.awt.*;
    import java.awt.Robot;
    R=Robot();
    pause(.5);%0.5 initially
    j=1:50;
    data=char(fread(obj,obj.BytesAvailable));
    data1=ceil((sscanf(data,'%f')));
    y=data1(2*j-1);
    p=data1(2*j);
    y1=y*8.5375+683;
    p1=-4.8*p+384;
    for i=1:50
        R.mouseMove(y1(i),p1(i));
        pause(0.05);
    end
    
end
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++