%--------Gauss-Seidel������-------
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
    if norm(temp - x)<0.0001    %������ͬ������ޣ����ԶԱȷ���GS������J������һ������
        break;
    end
    fprintf('����%d�κ�',i)
    x = temp
end