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
[c, d] = butter(n, wp)

[H1, W1] = freqz(b, a, 1024);
[H2, W2] = freqz(c, d, 1024);

F1 = W1*fsamp/(2*pi);
mag1_db = 20*log10(abs(H1));

F2 = W2*fsamp/(2*pi);
mag2_db = 20*log10(abs(H2));

plot(F1, mag1_db, color="blue");
hold on;
plot(F2, mag2_db, color="red");
hold off;
grid on;
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Order 9 Chebyshev vs Butterworth Filter Freq response');
