clear;
fsamp = 10e3;
fc = 3e3;
wc = fc/(fsamp/2);
ftb = 400;
Stop_att = 35;
Pass_rip = 0.1;

[b,a] = cheby1(8 , Pass_rip, wc);

[h, w] = freqz(b, a, 1024);
f = w*fsamp/(2*pi);
mag_db = 20*log10(abs(h));

plot(f, mag_db);
grid on;
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Chebyshev Type I Filter Response');
