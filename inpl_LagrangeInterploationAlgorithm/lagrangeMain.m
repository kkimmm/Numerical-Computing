clc;clear
X = [0 pi/6 pi/4 pi/3 pi/2];
Y = [0 0.5 0.7071 0.8660 1];
x = linspace(0,pi,500);  %x=linspace(x0, xn, m),表示在x0和xn之间等间隔取m个数
M = 1;
[y, R] = lagrange(X, Y, x, M)
y1 = sin(x);
errorbar(x,y,R,'.g') %errorbar(X,Y,E)绘出Y相对于X的曲线，并带有2E(i)长度的error bar;X,Y,E必须有相同的
%长度。当它们是矢量时，每个error bar都由点(X(i),Y(i))之上及之下距离分别都为E(i)的bar构成。
%注：Error bars显示沿着曲线数据的置信区间或偏差
hold on
plot(X, Y, 'or', x, y, '.k', x, y1, '-b');
axis([0 pi -1 1.2]);   %axis([xmin xmax ymin ymax]),设置坐标轴在指定的区间
legend('误差','样本点','拉格朗日插值估算','sin(x)');