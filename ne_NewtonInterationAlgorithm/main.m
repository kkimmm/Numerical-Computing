clear
format long
x0 = 1.0;
for n =1:3
    f0 = f(x0);
    syms x; %�������ű���x,ֻ�������˷��ű����ſ��Խ��з������㣬������
    f1 = eval(subs(diff(f(x)),x,x0));%f1��ʾf(x)�ĵ�������Ӧ��x0����ȡֵ
    %eval(A)��Ϊ�˽�A��ֵת�����ֵ��
    %subs(s,old,new)��ʾ�����ʽs�еķ��ű���old�滻���µ�ֵnew    
    temp = x0-f0/f1;
    x0 = temp;
end
disp('the root is:'),disp(x0)
