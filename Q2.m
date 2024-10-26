clear all
close all

Fs = 20000;
poleFrequency = 3500;
poleRadius = 0.95;
size = 2048;

angle = poleFrequency/Fs*2*pi

% Get points of poles
pole1 = poleRadius*exp(1i*angle);
pole2 = poleRadius*exp(-1i*angle);

num = [1 0 0];
den = [1 -(pole1+pole2) pole1*pole2]

f = linspace(0, Fs/2, size);

w = 2*pi*f/Fs;

H = freqz(num, den, w);

magnitude = 20*log10(abs(H));

impulse = filter(num, den, [1 zeros(1, size-1)]);

figure;

subplot(2, 1, 1);
plot(f, magnitude);
grid on;
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Magnitude Response');
xlim([0 Fs/2]);

subplot(2, 1, 2);
stem(impulse, 'MarkerSize', 2);
grid on;
xlabel('Time (samples)');
ylabel('Amplitude');
title('Impulse Response');
xlim([0 200]);
