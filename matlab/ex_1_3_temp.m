%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DSVB Part 1
% Exercise 1: Digital Signals in the Time Domain
% Waj, HSLU-T&A
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%% 1.3 Distance measurement by correlation
clear all;close all;

%%
% 1. Barker Code
set(figure,'Name','Correlation function and Convolution');
bark = [1 -1 1 1 -1 1 1 1 -1 -1 -1];
lb = length(bark);
% Plot Correlation function
subplot(2,1,1)
stem(fliplr([-lb+1:1:lb-1]), xcorr(bark,bark));
% Note that the time index vector must be flipped when using xcorr on
% two different vectors (cross-correlation), see the note on time indexing  
% of in ex_1_2.m.
title('Auto-Correlation of 11-digit Barker Code');
axis([-lb+0.8 lb-0.8 -2 12]); % 0.8 is workaround to see stem at -10 
xlabel('n');ylabel('r_{xx}[n]');

% Plot Linear Convolution
subplot(2,1,2);
stem([-lb+1:1:lb-1], conv(bark, fliplr(bark)));
axis([-lb+0.8 lb-0.8 -2 12]);
xlabel('n'); ylabel('z[n]');

%%
% 2. Distance measurement 
load radar_rx;
% plot Rx signal for visual inspection
set(figure,'Name','Distance Measurement with Barker Code');
subplot(2,1,1); stem((rx)); title('Received Signal');
% Barker code for correlation
tx = [1 -1 1 1 -1 1 1 1 -1 -1 -1];
% cross-correlate received signal with expected Barker code
% Note: Use either function xcorr or conv here.

subplot(2,1,2);
data = conv(rx, fliplr(tx));
stem(abs(data));

thr = 40;
nov = find(abs(data) > thr) - 1;
fprintf('Number of vehicles = %i\n', numel(nov));
for i = 1:numel(nov)
    fprintf('\t%i = %i\n', i, floor(nov(i)/2));
end