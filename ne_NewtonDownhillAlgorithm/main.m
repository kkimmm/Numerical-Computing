%这是用来测试牛顿下山法的
clear 
x0 = 0.6;
lambda = 1/32;%牛顿下山法的下山因子，需要手动输入{1,(1/2),(1/4)，...}
for n = 1:4
    
    f0 = f(x0); 
    fx0 = f(x0)
    syms x;
    f1 =eval(subs(diff(f(x)),x,x0));
    temp = x0-(f0/f1)*(lambda);
    x0 = temp
    fx1 = f(x0)
    
%     if fx0<fx1        
%         break;
%     end
    
end