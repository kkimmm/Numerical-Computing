%---------Eluer法---------
clc;clear;
syms x y;
f = y-2*x./y; %y'=f(x,y) 
x0 = 0;       %y(x0) = y0  以上是需要计算的微分方程初值方程，且x0代表解区间的下线
y0 = 1;     
xn = 1;    %解的区间上限
h = 0.1;     %给定的步长
n = (xn-x0)/h;  %计算次数
fs = zeros(n,1);
fs(1,1) = y0;  
for i=2:n+1      %因为画图要从y0开始，故需要n+1个点，且fs(1,1) = y0已经定义 
    f0 = y0-2*x0./y0;
    y1 = y0+h*f0;   %Eluer法的公式
    fs(i,1) = y1;
    y0 = y1;
    x0 = 0+(i-1)*h;  
end
fprintf('Eluer法计算的解为：')
fs
x = 0:0.1:1;
fs1 = sqrt(1+2*x);
plot(x,fs,'o-b',x,fs1,'r');
legend('Eluer法求出来的解','真实解')


% %------另一种更加简便的Eluer法的写法--------
% clc;clear;
% x0 = 0;       %y(x0) = y0  以上是需要计算的微分方程初值方程，且x0代表解区间的下线
% y0 = 1;     
% xn = 0.5;    %解的区间上限
% n = 5;
% y(1) = y0 ;
% h = (xn - x0)/n;
% x = x0:h:xn;
% for i = 1:n
%     y(i+1) = y(i)+h*feval(@(x,y)(y-2*x./y),x(i),y(i));
% end;
% fprintf('Eluer法计算的解为：')
% y
% fs1 = sqrt(1+2*x);
% plot(x,y,'o-b',x,fs1,'r');
% legend('Eluer法求出来的解','真实解')