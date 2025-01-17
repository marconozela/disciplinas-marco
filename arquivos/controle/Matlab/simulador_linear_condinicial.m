% Exemplo para o curso de SEL0417 - Fundamentos de Controle

% Simula��o linear - resposta a uma condi��o inicial

A = [ 0 1 ; -1 -1 ] ; 
B = [ 0 ; 1 ] ; 
C = [ 1 0 ] ; 
D = 0 ; 

deltax0 = [ 1 0 ] ; 
tfinal = 12 ; 

[y,x,t] = initial(A,B,C,D,deltax0,tfinal) ; 

figure(1)
plot(t,y) ;

figure(2)
plot(t,x(:,2)) ;

figure(3)
plot(x(:,1),x(:,2)) ;
