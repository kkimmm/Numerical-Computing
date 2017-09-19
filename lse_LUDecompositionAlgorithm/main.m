%--------------------LU分解---------------------
clc;
clear;
A = [1 2 3; 4 5 6; 7 8 10];
n=3;
%-----当然也可以使用函数表达规范计算----
%function LU(A,n)
m = zeros(n,n);
for i = 1:n
    m(i,i) = 1;
end

for k = 1:n-1
    for i = k+1:n
        Aki = A(i,k)/A(k,k);
        m(i,k) = Aki;
        for j = k:n
            A(i,j) = A(i,j) - Aki*A(k,j);
        end
        A;
    end
end

disp('L = ');disp(m)
disp('U = ');disp(A)
m*A; %看看是否L*U=A，即能否还原A

%-----------下面看看MATLAB自带的LU分解法
[L1,U1]=lu(A) %其中U1是规则的上三角矩阵，而得到的L1很多时候不是规则的下三角矩阵，A=L1*U1
A1 = L1*U1
[L2,U2,P]=lu(A) %U是规则的上三角矩阵，L2是规则的下三角矩阵，但是L2*U不一定等于A，而是 L2*U2=P*A
%实际上P*A相当于给A中的矩阵一些行列互换的操作,也就是常说的列主元消去法


