%-----------------(4阶)Adams显式方法-----------
%----Adams显式方法 y(i+1) = y(i) + h/24*(55*f(n)-59*f(n-1)+37*f(n-2)-9*f(n-3))
%----隐式方法 y(i+1) = y(i) + h/24*(9*f(n+1)+19*f(n)-5*f(n-1)+f(n-2))
clc;clear;
x0 = 0;       %y(x0) = y0  以上是需要计算的微分方程初值方程，且x0代表解区间的下限
y0 = 1;     
xn = 1;     %解的区间上限
n = 10;
y(1) = y0;
h = (xn-x0)/n;
x = x0:h:xn;

%k步(阶)Adams方法的前k个初值需要其他方法计算，这里我们使用四阶Runge-Kutta法计算
for i = 1:3
    k1 = feval(@(x,y)(y-2*x./y),x(i),y(i));
    k2 = feval(@(x,y)(y-2*x./y),x(i)+h/2,y(i)+h/2*k1);
    k3 = feval(@(x,y)(y-2*x./y),x(i)+h/2,y(i)+h/2*k2);
    k4 = feval(@(x,y)(y-2*x./y),x(i)+h,y(i)+h*k3);
    y(i+1) = y(i) +h/6*(k1+2*k2+2*k3+k4); 
end

%(4阶)Adams(显式)方法计算公式
for i = 4:n
     s1 = feval(@(x,y)(y-2*x./y),x(i-3),y(i-3));
     s2 = feval(@(x,y)(y-2*x./y),x(i-2),y(i-2));
     s3 = feval(@(x,y)(y-2*x./y),x(i-1),y(i-1));
     s4 = feval(@(x,y)(y-2*x./y),x(i),y(i));
    y(i+1) = y(i) + h/24*(55*s4-59*s3+37*s2-9*s1)
end
fprintf('显式Adams法计算的解为：')
y
fs1 = sqrt(1+2*x);
plot(x,y,'o-b',x,fs1,'r');
legend('显式Adams法求出来的解','真实解')  