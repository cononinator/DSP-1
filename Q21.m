clear;
fsamp = 10e3;
fc = 3e3;
fs = 34e2;
wc = fc/(fsamp/2);
ws = fs/(fsamp/2);
ftb = 400;
Stop_att = 35;
Pass_rip = 0.1;
[n, wp] = cheb1ord(wc, ws, Pass_rip, Stop_att)

[b,a] = cheby1(n , Pass_rip, wp)

[h, w] = freqz(b, a, 1024);
f = w*fsamp/(2*pi);
mag_db = 20*log10(abs(h));

plot(f, mag_db);
grid on;
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Chebyshev Type I Filter Response');
