clc;clear
X = [0 pi/6 pi/4 pi/3 pi/2];
Y = [0 0.5 0.7071 0.8660 1];
x = linspace(0,pi,500);  %x=linspace(x0, xn, m),��ʾ��x0��xn֮��ȼ��ȡm����
M = 1;
[y, R] = lagrange(X, Y, x, M)
y1 = sin(x);
errorbar(x,y,R,'.g') %errorbar(X,Y,E)���Y�����X�����ߣ�������2E(i)���ȵ�error bar;X,Y,E��������ͬ��
%���ȡ���������ʸ��ʱ��ÿ��error bar���ɵ�(X(i),Y(i))֮�ϼ�֮�¾���ֱ�ΪE(i)��bar���ɡ�
%ע��Error bars��ʾ�����������ݵ����������ƫ��
hold on
plot(X, Y, 'or', x, y, '.k', x, y1, '-b');
axis([0 pi -1 1.2]);   %axis([xmin xmax ymin ymax]),������������ָ��������
legend('���','������','�������ղ�ֵ����','sin(x)');