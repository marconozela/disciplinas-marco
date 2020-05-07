clear all
close all

Np = 21;
Ni = -(Np-1)/2;
Nf = -Ni;
no = (Np+1)/2;
n = (Ni:1:Nf);
k = (Ni:1:Nf);
x = n*0;
y = x;

x(no) = 1;

nt = 6
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

m1 = 5;
m2 = 10;
m3 = 15;

Y1 = X.*exp(-i*2*pi*k*m1./Np);
Y2 = X.*exp(-i*2*pi*k*m2./Np);
Y3 = X.*exp(-i*2*pi*k*m3./Np);

for p = 1:Np
    xi(p) = (1/Np)*sum(X.*exp(i*2*pi*k*n(p)./Np));
    yi1(p) = (1/Np)*sum(Y1.*exp(i*2*pi*k*n(p)./Np));
    yi2(p) = (1/Np)*sum(Y2.*exp(i*2*pi*k*n(p)./Np));
    yi3(p) = (1/Np)*sum(Y3.*exp(i*2*pi*k*n(p)./Np));
end
 figure(2)
 bar(k,abs(X))
figure(3)
bar(n,real(xi))
figure(4)
bar(n,real(yi1))
figure(5)
bar(n,real(yi2))
figure(6)
bar(n,real(yi3))
 