clear all
close all

v = (-20:2:10);

ti = -10;
tf = 100;
tpasso = 0.001;

t = (ti:tpasso:tf);

T = 1;
fcos = 1/T;

x = cos(2*pi*fcos*t);

for u=1:length(t)
    x2(u) = cos(2*pi*fcos*t(u));
end

figure(1)
plot(t,x,'b')
xlabel('t(s)')
ylabel('função x')

figure(2)
plot(t,x,'b',t,x2,'k.')

y = x.*x2;

y2 = x.^2;

z = exp(i*2*pi*t);

figure(3)
plot(t,real(z),'b',t,imag(z),'k.')

figure(4)
plot(t,abs(z))