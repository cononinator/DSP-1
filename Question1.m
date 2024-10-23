% Define coefficients
Fs = 16000; % Sampling frequency in Hz
num = [1, 0.5];
den = [1, -1.8 * cos(pi/16), 0.81];

% Frequency response
N = 1024; % Number of points
[H, f] = freqz(num, den, N, Fs); % Compute the frequency response

% Plot magnitude response in dB
plot(f, 20*log10(abs(H)));
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Magnitude Response');
grid on;

poles = roots(den); % Find the poles
polar_poles = abs(poles); % Magnitudes of the poles
angles_poles = angle(poles); % Angles of the poles in radians

% Plot pole zero map
figure;
% Find zeros and poles
zeros = roots(num);
poles = roots(den);


