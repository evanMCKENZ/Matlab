clear all;
clc;

f=50*2;     %frequency doubles for full rectified wave
wo = 2*pi*f;
t = 0:0.0001:0.02;
x = (2*230/pi).*ones(size(t));
subplot(2,1,1);
plot(t,x);
hold on
for n= 1:1:4
    a0 = (10)/((1i*wo*n)+10);       %transfer function
    b0 = (2)/(1-(wo)*(n^2));      %part 1 Dk coefficient
    e0 = exp(1i*wo*n*t);                %exponential constant
    A = a0 * b0 * e0;
    x = x + A;
    subplot(2,1,1);
    plot(t,x);
end
xlabel('Time');
ylabel('x(t)');
legend('DC', 'output coeff 1', 'output coeff 2', 'output coeff 3', 'output coeff 4');
title('Low Pass Filter Output Waveform (Ripple)');

n = 10;
d1 = [1 10];
[h,w] = freqz(n, d1, 'whole',2000);
subplot(2,1,2);
plot(w/pi, 20*log10(abs(h)));
xlabel('Frequency');
ylabel('Magnitude (dB)');
legend('freq response');
title('Low Pass Filter Frequency Response');