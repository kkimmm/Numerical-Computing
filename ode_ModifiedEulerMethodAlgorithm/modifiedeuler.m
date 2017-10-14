%----------改进Euler法-----------
clc;clear;
x0 = 0;       %y(x0) = y0  以上是需要计算的微分方程初值方程，且x0代表解区间的下线
y0 = 1;     
xn = 0.5;    %解的区间上限
n = 5;
y(1) = y0 ;
h = (xn - x0)/n;
x = x0:h:xn;
for i = 1:n
    y(i+1) = y(i)+h*feval(@(x,y)(y-2*x./y),x(i),y(i));  %feval用来计算函数在指定点的函数值    
    y(i+1) = y(i)+h/2*(feval(@(x,y)(y-2*x./y),x(i),y(i))+feval(@(x,y)(y-2*x./y),x(i+1),y(i+1)));
end
fprintf('改进Euler法计算的解为：')
y
fs1 = sqrt(1+2*x);
plot(x,y,'o-b',x,fs1,'r');
legend('改进Euler法求出来的解','真实解')  %与Euler法和后退Euler法比较可以发现梯形法计算的结果更精确