clc;
clear;
A=[3 -5 6 4 -2 -3 8;   
    1 1 -9 15 1 -9 2;
    2 -1 7 5 -1 6 11;  
    -1 1 3 2 7 -1 -2;
    4 3 1 -7 2 1 1;   
    2 9 -8 11 -1 -4 -1;
    7 2 -1 2 7 -1 9];
b=[11 2 29 9 5 8 25]';  %n维向量
%--------高斯消去法解线性方程组----------
n = length(b);
x = zeros(n,1);
for k = 1:n-1  %k表示选取对角线的元素A(k,k)
    for i = k+1:n  %i表示行
        Aik = A(i,k)/A(k,k);  %Aik表示“公共消去因子”
        for j = k:n  %j表示列
            A(i,j) = A(i,j) - Aik*A(k,j); %表示将第i行第一个消为零，且其他数据按照Aik消去      
        end
        b(i) = b(i) - Aik*b(k);  
        A;  %可以看看A是怎么变化的
    end
end
%--下面开始迭代--
x(n) = b(n)/A(n,n);  %这是化成上三角矩阵的最底下那个等式
for k = n-1:-1:1
    s = b(k);
    for j = k+1:n
        s = s - A(k,j)*x(j);
    end
    x(k) = s/A(k,k);
end
%--输出--
disp('solve of the martix x(i)[i=1:7] is:')
for i = 1:n
   disp( x(i))
end

%----------现在可以看看用MATLAB自带的方法解方程组-----------
x = inv(A)*b   %inv()表示求矩阵的逆


 
