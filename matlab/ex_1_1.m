%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DSVB Part 1
% Exercise 1: Digital Signals in the Time Domain
% Waj, HSLU-T&A
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%% 1.1 Harmonic Signals and SNR
clear all;close all;

%%
% 1. Generation of s[n]
% all parameters in seconds/Hz
Ts = 1/10E3;          % Ts = 1/10 kHz = 0.1 ms
len = 2;              % T = length = 2 sec
amp = 1;              % amplitude
f0 = 1/0.002;         % T0 = 2 ms ===> f0 = 500 Hz
n = 0:1:len/Ts-1;     % # of samples = length in sec / Ts in sec
s = amp*sin(2*pi*f0*n*Ts);

%%
% 2. Generation of r[n]
Ts = 1/10E3;          % Ts = 1/10 kHz = 0.1 ms
len = 2;              % T = length = 0.33 sec
amp = 0.1;            % amplitude
f0 = 1/0.00033;       % T0 = 0.33 ms
n = 0:1:len/Ts-1;     % # of samples = length in sec / Ts in sec
r = amp*sin(2*pi*f0*n*Ts);

%To_Do

%%
% 3. Plotting s[n], r[n], s[n]+r[n]
np = [0:199];   % time index for plotting, 200 samples
set(figure,'Name','Harmonic Signals');
subplot(3,1,1)
plot(np*Ts*1000,s(np+1)); 
xlabel('t [ms]'); ylabel('s(n\cdotT_S)'); title('\bf{s[n]}'); grid;

subplot(3,1,2)
plot(np*Ts*1000,r(np+1)); 
xlabel('t [ms]'); ylabel('s(n\cdotT_S)'); title('\bf{s[n]}'); grid;

subplot(3,1,3)
plot(np*Ts*1000,s(np+1) + r(np+1)); 
xlabel('t [ms]'); ylabel('s(n\cdotT_S)'); title('\bf{s[n]}'); grid;

%%
% 4./5. Signal-to-Noise-Ratio 

signal = s + r + 3;
noise  = r;

res1 = snr(signal,noise);
res2 = snrac(signal,noise);

fprintf('SNR \t= %.1f dB\nSNRAC \t= %.1f dB\n', res1, res2);

% To_Do