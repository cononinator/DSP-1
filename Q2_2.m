clear;
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
    plot(w1/pi*Fs/2, abs(h1));
    hold on;
    legend_strings{end+1} = sprintf('firpm Design (N=%d)', n);
end

n = 51;
c = fir1(n, Fc/Fs, 'low', hamming(n+1));
[h2, w2] = freqz(c, 1, 512);
plot(w2/pi*Fs, abs(h2), '--');
legend_strings{end+1} = sprintf('fir1 Design (N=%d)', n);

grid on;
legend(legend_strings);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
