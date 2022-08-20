tic;
clear ;
import java.awt.*;
import java.awt.Robot;
global a;
delete(instrfindall);
a=serial('COM3','BaudRate',115200);
a.BytesAvailableFcn=@mycallback;
a.BytesAvailableFcnMode='byte';
a.InputBufferSize=5000;
a.BytesAvailableFcnCount=24;%24 cha 16 kelay due to removal of roll
fopen(a);

toc;




--------------------------------------------------------------------------------------------------------------------------------------------------------



function mycallback(obj,event)  
tic;
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
    fclose(obj);
    flushinput(obj);
    delete(obj);
    clear obj;
    toc;
end
 
*****************************************************************************************************************

clc;
while 1
    final_code;
    pause(2.2);%11.2716 is ~ time for execution for pause(0.2 sec),1.9sec for 0.01sec pausec
end

