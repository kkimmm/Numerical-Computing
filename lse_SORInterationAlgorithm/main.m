%-------SOR迭代解线性方程组-----------
clc;clear;
A = [4 3 0;3 4 -1;0 -1 4]
b = [24 30 -24]'
n = length(b)
x = [1,1,1]'
w = 1.25;  %w是松弛因子，当w=1时可以发现达到相同的精度要求，迭代次数需要16次；但w也不是越大越好 
D = diag(diag(A))
L = -tril(A,-1)
U = -triu(A,1)
Gw = inv(D - w*L)*((1-w)*D+w*U)
f = w*inv(D-w*L)*b
for i = 1:100
    temp = Gw * x + f
    if norm(temp - x)<0.0001
        break;
    end
    fprintf('迭代%d次之后：',i)
    x = temp;
end
