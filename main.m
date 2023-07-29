%y(n)-0.25y(n-1)-0.125y(n-2)=x(n)+0.5x(n-1)
%x(n)=u(n)-u(n-2)
%y(-1)=1 , y(-2)=2
clc; 
clear all; 
close all; 
a=input('Enter the coefficients of x:'); 
b=input('Enter the coefficients of y:'); 
M=length(a)-1;
N=length(b)-1;
IC=input('Enter the initial conditions for y:');
n=[-N:20]; %Number of terms
x=[(n>=0)]-[(n>=2)]; %x(n)=u(n)-u(n-2)
x=double([n==0]); %To find the impulse response
subplot(211);
stem(n,x);
title('input sequence x[n]');
xlabel('n');
ylabel('x[n]');
y=[IC zeros(1,length(n)-N)];
for n=N+1:20
sumx=0;sumy=0;
for k=0:M
sumx=sumx+(a(k+1)*x(n-k));
end
for k=1:N
sumy=sumy+(b(k+1)*y(n-k));
end
y(n)=sumx-sumy;
end
n=[-N:20];
subplot(212);
stem(n,y);
title('Output sequence y[n]');
xlabel('n');
ylabel('y[n]');
disp('y[n]=');
disp(y)
