function [y, R] = lagrange(X, Y, x, M)
n = length(X);
m = length(x);
for k = 1:m
    z = x(k);
    sum = 0.0;
    for i = 1:n
        li = 1.0; 
        q1 = 1.0; 
        c1 = 1.0;
        for j = 1:n
            if j~=i
                li = li * (z - X(j)) / (X(i) - X(j));
            end
            q1 = abs(q1 * (z - X(j)));
            c1 = c1 * j;
        end
        sum = li * Y(i) + sum;
    end
    y(k) = sum;
    R(k) = M * q1 / c1;
end
%拉格朗日插值及其误差估计
%x是以向量形式输入的m个插值点
%输出的量：y为m个插值构成的向量，R是误差限