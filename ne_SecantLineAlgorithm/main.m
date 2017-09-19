clear
format long
x0 = 1.5;
x1 = 1.0;
for n = 1:4
   x2 = x1-(f(x1)*(x1-x0))/(f(x1)-f(x0))
    if f(x0)*f(x2)<0
        x1 = x2;
    else
        x0 = x2;
    end
end