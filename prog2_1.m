clear all;
clc;

f=50*2;     %frequency doubles for full rectified wave
vp = 230;       %peak amplitude stays the same
wo = 2*pi*f;
t = -2/f:0.001/f:2/f;
x = (2*vp/pi).*ones(size(t));
subplot(2,1,1);
plot(t,x);
hold on

for n=1:7
    A = (-4.*vp)./(pi.*(4.*(n.^2)-1));
    x = x + A.*cos(n.*wo.*t);
    subplot(2,1,1);
    plot(t,x);
    hold on;
end
hold off;
xlabel('time');
ylabel('x(t)');
legend('DC','coeff 1','coeff 2','coeff 3','coeff 4','coeff 5','coeff 6','coeff 7');
title('Fourier Approximations of FWR Signal and DC Value')


%original full wave rectified signal
hold off;
y = abs(230*sin((wo/2)*t));     %original equation
subplot(2,1,2);
plot(t,y);
xlabel('time');
ylabel('x(t)');
legend('FWR sig');
title('Original Full Wave Rectified Signal');