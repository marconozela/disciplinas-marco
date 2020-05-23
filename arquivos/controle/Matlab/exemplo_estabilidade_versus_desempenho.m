%
% Exemplo de utiliza��o do diagrama de lugar de ra�zes
%

clear all; 
clc ;

nump = 16 ; 
denp = [ 1 4 16 ] ; 

planta = tf(nump,denp) 

% Apresenta os polos somente da planta de segunda ordem 

figure(1)
pzmap(planta)

% Apresenta a resposta ao degrau unitario da planta de segunda ordem
% Confira se os �ndices de desempenho calculados pelas f�rmulas dadas 
% em aula s�o confirmados na simula��o apresentada. 

figure(2)
step(planta)


numt = 1 ; 
dent = [ 1 1 ] ; 

transdutor = tf(numt,dent) 

ftpt = series(planta,transdutor)

% Apresenta os polos da conex�o (de terceira ordem) formada pela 
% planta de segunda ordem em s�rie com o transdutor de primeira 
% ordem

figure(3)
pzmap(ftpt)

numc = [ 1 ] ; 
denc = [ 1 1 ] ; 

controlador = tf(numc,denc) 

ftma = series(controlador,ftpt) 

% Apresenta o diagrama de lugar de ra�zes da conex�o s�rie (de quarta 
% ordem) formada pela planta de segunda ordem, o transdutor de primeira 
% ordem e o controlador de primeira ordem. Procure no lugar de ra�zes o 
% m�ximo ganho do controlador que ainda n�o provoca instabiliza��o do 
% sistema em malha fechada.

figure(4)
rlocus(ftma)


ftmf = feedback(ftma,1)

% Apresenta a resposta ao degrau unit�rio, aplicado na refer�ncia 
% do sistema, da conex�o composta pelo sistema de quarta ordem 
% montado anteriormente, com uma realimenta��o unit�ria, num 
% esquema de rastreamento de refer�ncia. Note que, como o ganho de 
% todos os blocos � igual a 1, o erro de regime � de 50%. 

figure(5)
step(ftmf,15)


ftmf2 = feedback(6*ftma,1)

% Apresenta a resposta ao degrau unit�rio, aplicado na refer�ncia 
% do sistema, da conex�o composta pelo sistema de quarta ordem 
% montado anteriormente, com uma realimenta��o unit�ria, num 
% esquema de rastreamento de refer�ncia. Note que o ganho do 
% controlador agora foi passado para 6, o que resultou numa 
% resposta excessivamente oscilat�ria. 

figure(6)
step(ftmf2,15)


ftmf3 = feedback(4.6*ftma,1)

% Apresenta a resposta ao degrau unit�rio, aplicado na refer�ncia 
% do sistema, da conex�o composta pelo sistema de quarta ordem 
% montado anteriormente, com uma realimenta��o unit�ria, num 
% esquema de rastreamento de refer�ncia. Note que o ganho do 
% controlador agora foi passado para 4.6, o que resultou num 
% compromisso satisfat�rio (dentro dos limites de desempenho do 
% sistema em quest�o) entre erro de regime permanente e estabilidade 
% do sistema em malha fechada. 

figure(7)
step(ftmf3,15)