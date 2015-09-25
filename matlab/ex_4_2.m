% clean up environment
clear all; close all;

% define signal x
x1 = [0 0 1 1 1 0 0 0];
x2 = [0 0 0 0 1 1 1 0];

% fourier analysis of x
fx1 = abs(fft(x1));
fx2 = abs(fft(x2));

%%
% plot the spectrum
fh = figure('Name', 'Frequency spectrum');
ah = axes('Parent', fh);
subplot(3, 2, 1);
stem(x1);
title('Signal x1');
subplot(2, 2, 2);
plot(fx1, 'bo-'); hold on
plot(fftshift(fx1), 'r*-'); hold off
title('Spectrum X1');
legend('orig', 'fftshift');
subplot(2, 2, 3);
stem(x2);
title('Signal x2');
subplot(2, 2, 4);
plot(fx2, 'bo-'); hold on
plot(fftshift(fx2), 'r*-'); hold off
title('Spectrum X2');
legend('orig', 'fftshift');

%%
% REPEAT THIS TIME-SHIFTING STUFF AT HOME!

% phase of x
% k = 1;
% ph_fx1_sh_n = phase(fx1(k+1))/pi;
% ph_fx1_offset = 

%%
