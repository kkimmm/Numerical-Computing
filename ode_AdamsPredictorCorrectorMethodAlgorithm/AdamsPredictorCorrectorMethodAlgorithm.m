%-----------------(4��)AdamsԤ��-У������(PECE)-----------
clc;clear;
x0 = 0;       %y(x0) = y0  ��������Ҫ�����΢�ַ��̳�ֵ���̣���x0��������������
y0 = 1;     
xn = 1;     %�����������
n = 10;
y(1) = y0;
h = (xn-x0)/n;
x = x0:h:xn;

%k��(��)Adams������ǰk����ֵ��Ҫ�����������㣬��������ʹ���Ľ�Runge-Kutta������
for i = 1:3
    k1 = feval(@(x,y)(y-2*x./y),x(i),y(i));
    k2 = feval(@(x,y)(y-2*x./y),x(i)+h/2,y(i)+h/2*k1);
    k3 = feval(@(x,y)(y-2*x./y),x(i)+h/2,y(i)+h/2*k2);
    k4 = feval(@(x,y)(y-2*x./y),x(i)+h,y(i)+h*k3);
    y(i+1) = y(i) +h/6*(k1+2*k2+2*k3+k4); 
end

%(4��)AdamsԤ��-У��������ʽ
for i = 4:n
    %Ԥ��(P)
    s1 = feval(@(x,y)(y-2*x./y),x(i-3),y(i-3));
    s2 = feval(@(x,y)(y-2*x./y),x(i-2),y(i-2));
    s3 = feval(@(x,y)(y-2*x./y),x(i-1),y(i-1));
    s4 = feval(@(x,y)(y-2*x./y),x(i),y(i));
    %��ֵ(E)
    y(i+1) = y(i) + h/24*(55*s4-59*s3+37*s2-9*s1);
    %У��(C)
    s5 = feval(@(x,y)(y-2*x./y),x(i+1),y(i+1));
    %��ֵ(E)
    y(i+1) = y(i) + h/24*(9*s5+19*s4-5*s3+s2);
end
fprintf('AdamsԤ��-У����������Ľ�Ϊ��')
y
fs1 = sqrt(1+2*x);
plot(x,y,'o-b',x,fs1,'r');
legend('AdamsԤ��-У������������Ľ�','��ʵ��')  