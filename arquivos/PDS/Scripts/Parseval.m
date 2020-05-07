clear all
close all

Np = 31;
Ni = -(Np-1)/2;
Nf = -Ni;
no = (Np+1)/2;
n = (1:1:Np);
k = (1:1:Np);
x = n*0;
y = x;

x(no) = 1;

nt = 10
for u = 1:nt
x(no-nt/2+u) = u;
end



figure(1)
bar(n,x)
%figure(2)
%bar(n,y)

for u = 1:Np
    X(u) = sum(x.*exp(-i*2*pi*k(u)*n./Np));
end

figure(2)
bar(n,abs(X))

Sx = sum(abs(x).^2)
Sf = sum(abs(X).^2)/Np

Error = 100*abs(Sf-Sx)/Sx