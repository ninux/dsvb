function [aout, bout] = bfly(ain, bin, W)  
    aout = ain + W*bin;
    bout = ain - W*bin;
end
