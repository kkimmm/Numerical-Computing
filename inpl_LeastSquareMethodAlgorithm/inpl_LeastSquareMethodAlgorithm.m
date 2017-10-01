%-------最小二乘法（以下是以线性拟合为例的）---------
clc;clear;
X = [1 2 3 4 5];
Y = [4 4.5 6 8 8.5];
p = [2 1 3 1 1];
n = length(p);
m = 2;
A = zeros(m,m);
b = zeros(m,1);
A(1,1) = sum(p(1:n));
for i=1:n
    A(1,2) = A(1,2)+p(i)*X(i);
    A(2,1) = A(2,1)+p(i)*X(i);
    A(2,2) = A(2,2)+p(i)*(X(i)*X(i));
    b(1,1) = b(1,1)+p(i)*Y(i);
    b(2,1) = b(2,1)+p(i)*X(i)*Y(i);
end
A
b
a = inv(A)*b
syms x
x = 0:0.5:5
y0 = a(1)+a(2)*x;
y = vpa(y0,6)
plot(X,Y,'or',x,y)
legend('样本点','拟合图像')

% %----------MATLAB系统提供的最小二乘法---------
% clc;clear;
% x=0:0.1:1;
% y=[-0.447,1.978,3.28,6.16,7.08,7.34,7.66,9.56,9.48,9.3,11.2];
% plot(x,y,'k.','markersize',20);
% hold on
% axis([0 1.3 -2 16])   %axis()用于设置函数图像横纵轴范围大小
% p=polyfit(x,y,3);  %polyfit(x,y,n)其中n表示拟合次数，如1表示线性(1次)：y=a0+a1*x
% syms t
% t=0:0.1:1.2;
% 
% s = p(4)+p(3)*t+p(2)*(t.^2)+p(1)*(t.^3) 
% s = vpa(s,6)
% %以上两句等效于s=polyval(p,t);  
% 
% s=polyval(p,t);  
% plot(t,s);
% legend('样本点','拟合图像')