% clean up the environment
close all; clear all;

% define two signals (sequences) x and y of different length
x = [0 1 0 0 0 1 1 1 0 0 1 0 1 1];
y = [0 0 0 1 1 0 1 1 0 1 1 0];

% calculate the convolutions
res1 = fconv(x, y);
res2 = conv(x, y);

% plot
fh = figure('Name', 'Convulution Method Comparison');
ah = axes('Parent', fh);
plot(res1, 'bo-'); hold on
plot(res2, 'r*-'); hold off
legend('Convolution', 'Fast Conv.');