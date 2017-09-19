format long
a =1.5;
for n = 1:8    
    temp = f(a);
    a = temp;
end
disp('the root is:'),disp(temp)

%下面是为了直观理解的画图
x = 1.0:0.1:1.5;
y1 = f(x);
y2 = x;
plot(x,y1,x,y2)
legend('y1=(x+1).^(1/3)','y2 = x')