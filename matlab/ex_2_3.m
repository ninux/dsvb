%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DSVB Part 1
% Exercise 2: A/D and D/A Conversion
% Waj, HSLU-T&A
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%% 2.3 Perfect Reconstruction
clear all;close all;

%% 
% Parameters for experimentation
stype = 0;      % signal type to be analyzed: 
                %   0 = rectangular pulse
                %   1 = sinusoidal

T0 = 8.0;       % width of rectangular pulse in s 
f0 = 0.33;      % frequency of sinusoidal in Hz

res = 0.01;        % resolution for "continuous" time in sec
tww = [-15 15];   % left and right limit of relevant time window in sec
fs  = 1;          % sample frequency in Hz (must be integer)

%%
% "continuous" time vector
t=[tww(1):res:tww(2)];
% Generation of original signal
if stype == 0
    % rectangular pulse: x(t) = 1 for |t| <= T0/2
    %                    x(t) = 0 otherwise
    x_cont = ones(size(t));
    idx0 = find(abs(t)>T0/2); 
    x_cont(idx0) = zeros(size(idx0));
    tstr = strcat(' Rectangular Pulse (T_0 = ',int2str(T0),' s');
else
    % sinusoidal
    x_cont = sin(2*pi*f0*t);
    tstr = strcat(' Sinusoidal (f_0 = ',num2str(f0),' Hz');
end  
% Calculate sample time points
n = downsample(t,1/(res*fs));
% setup figure
set(figure,'Name','Perfect Reconstruction'); hold on; grid on;
title(strcat('sinc-Interpolation of ',tstr,', f_S = ',int2str(fs),' Hz)')); 
xlabel('sec')
% plot "continuous-time" signal
plot(t,x_cont,'b');  
legend('original continuous-time signal','Location','NorthWest')

%%
% perform interpolation by superpostion of weighted sinc-functions
x_sample = zeros(size(n));  % init sampled signals
x_inpol = zeros(size(t));   % init superposition sum 
for k=1:length(n)
    % get k-th sample value 
    x_sample(k) = x_cont(find(t==n(k)));
    % calculate k-th weighted sinc function
    ipf = x_sample(k)*sinc_sh(t,fs,n(k));
    % accumulate k-th weighted sinc function
    x_inpol = x_inpol + ipf;
    % plot k-th weighted sinc function with red dashed line
    plot(t,ipf,'r:');
end
% plot sample values and interpolated signal
stem(n,x_sample,'g');
plot(t,x_inpol,'k');
% calculate SNR
snr_inpol = snr(x_inpol, x_cont-x_inpol)

