clear all
close all
% Define numerator and denominator coefficients for (i)
num_i = [0.16 -0.48 0.48 -0.16];
den_i = [1 +0.13 +0.52 +0.3];

% Frequency Response
[H_i, w_i] = freqz(num_i, den_i);
magnitude_response_i = 20*log10(abs(H_i));

% Impulse Response
impulse_response_i = filter(num_i, den_i, [1 zeros(1, 100)]);

% Plot
figure;
subplot(2,1,1);
plot(w_i, magnitude_response_i);
title('Magnitude Response of Filter (i)');
xlabel('Frequency (rads)');
ylabel('Magnitude (dB)');
xlim([0 pi])
grid on;

subplot(2,1,2);
stem(impulse_response_i, 'MarkerSize', 2);
title('Impulse Response of Filter (i)');
xlabel('Sample Index');
ylabel('Amplitude');
xlim([0 20])
grid on;

% Define numerator and denominator coefficients for (ii)
num_ii = [0.634 0 -0.634];
den_ii = [1 0 -0.268];

% Frequency Response
[H_ii, w_ii] = freqz(num_ii, den_ii);
magnitude_response_ii = 20*log10(abs(H_ii));

% Impulse Response
impulse_response_ii = filter(num_ii, den_ii, [1 zeros(1, 100)]);

% Plot
figure;
subplot(2,1,1);
plot(w_ii, magnitude_response_ii);
title('Magnitude Response of Filter (ii)');
xlabel('Frequency (rads)');
ylabel('Magnitude (dB)');
xlim([0 pi])
grid on;

subplot(2,1,2);
stem(impulse_response_ii, 'MarkerSize', 2);
title('Impulse Response of Filter (ii)');
xlabel('Sample Index');
ylabel('Amplitude');
xlim([0 20])
grid on;

% Define numerator and denominator coefficients for (iii)
num_iii = [0.634 0 0.634];
den_iii = [1 0 0.268];

% Frequency Response
[H_iii, w_iii] = freqz(num_iii, den_iii);
magnitude_response_iii = 20*log10(abs(H_iii));

% Impulse Response
impulse_response_iii = filter(num_iii, den_iii, [1 zeros(1, 100)]);

% Plot
figure;
subplot(2,1,1);
plot(w_iii, magnitude_response_iii);
title('Magnitude Response of Filter (iii)');
xlabel('Frequency (rads)');
ylabel('Magnitude (dB)');
grid on;
xlim([0 pi])

subplot(2,1,2);
stem(impulse_response_iii,'MarkerSize', 2);
title('Impulse Response of Filter (iii)');
xlabel('Sample Index');
ylabel('Amplitude');
xlim([0 20])
grid on;

% Define numerator and denominator coefficients for (iv)
num_iv = [0.634 -5 10];
den_iv = [10 -5 1];

% Frequency Response
[H_iv, w_iv] = freqz(num_iv, den_iv);
magnitude_response_iv = 20*log10(abs(H_iv));

% Impulse Response
impulse_response_iv = filter(num_iv, den_iv, [1 zeros(1, 100)]);

% Plot
figure;
subplot(2,1,1);
plot(w_iv, magnitude_response_iv);
title('Magnitude Response of Filter (iv)');
xlabel('Frequency (rads)');
ylabel('Magnitude (dB)');
xlim([0 pi])
grid on;

subplot(2,1,2);
stem(impulse_response_iv, 'MarkerSize', 2);
title('Impulse Response of Filter (iv)');
xlabel('Sample Index');
ylabel('Amplitude');
xlim([0 20])
grid on;


% Plot Phase Response for all filters
figure;

% Phase Response for Filter (i)
subplot(2,2,1);
plot(w_i, angle(H_i));
title('Phase Response of Filter (i)');
xlabel('Frequency (rads)');
ylabel('Phase (radians)');
grid on;
xlim([0 pi])

% Phase Response for Filter (ii)
subplot(2,2,2);
plot(w_ii, angle(H_ii));
title('Phase Response of Filter (ii)');
xlabel('Frequency (rads)');
ylabel('Phase (radians)');
grid on;
xlim([0 pi])

% Phase Response for Filter (iii)
subplot(2,2,3);
plot(w_iii, angle(H_iii));
title('Phase Response of Filter (iii)');
xlabel('Frequency (rads)');
ylabel('Phase (radians)');
grid on;
xlim([0 pi])

% Phase Response for Filter (iv)
subplot(2,2,4);
plot(w_iv, angle(H_iv));
title('Phase Response of Filter (iv)');
xlabel('Frequency (rads)');
ylabel('Phase (radians)');
grid on;
xlim([0 pi])

% Plot Pole-Zero Diagrams for all filters
figure;

% Pole-Zero Diagram for Filter (i)
subplot(2,2,1);
zplane(num_i, den_i);
title('Pole-Zero Diagram of Filter (i)');
grid on;

% Pole-Zero Diagram for Filter (ii)
subplot(2,2,2);
zplane(num_ii, den_ii);
title('Pole-Zero Diagram of Filter (ii)');
grid on;

% Pole-Zero Diagram for Filter (iii)
subplot(2,2,3);
zplane(num_iii, den_iii);
title('Pole-Zero Diagram of Filter (iii)');
grid on;

% Pole-Zero Diagram for Filter (iv)
subplot(2,2,4);
zplane(num_iv, den_iv);
title('Pole-Zero Diagram of Filter (iv)');
grid on;
