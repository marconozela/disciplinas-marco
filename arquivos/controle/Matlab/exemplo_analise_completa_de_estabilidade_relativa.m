
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

% Lugar de raízes

figure(1)
rlocus(ord3)

% Margens de Ganho e Fase

figure(2)
margin(ord3)

% Diagrama de Nyquist

figure(3)
nyquist(ord3)

% Sistema em malha fechada

ord3mf = feedback(ord3,1)

figure(4)
step(ord3mf)

pause

% 3a. ordem com fase mínima e ganho limite

k1 = 2.0732275 ;
ord3k2p07 = series(k1,ord3) ; 

% Lugar de raízes

figure(5)
rlocus(ord3k2p07)

% Margens de Ganho e Fase

figure(6)
margin(ord3k2p07)

% Diagrama de Nyquist

figure(7)
nyquist(ord3k2p07)

% Sistema em malha fechada

ord3k2p07mf = feedback(ord3k2p07,1)

figure(8)
step(ord3k2p07mf,0.02)

pause

% 3a. ordem com fase mínima e ganho acima do limite

k2 = 5 ; 
ord3k5 = series(ord3,k2) ; 

% Lugar de raízes

figure(9)
rlocus(ord3k5)

% Margens de Ganho e Fase

figure(10)
margin(ord3k5)

% Diagrama de Nyquist

figure(11)
nyquist(ord3k5)

% Sistema em malha fechada

ord3mfk5 = feedback(ord3k5,1)

figure(12)
step(ord3mfk5)

pause

% 3a. ordem com fase não mínima 

mu = -0.5*R1*C1 ;

den1 = 1 ; 
num1 = [ mu 1 ] ; 

zeronm = tf(num1,den1) ; 

ord3nm = series(ord3,zeronm) ; 

figure(13) 
bode(ord3nm) 

pause

% Lugar de raízes

figure(14)
rlocus(ord3nm)

% Margens de Ganho e Fase

figure(15)
margin(ord3nm)

% Diagrama de Nyquist

figure(16)
nyquist(ord3nm)

% Sistema em malha fechada

ord3mfnm = feedback(ord3nm,1)

figure(17)
step(ord3mfnm)

% 3a. ordem instável em malha aberta

zeta = -R2/(2*L2*wn) ; 

den2 = [ 1 2*zeta*wn wn^2 ] ; 

ord2i = tf(num2,den2) ; 

mu = 0.5*R1*C1 ;

den1 = 1 ; 
num1 = [ mu 1 ] ; 

zerom = tf(num1,den1) ; 

mu = R1*C1 ;

den1 = 1 ; 
num1 = [ mu 1 ] ; 

zerom2 = tf(num1,den1) ; 

ord3i = series(ord2i,series(zerom,zerom2)) ; 

figure(18) 
bode(ord3i) 

pause

% Lugar de raízes

figure(19)
rlocus(ord3i)

% Margens de Ganho e Fase

figure(20)
margin(ord3i)

% Diagrama de Nyquist

figure(21)
nyquist(ord3i)

% Sistema em malha fechada

ord3mfi = feedback(ord3i,1)

figure(27)
step(ord3mfi)


