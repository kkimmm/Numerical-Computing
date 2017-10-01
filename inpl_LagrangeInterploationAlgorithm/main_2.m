%--------Lagrange插值（画函数图像形式）--------
format long
clc;clear;
X=-5:1:5;
Y=1./(X.^2+1);
x=-5:0.1:5; %要进行插值计算的点集{-5，-4...4,5}
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
    y(k)=sum
end
%  y1=sin(x);
plot(X,Y,'or',x,y,'g')   %可以发现对于Y=1./(X.^2+1);这个函数当n=10时拉格朗日插值
%效果非常差，相同的数据对比后面的分段线性插值可以发现分段线性插值才是收敛的
legend('样本点','拉格朗日差值函数图像')
