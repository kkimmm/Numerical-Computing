%------------����Ԫ��ȥ��--------------
clc;
clear;
a = [-0.002 2 2; 1 0.78125 0; 3.996 5.5625 4 ]
b = [0.4,1.3816,7.4178]
B=[a b']; 
n=length(b);
X=zeros(n,1)
for k=1:n-1   %k��ʾ�Խ�����Ԫ��B(k,k)���ڵ��к���
   % find(abs(B(p:end,p))==max(abs(B(p:end,p))));  %���Կ��������������
    t=find(abs(B(k:end,k))==max(abs(B(k:end,k))))+k-1  %t��ʾ����Ҫ���Ҫ��Ԫ���ڵ���
    if t>k  %�����ǻ��в���
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
end    %�ѷ�����ϵ������A��Ϊͬ��������Ǿ���

b=B(1:n,n+1);
A=B(1:n,1:n); 
X(n)=b(n)/A(n,n);
for q=n-1:-1:1
    X(q)=(b(q)-sum(A(q,q+1:n)*X(q+1:n)))/A(q,q);
end   %��xn��x1�����������Ƿ�����

disp('������Ľ�Ϊ��');X