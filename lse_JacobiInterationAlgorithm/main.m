%--------Jacobi������-------
clear;
clc;
A=[8 -3 2;4 11 -1;6 3 12]
b=[20 33 36]';
n = length(b);
x = zeros(n,1);
D = diag(diag(A));
L = -tril(A,-1)  %tril()��ȡ������,
U = -triu(A,1)  %triu(A)��ȡ�����ǣ��������Խ�����������������
B = inv(D)*(L+U)
f = inv(D)*b
for i = 1:100
    temp = B*x+f;
    if norm(x - temp)<0.0001  %���AΪ������norm(A,p)��������A��p��������norm(A)��������A��2���������ȼ���norm(A,2)
        break;
    end
    fprintf('������%d�κ�',i)
    x = temp
end
