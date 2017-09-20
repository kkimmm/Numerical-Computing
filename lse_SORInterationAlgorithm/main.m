clc;clear;
A = [4 3 0;3 4 -1;0 -1 4]
b = [24 30 -24]'
n = length(b)
x = [1,1,1]'
w = 1.25;  %w���ɳ����ӣ���w=1ʱ���Է��ִﵽ��ͬ�ľ���Ҫ�󣬵���������Ҫ16�Σ���wҲ����Խ��Խ�� 
D = diag(diag(A))
L = -tril(A,-1)
U = -triu(A,1)
Gw = inv(D - w*L)*((1-w)*D+w*U)
f = w*inv(D-w*L)*b
for i = 1:100
    temp = Gw * x + f
    if norm(temp - x)<0.0001
        break;
    end
    fprintf('����%d��֮��',i)
    x = temp;
end