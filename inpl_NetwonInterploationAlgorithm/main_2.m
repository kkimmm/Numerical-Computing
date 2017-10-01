%---------Netwon插值法（函数图像形式）----------
clc;clear;
X = [0 pi/6 pi/4 pi/3 pi/2];  
Y = [0 0.5 0.7071 0.8660 1];  
x = linspace(0,pi,50);     %这是要计算的点，要计算的是该点差值后的值
n = length(X);
m = length(x);
for k = 1:m      
    A = zeros(n,n);
    A(:,1)=Y';  %均差表第一列的值
    for j = 2:n  %j表示列
        for i = j:n  %i表示行
            A(i,j) = (A(i,j-1)-A(i-1,j-1))/(X(i)-X(i-j+1));  %生成均差表
        end
    end    
end

for k = 1:m
    sum = 0;
    for p =1:n
        N = 1;
        for q = 1:p-1
            N = N*(x(k)-X(q));
        end
        sum = sum+A(p,p)*N;
    end
    y(k) = sum;
end
fprintf('牛顿插值后插值点对应的函数值：')
y
y1 = sin(x);
plot(X,Y,'or',x,y,'.r',x,y1,'b')
legend('样本点','牛顿插值函数图像','sin(x)')

