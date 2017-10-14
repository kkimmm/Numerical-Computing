%----------����Euler��-----------
clc;clear;
x0 = 0;       %y(x0) = y0  ��������Ҫ�����΢�ַ��̳�ֵ���̣���x0��������������
y0 = 1;     
xn = 0.5;    %�����������
n = 5;
y(1) = y0 ;
h = (xn - x0)/n;
x = x0:h:xn;
for i = 1:n
    y(i+1) = y(i)+h*feval(@(x,y)(y-2*x./y),x(i),y(i));  %feval�������㺯����ָ����ĺ���ֵ
    y(i+1) = y(i)+h*feval(@(x,y)(y-2*x./y),x(i+1),y(i+1));
end
fprintf('����Eluer������Ľ�Ϊ��')
y
fs1 = sqrt(1+2*x);
plot(x,y,'o-b',x,fs1,'r');
legend('����Eluer��������Ľ�','��ʵ��')  %���Ժ�Euler�����ͼ��Ա�һ��
