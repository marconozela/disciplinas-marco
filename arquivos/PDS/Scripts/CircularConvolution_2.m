clear all
close all

%Mesma coisa que o programa CircularConvolution, só que agora a DFT é
%definida de maneira convencional (com n e k começando em 1 e terminando em
%Np). Compare os resultados com o do programa CircularConvolution

Np = 51;
Ni = -(Np-1)/2;
Nf = -Ni;
no = (Np+1)/2;
n = (1:1:Np);
k = (1:1:Np);
x = n*0;
y = x;
x(no-1) = 1;
x(no) = 2;
x(no+1) = 3;

y(no - 1) = -1;
y(no) = 1;
y(no + 1) = 1;


figure(1)
bar(n,x)
xlabel('n')
ylabel('sinal x')
figure(2)
bar(n,y)
xlabel('n')
ylabel('sinal y')
for u = 1:Np
    X(u) = sum(x.*exp(-i*2*pi*k(u)*n./Np));
    Y(u) = sum(y.*exp(-i*2*pi*k(u)*n./Np));
end

% for p = 1:Np
%     xi(p) = (1/Np)*sum(X.*exp(i*2*pi*k*n(p)./Np));
%     yi(p) = (1/Np)*sum(Y.*exp(i*2*pi*k*n(p)./Np));
% end

%figure(3)
%bar(real(xi))
%figure(4)
%bar(real(yi))
figure(3)
bar(k,abs(X))
xlabel('k')
ylabel('Espectro de x')
figure(4)
bar(k,abs((Y)))
xlabel('k')
ylabel('Espectro de y')
XY = X.*Y;

for p = 1:Np
    xyi(p) = (1/Np)*sum(XY.*exp(i*2*pi*k*n(p)./Np));
end

figure(5)
bar(n,real(xyi))
xlabel('n')
ylabel('Resultado da convolução circular entre x e y')
 clear all

Np = 3;
Ni = -(Np-1)/2;
Nf = -Ni;
no = (Np+1)/2;
n = (1:1:Np);
k = (1:1:Np);
x = n*0;
y = x;
x(no-1) = 1;
x(no) = 2;
x(no+1) = 3;

y(no - 1) = -1;
y(no) = 1;
y(no + 1) = 1;


figure(10)
bar(n,x)
figure(20)
bar(n,y)

for u = 1:Np
    X(u) = sum(x.*exp(-i*2*pi*k(u)*n./Np));
    Y(u) = sum(y.*exp(-i*2*pi*k(u)*n./Np));
end

% for p = 1:Np
%     xi(p) = (1/Np)*sum(X.*exp(i*2*pi*k*n(p)./Np));
%     yi(p) = (1/Np)*sum(Y.*exp(i*2*pi*k*n(p)./Np));
% end

%figure(3)
%bar(real(xi))
%figure(4)
%bar(real(yi))
figure(30)
bar(k,abs(X))
xlabel('k')
ylabel('Espectro de x')
figure(40)
bar(k,abs((Y)))
xlabel('k')
ylabel('Espectro de y')
XY = X.*Y;

for p = 1:Np
    xyi(p) = (1/Np)*sum(XY.*exp(i*2*pi*k*n(p)./Np));
end

figure(50)
bar(n,real(xyi))
xlabel('n')
ylabel('Resultado da convolução circular entre x e y')