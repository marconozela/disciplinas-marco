clear all
close all

%Exemplo de cálculo de convolução utilizando a DFT. Neste programa, a DFT é
%redefinida para que o resultado da convolução saia simétrico. A
%redefinição ocorre na definição dos vetores n e k, que ao invés de ir de 1
%a N, vão de -N/2 a N/2. O caso assimétrico é ilustrado pelo programa
%CircularConvolution_2


%Nessa parte, os sinais x e y são definidos com uma janela grande, para não
%ocorrer sobreposição. Portanto o resultado da convolução circular (figura
%5)
%corresponde à convolução linear (que você pode e deve calcular na mão)
Np = 51;
Ni = -(Np-1)/2;
Nf = -Ni;
no = (Np+1)/2;
n = (Ni:1:Nf);
k = (Ni:1:Nf);
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
ylabel('sinal x')

%Loop para calcular a DFT de x e y
for u = 1:Np
    X(u) = sum(x.*exp(-i*2*pi*k(u)*n./Np));
    Y(u) = sum(y.*exp(-i*2*pi*k(u)*n./Np));
end

% Essa parte comentada é apenas para conferir se não comi nenhuma mosca

%for p = 1:Np
%    xi(p) = (1/Np)*sum(X.*exp(i*2*pi*k*n(p)./Np));
%    yi(p) = (1/Np)*sum(Y.*exp(i*2*pi*k*n(p)./Np));
%end

%figure(3)
%bar(real(xi))
%figure(4)
%bar(real(yi))

%Plota as DFTs de x e y
figure(3)
bar(k,abs(X))
xlabel('k')
ylabel('Espectro de x')
figure(4)
bar(k,abs((Y)))
xlabel('k')
ylabel('Espectro de y')

%Multiplica as DFTs de x e y
XY = X.*Y;

%Calucla a DFT inversa de XY. O resultado é a convolução circular entre x e
%y
for p = 1:Np
    xyi(p) = (1/Np)*sum(XY.*exp(i*2*pi*k*n(p)./Np));
end

figure(5)
bar(n,real(xyi))
xlabel('n')
ylabel('Resultado da convolução circular entre x e y')


 clear all

 %Nessa parte, os mesmos sinais x e y são definidos com uma janela pequena, para não
%ocorrer sobreposição. Neste caso, o resultado da convolução circular (figura
%50)
% NÃO corresponde à convolução linear (compare o sinal da figura 5 com a
% figura 50)
 
 
Np = 3;
Ni = -(Np-1)/2;
Nf = -Ni;
no = (Np+1)/2;
n = (Ni:1:Nf);
k = (Ni:1:Nf);
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
xlabel('n')
ylabel('sinal x')
figure(20)
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