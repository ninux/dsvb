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

mu = 100;
sig = mulaw(spf1, mu);
for k = W
    q = uniqt(sig, k);
    snr2(k) = snr(q,q-sig);
end

fh = figure('Name', 'Quantization noise');
ah = axes('Parent', fh);
plot(W, snr1(W), 'r*-'); hold on;
plot(W, snr2(W), 'b*-'); hold off;
xlabel('W'); ylabel('SNR [dB]'); grid;
title('Quantization Noise as function of Word Width');
axis([2 16 0 82]);
set(ah, 'Ytick', [0:6:82]);
leg1 = 'uniform quant (W = # of bits';
leg2 = strcat('log quant (W = # of bits), \mu', int2str(mu));
legend(leg1, leg2, 'Location', 'Northwest');

%%
% inverse uLaw-Function
% ulaw_inv = sign(X).*(exp(abs(X)*log(1+u))-1)

%%
% play the sound (uLaw applied) in original quality by 
% first applying linear quantisation (uniqt)
% and then the de-logarithmation (mulaw_inv)
soundsc(mulaw_inv(uniqt(sig, 8), mu)/mu, 8E3);

%% 
% play the sound (uLaw not applied) by less quality by
% just applying linear quantisation
soundsc(uniqt(spf1, 3), 8E3);