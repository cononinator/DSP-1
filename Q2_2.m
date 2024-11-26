clear;
close;
Fs = 8e3;
Fc = 2e3;
Fbw = 300;
F = [0, 1000, 2000, 2300, 3000, 4000]; % Input frequencies
A = [1, 1, 1, 0, 0, 0]; % Input attenuations for given frequencies
Frat = F / (Fs/2); % Ratio of freq to nyquist

legend_strings = {};
for n = 21:5:51
    b = firpm(n, Frat, A);
    [h1, w1] = freqz(b, 1, 512);
    mag1 = 20*log10(abs(h1))
    plot(w1/pi*Fs/2, mag1);


end
legend_strings{end+1} = sprintf('firpm Design (N=%d)', n);
hold on;
n = 51;
c = fir1(n, Fc/Fs, 'low', hamming(n+1));
[h2, w2] = freqz(c, 1, 512);
mag2 = 20*log10(abs(h2))
plot(w2/pi*Fs, mag2, '--');
legend_strings{end+1} = sprintf('fir1 Design (N=%d)', n);

grid on;
legend(legend_strings);
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
xlim([0, 4000]);
