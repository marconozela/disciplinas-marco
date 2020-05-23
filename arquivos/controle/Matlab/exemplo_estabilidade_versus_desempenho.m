%
% Exemplo de utilização do diagrama de lugar de raízes
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
% Confira se os índices de desempenho calculados pelas fórmulas dadas 
% em aula são confirmados na simulação apresentada. 

figure(2)
step(planta)


numt = 1 ; 
dent = [ 1 1 ] ; 

transdutor = tf(numt,dent) 

ftpt = series(planta,transdutor)

% Apresenta os polos da conexão (de terceira ordem) formada pela 
% planta de segunda ordem em série com o transdutor de primeira 
% ordem

figure(3)
pzmap(ftpt)

numc = [ 1 ] ; 
denc = [ 1 1 ] ; 

controlador = tf(numc,denc) 

ftma = series(controlador,ftpt) 

% Apresenta o diagrama de lugar de raízes da conexão série (de quarta 
% ordem) formada pela planta de segunda ordem, o transdutor de primeira 
% ordem e o controlador de primeira ordem. Procure no lugar de raízes o 
% máximo ganho do controlador que ainda não provoca instabilização do 
% sistema em malha fechada.

figure(4)
rlocus(ftma)


ftmf = feedback(ftma,1)

% Apresenta a resposta ao degrau unitário, aplicado na referência 
% do sistema, da conexão composta pelo sistema de quarta ordem 
% montado anteriormente, com uma realimentação unitária, num 
% esquema de rastreamento de referência. Note que, como o ganho de 
% todos os blocos é igual a 1, o erro de regime é de 50%. 

figure(5)
step(ftmf,15)


ftmf2 = feedback(6*ftma,1)

% Apresenta a resposta ao degrau unitário, aplicado na referência 
% do sistema, da conexão composta pelo sistema de quarta ordem 
% montado anteriormente, com uma realimentação unitária, num 
% esquema de rastreamento de referência. Note que o ganho do 
% controlador agora foi passado para 6, o que resultou numa 
% resposta excessivamente oscilatória. 

figure(6)
step(ftmf2,15)


ftmf3 = feedback(4.6*ftma,1)

% Apresenta a resposta ao degrau unitário, aplicado na referência 
% do sistema, da conexão composta pelo sistema de quarta ordem 
% montado anteriormente, com uma realimentação unitária, num 
% esquema de rastreamento de referência. Note que o ganho do 
% controlador agora foi passado para 4.6, o que resultou num 
% compromisso satisfatório (dentro dos limites de desempenho do 
% sistema em questão) entre erro de regime permanente e estabilidade 
% do sistema em malha fechada. 

figure(7)
step(ftmf3,15)