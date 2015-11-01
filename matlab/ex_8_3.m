%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DSVB Part 1
% Exercise 8: Practical FIR and IIR Filter Design
% Waj, HSLU-T&A
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%% 8.2 Filtering Audio Signals
clear all; close all;

%% 
% 1. Analyze Given signal
load buried;
N=length(s);

S = 20*log10(2*abs(fft(blackman(N).*s)/N)); 
S = S(1:N/2+1);
set(figure,'Name','Exercise 8.3: Given Audio Signal');
title('|S| (dB)');grid on;
plot([0:N/2]/(N/2),S); axis([0,1,-160,0])
title('|S_X| (dB)');grid on;

soundsc(s,Fs)

%%
% 2. Apply appropriate filter                          ==> ToDo

% apply simple low pass filter
lp_1 = fir1(2048, 0.4,'low');   % create filter
y = filter(lp_1, 1, s);         % apply filter on data

S1 = 20*log10(2*abs(fft(blackman(N).*y)/N)); 
S1 = S1(1:N/2+1);
set(figure,'Name','Exercise 8.3/2: Given Audio Signal');
plot([0:N/2]/(N/2),S1); axis([0,1,-160,0]);

% add bandstop for 0.1 and 0.2
Z_n = [exp(1i*0.1*pi), exp(-1i*0.1*pi), exp(1i*0.2*pi), exp(-1i*0.2*pi)];
N_n = [0 0 0 0];
G_n = 1;
b = zp2tf(Z_n',N_n',G_n);
s2 = filter(b, 1, S1);

N = length(s2);

S2 = 20*log10(2*abs(fft(blackman(N).*s2)/N));
S2 = S2(1:N/2+1);
set(figure,'Name','Exercise 8.3/3: Given Audio Signal');
plot([0:N/2]/(N/2),S2); axis([0,1,-160,0]);

