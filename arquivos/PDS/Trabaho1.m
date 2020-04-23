clear all
close all

% Parte 1
%Definição de parâmetros da Gaussiana
A = 3;
sigma = 10;

%Definição do tamanho do vetor computacional
%Pegamos um valor alto de N para que o vetor tempo (definido abaixo)
%tenha "cara" de contínuo
N = 1.2*10^4;

%Definição do vetor tempo----------------------------------------------------
tpasso = sigma/100; %passo temporal (100x menor que largura temporal, para que o vetor tenha cara de contínuo)
ti = -tpasso*(N-1)/2; %início da janela temporal
tf = -ti; %fim da janela temporal

t = (ti:tpasso:tf); %Definição do vetor tempo em função dos parâmetros acima
%----------------------------------------------------------------------------

%Definição da função gaussiana. 
x = A*exp(-(t./sigma).^2);

%Plot da função gaussiana
figure(1)
plot(t,x,'k','LineWidth',2) %O comando 'k' define a cor preta
xlabel('tempo (segundos)')
ylabel('x(t)')
title('Função Gaussiana definida analiticamente')


%Definição do vetor de frequencia em Hertz
fpasso = 1/(50*sigma);
fi = -fpasso*(N-1)/2;
ff = -fi;
f = (fi:fpasso:ff);

X = A*sigma*sqrt(pi)*exp(-(sigma*pi*f).^2); %Definição da TF de x (analitica)
%A função X é a nossa "cola"
figure(2)
plot(f,X,'k','LineWidth',2)
xlabel('frequencia (Hz)')
ylabel('X(f)')
title('TF ANALITICA de x(t)')
%===========================================================================
%Parte 2

%Definição do vetor de frequencias admensional (v é na verdade continuo,
%então precisamos novamente de um vetor com amostragem fina para ter "cara"
%de contínuo

vi = -1.2;
vf = -vi;
vpasso = (vf-vi)/(N-1);
v = (vi:vpasso:vf);


XDTFT = v*0; %Inicialização do vetor para armazenar a DTFT (como a DTFT é uma função de v, o vetor DTFT
% tem que ter o mesmo tamanho do vetor v

%Definição do vetor n. O vetor n armazena os números inteiros da função
%x[n]. Note que eu peguei um vetor simétrico, com 0 no centro
n = (-length(x)/2+1:1:length(x)/2);


%Rotina para calcular a DTFT. Note que, para cada valor fixo de v, eu faço
%uma soma em n
for u = 1:length(v)
for m = 1:length(n)
    XDTFT(u) = XDTFT(u) + x(m)*exp(i*2*pi*v(u)*n(m));
end
    
    % XDTFT(u) = sum(x.*exp(i*2*pi*v(u)*n)); Este comando sozinho poderia
    % substituir todo o loop em m. Entenda o por que.
end

fs = 1/tpasso;

figure(3)
plot(v,abs(XDTFT),'r','LineWidth',2)
xlabel('frequencia v')
ylabel('DTFT')
title('DTFT')

figure(4)
plot(v*fs,abs(XDTFT),'r','LineWidth',2)
xlabel('frequencia v*fs')
ylabel('DTFT/fs')
title('Xd(f)')


figure(5)
plot(v*fs,abs(XDTFT./fs),'r',f,X,'b.')
xlabel('frequencia v*fs')
ylabel('DTFT/fs')
legend('TF OBTIDA DA DTDFT', 'TF Analitica')
axis([-fs/2 fs/2 0 60])

%Parte 3

X_Riemann = f*0;

%Calcula a soma de Riemann
for u = 1:length(f)
    X_Riemann(u) = sum(x.*exp(i*2*pi*f(u)*t))*tpasso;
end
figure(6)
plot(f,abs(X_Riemann),'r',f,X,'b.')
xlabel('frequencia')
ylabel('X(f) - Soma de Riemann')
legend('Soma de Riemann','TF analitica')



%PARTE 4 ===============================================================

yd = x*0; %inicialização do vetor yd


%Calculo do vetor yd
yd(1) = x(2) - x(1);
for u = 2:length(x)
    yd(u) = x(u) - x(u-1);
    
end

%Calculo da DTFT de yd
yd_DTFT = v*0;
n = (-length(yd)/2+1:1:length(yd)/2);
for u = 1:length(v)
    yd_DTFT(u) = sum(yd.*exp(i*2*pi*v(u)*n));
end

yd_DTFT_Pr = XDTFT.*(1-exp(i*2*pi*v)); %Vetor contendo a DTFT de yd obtida diretamente da DTFT de x(t), utilizando 
%a propriedade de diferenças

figure(7)
plot(v,abs(yd_DTFT),'k',v,abs(yd_DTFT_Pr),'b.')
xlabel('frequencia adimensional')
ylabel('DTFT')
legend('DTFT calculada diretamente','DTFT calculada pela propriedade')


ya = -(2/(sigma^2))*t.*x;  %ya contem amostras de dx/dt

figure(8)
plot(n,ya,'r',n,yd,'g.')
xlabel('n')
legend('ya','yd')



Yd_An = i*2.*pi.*f.*A.*sigma.*sqrt(pi).*exp(-(sigma*pi*f).^2); % TF analitica de dx/dt obtida pela propriedade da derivada
figure(9)
plot(f,abs(Yd_An),'b.',v*fs,abs(yd_DTFT),'k')
xlabel('frequencia em Hertz')
legend('Analitica','DTFT')
axis([-fs/2 fs/2 0 5])