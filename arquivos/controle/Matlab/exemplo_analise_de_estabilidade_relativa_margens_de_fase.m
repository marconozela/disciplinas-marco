 
% Exemplos de resposta em frequencia

R1 = 6.8e3 ; 
C1 = 22e-9 ; 

R2 = 4e3 ; 
C2 = 22e-9 ; 
L2 = 640e-3 ;  

% 1a. ordem 

tau = R1*C1 ;

num1 = 1 ; 
den1 = [ tau 1 ] ; 

ord1 = tf(num1,den1) ; 

% 2a. ordem 

wn = sqrt(inv(L2*C2)) ;
zeta = R2/(2*L2*wn) ; 

num2 = wn^2 ; 
den2 = [ 1 2*zeta*wn wn^2 ] ; 

ord2 = tf(num2,den2) ; 

% 3a. ordem com fase mínima

ord3 = series(ord1,ord2) ; 

% Lugar de raízes - encontrar o ganho limite

figure(1)
rlocus(ord3)

pause 

% 3a. ordem com fase mínima e ganho limite

k1 = 2.0732275
ord3k2p07 = series(k1,ord3) ; 

% Lugar de raízes

figure(2)
rlocus(ord3k2p07)

% Margens de Ganho e Fase

figure(3)
margin(ord3k2p07)

% Sistema em malha fechada

ord3k2p07mf = feedback(ord3k2p07,1)

figure(4)
step(ord3k2p07mf,0.02)

pause

% 3a. ordem com fase mínima e ganho abaixo do limite - ganho unitário
% original do sistema

% Lugar de raízes

figure(5)
rlocus(ord3)

% Margens de Ganho e Fase

figure(6)
margin(ord3)

% Sistema em malha fechada

ord3mf = feedback(ord3,1)

figure(7)
step(ord3mf)

pause

% 3a. ordem com fase mínima e ganho acima do limite

k2 = 5 ; 
ord3k5 = series(k2,ord3) ; 

% Lugar de raízes

figure(8)
rlocus(ord3k5)

% Margens de Ganho e Fase

figure(9)
margin(ord3k5)

% Sistema em malha fechada

ord3mfk5 = feedback(ord3k5,1)

figure(10)
step(ord3mfk5)
