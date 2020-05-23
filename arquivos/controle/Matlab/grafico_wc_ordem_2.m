%
% Traçado do gráfico da frequência de corte para um sistema de 2a ordem
%

clear all
clc

wn = 2*pi*1 ; 

l = 0 ; 

for k = 0:0.001:1, 
    l = l + 1; 
    zeta(l) = k ;
    wc(l) = wn*sqrt((1-2*zeta(l)^2)+sqrt(4*zeta(l)^4-4*zeta(l)^2+2)) ;
end; 

figure(1)
plot(zeta,wc)


    