
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

figure(1) 
bode(ord1) 

% Efeito de um zero 

R0 = 100e3 ; 
C0 = 22e-9 ; 

mu = R0*C0 ;

num0 = [ mu 1 ] ; 
den0 = 1 ;

zero = tf(num0,den0) ; 

leadlag = series(ord1,zero)

figure(2) 
bode(leadlag) 


% 2a. ordem 

wn = sqrt(inv(L2*C2)) ;
zeta = R2/(2*L2*wn) ; 

num2 = wn^2 ; 
den2 = [ 1 2*zeta*wn wn^2 ] ; 

ord2 = tf(num2,den2) ; 

figure(3) 
bode(ord2) 

% 3a. ordem com zero 

ord3 = series(leadlag,ord2) ; 
figure(4) 
bode(ord3) 

