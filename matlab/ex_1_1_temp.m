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
Ts = 1/10000;         % Ts = 1/10 kHz = 0.1 ms
len = 2;              % T = length = 2 sec
amp = 1;              % amplitude
f0 = 1/0.002;         % T0 = 2 ms ===> f0 = 500 Hz
n = 0:1:len/Ts-1;     % # of samples = length in sec / Ts in sec
s = amp*sin(2*pi*f0*n*Ts);

%%
% 2. Generation of r[n]

To_Do

%%
% 3. Plotting s[n], r[n], s[n]+r[n]
np = [0:199];   % time index for plotting, 200 samples
set(figure,'Name','Harmonic Signals');
subplot(3,1,1)
plot(np*Ts*1000,s(np+1)); 
xlabel('t [ms]'); ylabel('s(n\cdotT_S)'); title('\bf{s[n]}'); grid;

To_Do

%%
% 4./5. Signal-to-Noise-Ratio 

To_Do

