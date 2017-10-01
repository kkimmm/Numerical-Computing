%--------Lagrange插值（数值计算形式）--------
format long
clc;clear;
X=[0.32,0.34,0.36 1 ];
Y=[0.314567,0.333487,0.352274 0.841470984807897];
x=0.5;   %要求该插值点(或点集)的函数值
n = length(X);
m = length(x);
for k=1:m   %对x的每个点都要求其插值函数值
    sum = 0;
    for i=1:n
        li = 1.0;   %li表示li(x)，即插值基函数
        for j=1:n
            if j~=i
                li=li*(x(k)-X(j))/(X(i)-X(j));   %求插值基函数（的值）
            end
        end
        sum = sum+li*Y(i);  %sum表示拉格朗日插值多项式（的值）
    end
    y(k)=sum;
end
fprintf('经过拉格朗日插值后,点(或点集)x的函数值为')
y(k)
fprintf('误差为')
Rx=sum-sin(0.3367)
