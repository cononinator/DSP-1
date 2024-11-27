clear;
Fsamp = 10e3;
Fc = 3e3;
Fs = 34e2;
Wc = Fc/(Fsamp/2);
Ws = Fs/(Fsamp/2);
Wb = (Fc+200)/(Fsamp/2);
ftb = 400;
Stop_att = 35;
Pass_rip = 0.1;
[n, Wp] = cheb1ord(Wc, Ws, Pass_rip, Stop_att);

[b,a] = cheby1(n , Pass_rip, Wp);
[c, d] = butter(n, Wb);

[H1, W1] = freqz(b, a, 1024);
[H2, W2] = freqz(c, d, 1024);

F1 = W1*Fsamp/(2*pi);
mag1_db = 20*log10(abs(H1));

F2 = W2*Fsamp/(2*pi);
mag2_db = 20*log10(abs(H2));

% Calculate phase responses in degrees
phase1 = unwrap(angle(H1))*180/pi;
phase2 = unwrap(angle(H2))*180/pi;

% Create subplot layout
subplot(2,1,1);
plot(F1, mag1_db, 'blue');
hold on;
plot(F2, mag2_db, 'red');
hold off;
grid on;
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Order 9 Chebyshev vs Butterworth Filter Response');
legend(["Chebyshev", "Butterworth"]);

subplot(2,1,2);
plot(F1, phase1, 'blue');
hold on;
plot(F2, phase2, 'red');
hold off;
grid on;
xlabel('Frequency (Hz)');
ylabel('Phase (degrees)');
legend(["Chebyshev", "Butterworth"]);
