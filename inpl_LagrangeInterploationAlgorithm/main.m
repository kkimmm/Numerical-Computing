%--------Lagrange��ֵ����ֵ������ʽ��--------
format long
clc;clear;
X=[0.32,0.34,0.36 1 ];
Y=[0.314567,0.333487,0.352274 0.841470984807897];
x=0.5;   %Ҫ��ò�ֵ��(��㼯)�ĺ���ֵ
n = length(X);
m = length(x);
for k=1:m   %��x��ÿ���㶼Ҫ�����ֵ����ֵ
    sum = 0;
    for i=1:n
        li = 1.0;   %li��ʾli(x)������ֵ������
        for j=1:n
            if j~=i
                li=li*(x(k)-X(j))/(X(i)-X(j));   %���ֵ����������ֵ��
            end
        end
        sum = sum+li*Y(i);  %sum��ʾ�������ղ�ֵ����ʽ����ֵ��
    end
    y(k)=sum;
end
fprintf('�����������ղ�ֵ��,��(��㼯)x�ĺ���ֵΪ')
y(k)
fprintf('���Ϊ')
Rx=sum-sin(0.3367)
