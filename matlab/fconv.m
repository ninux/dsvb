function res = fconv(x, y)

    % calculate needed length of result vector for convolution
    nxy = length(x) + length(y) - 1;

    % calculate the fft with the right length
    fx = fft(x, nxy);
    fy = fft(y, nxy);
    
    % calculate the result (inversion of fft)
    res = ifft(fx.*fy);
end