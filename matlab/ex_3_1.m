%% define constant values
Fs = 8E3;       % Sampling frequency

%% load and play the female sound data
load('spf1.mat');
% sound(spf1, Fs);
stem(spf1);


%% load and play the male sound data
load('spm1.mat');
% sound(spm1);
stem(spm1);

%% calculate the qantization level (bits)
load('spf1.mat');
W = [2:1:16];

% xq = round(x*(2^(W-1)))/(2^(W-1));

for k = W
    q = uniqt(spf1, k);
    snr1(k) = snr(q,q-spf1);
end

fh = figure('Name', 'Quantization noise');
ah = axes('Parent', fh);
plot(W, snr1(W), 'r*-');
xlabel('W'); ylabel('SNR [dB]'); grid;
title('Quantization Noise as function of Word Width');
axis([2 16 0 82]);
set(ah, 'Ytick', [0:6:82]);
leg1 = 'uniform quant (W = # of bits';
legend(leg1, 'Location', 'Northwest');
