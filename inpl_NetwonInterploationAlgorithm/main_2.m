%---------Netwon��ֵ��������ͼ����ʽ��----------
clc;clear;
X = [0 pi/6 pi/4 pi/3 pi/2];  
Y = [0 0.5 0.7071 0.8660 1];  
x = linspace(0,pi,50);     %����Ҫ����ĵ㣬Ҫ������Ǹõ��ֵ���ֵ
n = length(X);
m = length(x);
for k = 1:m      
    A = zeros(n,n);
    A(:,1)=Y';  %������һ�е�ֵ
    for j = 2:n  %j��ʾ��
        for i = j:n  %i��ʾ��
            A(i,j) = (A(i,j-1)-A(i-1,j-1))/(X(i)-X(i-j+1));  %���ɾ����
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
fprintf('ţ�ٲ�ֵ���ֵ���Ӧ�ĺ���ֵ��')
y
y1 = sin(x);
plot(X,Y,'or',x,y,'.r',x,y1,'b')
legend('������','ţ�ٲ�ֵ����ͼ��','sin(x)')

