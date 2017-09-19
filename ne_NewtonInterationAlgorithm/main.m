clear
format long
x0 = 1.0;
for n =1:3
    f0 = f(x0);
    syms x; %声明符号变量x,只有声明了符号变量才可以进行符号运算，包括求导
    f1 = eval(subs(diff(f(x)),x,x0));%f1表示f(x)的导数在相应点x0处的取值
    %eval(A)是为了将A的值转变成数值型
    %subs(s,old,new)表示将表达式s中的符号变量old替换成新的值new    
    temp = x0-f0/f1;
    x0 = temp;
end
disp('the root is:'),disp(x0)
