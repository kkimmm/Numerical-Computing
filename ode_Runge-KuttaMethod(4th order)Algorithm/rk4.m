%----------R-K方法（4阶）-----------
clc;clear;
x0 = 0;       %y(x0) = y0  以上是需要计算的微分方程初值方程，且x0代表解区间的下限
y0 = 1;     
xn = 0.5;     %解的区间上限
n = 5;
y(1) = y0 ;
h = (xn - x0)/n;
x = x0:h:xn;

%四阶Runge-Kutta法公式
for i = 1:n
    k1 = feval(@(x,y)(y-2*x./y),x(i),y(i));
    k2 = feval(@(x,y)(y-2*x./y),x(i)+h/2,y(i)+h/2*k1);
    k3 = feval(@(x,y)(y-2*x./y),x(i)+h/2,y(i)+h/2*k2);
    k4 = feval(@(x,y)(y-2*x./y),x(i)+h,y(i)+h*k3);
    y(i+1) = y(i) +h/6*(k1+2*k2+2*k3+k4); 
end

fprintf('四阶Runge-Kutta法计算的解为：')
y
fs1 = sqrt(1+2*x);
plot(x,y,'o-b',x,fs1,'r');
legend('四阶Runge-Kutta法求出来的解','真实解')  
%与Euler法、后退Euler法甚至是梯形法比较，可以发现四阶R-K法计算的结果要精确得多