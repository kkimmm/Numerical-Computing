%-----------分段线性插值--------------
clc;clear;
X=-5:0.1:5;
Y=1./(X.^2+1);
x=-5:0.1:5; %要进行插值计算的点集{-5，...,5}
syms t;
n=length(X);
for i=1:n-1
    y(i)=((t-X(i+1))/(X(i)-X(i+1)))*Y(i)+((t-X(i))/(X(i+1)-X(i)))*Y(i+1);%对每个区间进行线性插值
end
m=length(x);
for i=1:m
    for j=1:n-1
        if(x(i)>=X(j)&x(i)<=X(j+1))
             yn(i)=subs(y(j),'t',x(i));   %计算插值点的函数值.subs是替换函数，把x0用t替换
        end
    end
end    
plot(X,Y,'or',x,yn,'b')
legend('样本点','分段插值函数值点组成的图像')  %对比朗格朗日插值可以发现令n=10时分段线性插值是收敛的