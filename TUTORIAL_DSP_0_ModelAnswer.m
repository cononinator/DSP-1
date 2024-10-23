%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% TUTORIAL_DSP_0_MODELANSWER.M
%
% Sample "model answers" for EE445 assignments.
% Exercise on "discrete-time signals and systems" .
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pkg load signal
clear

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EXERCISE 1
%
% AM Waveform Generation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set up constants
fc = 2000;
fs = 10000;
fa1 = 100;
A = 8;
m = 1; % modulation index - change this and see what happens
% convert the time duration (in seconds) into sample number
duration = 50e-3;
nsamp = round(duration*fs);

% generate the information signal
xm = cos(2*pi*(0:nsamp-1)*fa1/fs);

% generate the carrier
xc = sin(2*pi*(0:nsamp-1)*fc/fs);
% generate the AM waveform
xam = A.*(1+m.*xm).*xc;

% plot
figure(1);
% time axis
time_axis = (0:nsamp-1)/fs;
plot(time_axis, xam);
grid on;
xlabel('Time (seconds)');
ylabel('Amplitude (V)');
% title('AM Waveform');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EXERCISE 2
%
% First-order digital filters.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% set up the two filters
b1 = [1, -0.9];
a1 = 1;
b2 = 1;
a2 = [1 -0.9];
% calculate the two impulse responses using "impz"
nsamp = 101;
h1a = impz(b1, a1, nsamp);
h2a = impz(b2, a2, nsamp);

% do the same using a "for" loop
% create vectors to hold the impulse responses
h1b = zeros(nsamp,1);
h2b = h1b;
% initialise digital filter memory (the first filter needs "x(n-1)" and the
% second one needs "y(n-1)") - simple way of handling this is to create two
% variables to hold the memory values
xnm1 = 0;
ynm1 = 0;
% create an "impulse"
x = zeros(nsamp, 1);
x(1) = 1;

for i = 1:nsamp,

    % first filter
    h1b(i) = x(i) - 0.9*xnm1;
    % update digital filter memory - COMMON MISTAKE IS TO FORGET THIS!
    xnm1 = x(i);

    % second filter
    h2b(i) = x(i) + 0.9*ynm1;
    % update digital filter memory - COMMON MISTAKE IS TO FORGET THIS!
    ynm1 = h2b(i);

end;
figure(2);
subplot(2,1,1); plot(h1a);
grid on;
xlabel('Sample Index');
ylabel('Sample Value');
subplot(2,1,2); plot(h2a);
grid on;
xlabel('Sample Index');
ylabel('Sample Value');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EXERCISE 3
%
% Impulse and step responses.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% specify the filter
bb = [0.3, 0.6, 0.3];
aa = [1, 0, -0.9];
% set up the inputs - note that the "sample index" starts at n=-20 but
% the array index in Octave starts at 1
nsamp = 100+20+1;
impulse = zeros(nsamp, 1);
impulse(21) = 1;
step_input = zeros(nsamp, 1);
step_input(21:end) = 1;
% can use the Matlab "filter" function, or write a "for" loop to implement the
% difference equation directly
y1 = filter(bb, aa, impulse);
y2 = filter(bb, aa, step_input);
% set up "sample axis"
sample_index = -20:100;

% plot the responses - use "stem" to more readily see
% the samples
figure(3);
subplot(2,1,1);
plot(sample_index, y1);
grid on;
subplot(2,1,2);
plot(sample_index, y2);
grid on;
xlabel('Sample Index');
ylabel('Sample Value');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EXERCISE 4
%
% Second-order filter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r = 0.85;
theta0 = (2*pi)/10;
b2 = r*r;
b1 = -2*r*cos(theta0);
% specify the filter
bb = [1+b1+b2];
aa = [1, b1, b2];
% get the impulse response
nsamp = 101;
hn = impz(bb, aa, nsamp);
figure(4);
stem(hn); grid on;
% for complex conjugate poles, should be a decaying oscillation
xlabel('Sample Index');
ylabel('Sample Value');

% plot the pole zero map
figure(5);
zplane(bb, aa);
grid on;
% poles should be located at an angle of pi/5 - in the first quadrant. Depends somewhat
% on the eyesight of the student!
% Also, you can estimate the frequency by counting the number of samples per period
% of the oscillation in the impulse response.
% This is 10 samples, indicating that fs/fa = 10 => fa/fs = 1/10, i.e. the "analogue"
% pole frequency is 1/10 of the sampling frequency.

