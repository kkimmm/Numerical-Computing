%--------Gauss-Seidel迭代法-------
clear;
clc;
A=[8 -3 2;4 11 -1;6 3 12]
b=[20 33 36]';
n = length(b);
x = zeros(n,1);
D = diag(diag(A))
L = -tril(A,-1)
U = -triu(A,1)
G = inv(D-L)*U
f = inv(D-L)*b
for i = 1:100
    temp = G*x+f
    if norm(temp - x)<0.0001    %给定相同的误差限，可以对比发现GS迭代比J迭代快一倍左右
        break;
    end
    fprintf('迭代%d次后：',i)
    x = temp
end