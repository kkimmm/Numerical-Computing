%----------R-K������4�ף�-----------
clc;clear;
x0 = 0;       %y(x0) = y0  ��������Ҫ�����΢�ַ��̳�ֵ���̣���x0��������������
y0 = 1;     
xn = 0.5;     %�����������
n = 5;
y(1) = y0 ;
h = (xn - x0)/n;
x = x0:h:xn;

%�Ľ�Runge-Kutta����ʽ
for i = 1:n
    k1 = feval(@(x,y)(y-2*x./y),x(i),y(i));
    k2 = feval(@(x,y)(y-2*x./y),x(i)+h/2,y(i)+h/2*k1);
    k3 = feval(@(x,y)(y-2*x./y),x(i)+h/2,y(i)+h/2*k2);
    k4 = feval(@(x,y)(y-2*x./y),x(i)+h,y(i)+h*k3);
    y(i+1) = y(i) +h/6*(k1+2*k2+2*k3+k4); 
end

fprintf('�Ľ�Runge-Kutta������Ľ�Ϊ��')
y
fs1 = sqrt(1+2*x);
plot(x,y,'o-b',x,fs1,'r');
legend('�Ľ�Runge-Kutta��������Ľ�','��ʵ��')  
%��Euler��������Euler�����������η��Ƚϣ����Է����Ľ�R-K������Ľ��Ҫ��ȷ�ö�