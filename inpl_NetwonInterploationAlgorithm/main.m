%---------Netwon��ֵ������ֵ������ʽ��----------
clc;clear;
X = [0.4 0.55 0.65 0.80 0.90 1.05];
Y = [0.41075 0.57815 0.69675 0.88811 1.0265 1.25382]; 
x = 0.596;   %����Ҫ����ĵ㣬Ҫ������Ǹõ��ֵ���ֵ
n = length(X);
m = length(x);
A = zeros(n,n);
A(:,1)=Y';  %������һ�е�ֵ
for j = 2:n  %j��ʾ��
    for i = j:n  %i��ʾ��
        A(i,j) = (A(i,j-1)-A(i-1,j-1))/(X(i)-X(i-j+1));  %���ɾ����
    end
end    

sum = 0;
for p =1:n
    N = 1;
    for q = 1:p-1
        N = N*(x-X(q));
    end
    sum = sum+A(p,p)*N;
end

fprintf('ţ�ٲ�ֵ���ֵΪ:\n')
sum

