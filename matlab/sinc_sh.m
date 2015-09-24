%Function y = sinc_sh(t, fs, n)
%
%The function SINC_SH computes the sin(x)/x-Interpolation-Function for
%the sample frequency fs shifted by n sample intervals, i.e. 
%y = sinc(pi*fs(t-n)).
%For sinc(0) the function retrurns y = 1.
%
%ARGUMENTS: t     - kx1 vector (continous time)
%           fs    - frequency; 1/fs = sample interval
%           n     - time shift in # of sample intervals  
%
%RETURNS  : y     - kx1 vector = sinc(pi*fs(t-n)) 
%

%%%%%%%% Matlab code follows %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [y] = sinc_sh(t, fs, n)

%%%%%%%% Setup Constants %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if nargin ~= 3
   errstr = char('!!! Incorrect # of input arguments');
   error(errstr);
end

if fs <= 0
   errstr = char('!!! Sample frequency fs must be > 0');
   error(errstr);
end

%%%%%%%% Initialize Variables %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%% Main Program %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

y = sin(pi*fs*(t-n))./(pi*fs*(t-n));
arg0 = find((t-n)==0); % find all arguments identical to 0
y(arg0) = ones(size(arg0));

%%%%%%%% End Program %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

























