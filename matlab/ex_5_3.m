clear all; close all;

% define the data-vector length
N = 8;

% calculate the twiddle factors
W = exp(-1j*2*pi*[0:N/2-1]/N);

% define the data and ordering
data = fix(128*(rand(N,1)-0.5 + 1j*rand(N,1)-0.5))';
x = data;
x = bitrevorder(x);

% stage 1
[x(1), x(2)] = bfly(x(1), x(2), W(1));
[x(3), x(4)] = bfly(x(3), x(4), W(1));
[x(5), x(6)] = bfly(x(5), x(6), W(1));
[x(7), x(8)] = bfly(x(7), x(8), W(1));
% stage 2
[x(1), x(3)] = bfly(x(1), x(3), W(1));
[x(2), x(4)] = bfly(x(2), x(4), W(3));
[x(5), x(7)] = bfly(x(5), x(7), W(1));
[x(6), x(8)] = bfly(x(6), x(8), W(3));
% stage 3
[x(1), x(5)] = bfly(x(1), x(2), W(1));
[x(2), x(6)] = bfly(x(2), x(6), W(2));
[x(3), x(7)] = bfly(x(3), x(7), W(3));
[x(4), x(8)] = bfly(x(4), x(8), W(4));

% compate results with built-in FFT command
err = abs(x - fft(data));
max_diff = max(err);

if max_diff > (1/N)
    fprintf('\nImplementation fail, error = %i\n', max_diff);
else
    fprintf('\nImplementation success\n');
