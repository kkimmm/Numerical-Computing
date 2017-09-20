%--------Jacobi迭代法-------
clear;
clc;
A=[8 -3 2;4 11 -1;6 3 12]
b=[20 33 36]';
n = length(b);
x = zeros(n,1);
D = diag(diag(A));
L = -tril(A,-1)  %tril()提取下三角,
U = -triu(A,1)  %triu(A)提取上三角，即把主对角线下面所有数变零
B = inv(D)*(L+U)
f = inv(D)*b
for i = 1:100
    temp = B*x+f;
    if norm(x - temp)<0.0001  %如果A为向量，norm(A,p)返回向量A的p范数；而norm(A)返回向量A的2范数，即等价于norm(A,2)
        break;
    end
    fprintf('迭代了%d次后：',i)
    x = temp
end
