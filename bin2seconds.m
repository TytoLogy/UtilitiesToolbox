function seconds = bin2seconds(bins, Fs)
%------------------------------------------------------------------------
%  seconds = bin2seconds(bins, Fs)
%------------------------------------------------------------------------
% Utilities Toolbox
%------------------------------------------------------------------------
% 
% returns corresponding seconds for bins and sample rate Fs
%------------------------------------------------------------------------
% Input Arguments:
% 	bins		# of samples 
%	Fs			Sample rate (samples/second)
% 
% Output Arguments:
% 	seconds	duration in seconds
%------------------------------------------------------------------------
% See also: ms2bin, ms2samples, bin2ms
%------------------------------------------------------------------------

%------------------------------------------------------------------------
%  Sharad Shanbhag
%	sharad.shanbhag@einstein.yu.edu
%------------------------------------------------------------------------
% Created: 21 February, 2010 (SJS)
%
% Revisions:
%------------------------------------------------------------------------

% duration in seconds = (samples/seconds) * # of bins (samples)
seconds = bins ./ Fs;