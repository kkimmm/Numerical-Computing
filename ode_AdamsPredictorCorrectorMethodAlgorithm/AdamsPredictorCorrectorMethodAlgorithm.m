%-----------------(4阶)Adams预测-校正方法(PECE)-----------
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

%(4阶)Adams预测-校正方法公式
for i = 4:n
    %预测(P)
    s1 = feval(@(x,y)(y-2*x./y),x(i-3),y(i-3));
    s2 = feval(@(x,y)(y-2*x./y),x(i-2),y(i-2));
    s3 = feval(@(x,y)(y-2*x./y),x(i-1),y(i-1));
    s4 = feval(@(x,y)(y-2*x./y),x(i),y(i));
    %求值(E)
    y(i+1) = y(i) + h/24*(55*s4-59*s3+37*s2-9*s1);
    %校正(C)
    s5 = feval(@(x,y)(y-2*x./y),x(i+1),y(i+1));
    %求值(E)
    y(i+1) = y(i) + h/24*(9*s5+19*s4-5*s3+s2);
end
fprintf('Adams预测-校正方法计算的解为：')
y
fs1 = sqrt(1+2*x);
plot(x,y,'o-b',x,fs1,'r');
legend('Adams预测-校正方法求出来的解','真实解')  