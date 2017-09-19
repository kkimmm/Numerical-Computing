a = 1;
b = 1.5;

for n = 1:10
    temp = (a+b)/2;
    if f1(a)*f1(temp)<0
        b = temp;
    else
        a = temp;
    end
end
disp('the root is:'),disp(temp)
