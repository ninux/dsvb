function [ xq ] = uniqt( sig, W )
%UNITQT Calculates the number of quantization bits
%   Parameters (sig, W)
%   sig = Signal
%   W = number of bits

    xq = round(sig*(2^(W-1)))/(2^(W-1));
    
end

