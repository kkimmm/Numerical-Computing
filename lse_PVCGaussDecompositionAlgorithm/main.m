%------------列主元消去法--------------
clc;
clear;
a = [-0.002 2 2; 1 0.78125 0; 3.996 5.5625 4 ]
b = [0.4,1.3816,7.4178]
B=[a b']; 
n=length(b);
X=zeros(n,1)
for k=1:n-1   %k表示对角线上元素B(k,k)所在的行和列
   % find(abs(B(p:end,p))==max(abs(B(p:end,p))));  %可以看看这个语句的作用
    t=find(abs(B(k:end,k))==max(abs(B(k:end,k))))+k-1  %t表示满足要求的要主元所在的行
    if t>k  %下面是换行操作
        temp=B(t,:);
        B(t,:)=B(k,:);
        B(k,:)=temp;
    end 
    for i=k+1:n     
        Aki= B(i,k)/ B(k,k);
        for j =k:n+1
            B(i,j) = B(i,j) -Aki * B(k,j) 
        end
    end    
end    %把方程组系数矩阵A化为同解的上三角矩阵

b=B(1:n,n+1);
A=B(1:n,1:n); 
X(n)=b(n)/A(n,n);
for q=n-1:-1:1
    X(q)=(b(q)-sum(A(q,q+1:n)*X(q+1:n)))/A(q,q);
end   %从xn至x1逐个求解上三角方程组

disp('方程组的解为：');X