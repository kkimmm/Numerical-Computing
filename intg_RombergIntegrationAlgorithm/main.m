%--------------Rombage积分-------------
clc;clear;
format long  %显示更高的计算精度
n =7;   %对梯形公式的加速次数，每加速一次节点加密一次，划分的区间相应的逐次减半
T = zeros(n,n);
error = 0.00005   %误差要求
x0 = 0;  %积分上限
x1 = 1;  %积分下限
h = x1-x0;  
syms x;
f(x) = 4/(1+x.^2);  %被积函数
f0 = f(x0);
f1 = f(x1);
T(1,1) = 1/2*(f0+f1);  %梯形积分公式(在区间[x0,x1]上)

for i =2:n  %计算急速n次后(即二等分n次后的)梯形公式积分T(n,1)
    fs = 0;
    for k = 1:2:2.^(i-1)
        x2 = k/2.^(i-1);        
%         vpa(f(x2),10);  %测试时的观察语句
        fs = fs+f(x2);
    end
    T(i,1) = T(i-1,1)*h/2 + h/2.^(i-1)*fs;  
    
end

for m =2:n
   for k =m:n       
       T(k,m) =( (4.^(m-1))*T(k,m-1)-T(k-1,m-1))/(4.^(m-1)-1);  %Romberg求积公式
   end
   
   t0 = T(m,m);
   t1 = T(m-1,m-1);
   if abs(t0-t1)<error   %达到误差要求后停止计算T表
       break;
   end  
end
fprintf('Romberg求积(考虑了误差为error)后的T表为：')
T
fprintf('考虑误差为error的情况下，Romberg求积后的结果为：')
t1

