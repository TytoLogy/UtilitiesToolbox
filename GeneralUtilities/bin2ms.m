function ms = bin2ms(bin, Fs)
%------------------------------------------------------------------------
% ms = bin2ms(bin, Fs)
%------------------------------------------------------------------------
% Utilities Toolbox
%------------------------------------------------------------------------
% 
% returns corresponding ms for bins bin and sample rate Fs
%------------------------------------------------------------------------
% Input Arguments:
% 	bin		# of samples 
%	Fs			Sample rate (samples/second)
% 
% Output Arguments:
% 	ms			milliseconds
%------------------------------------------------------------------------
% See also: ms2bin, ms2samples, bin2s
%------------------------------------------------------------------------

%------------------------------------------------------------------------
%  Sharad Shanbhag
%	sharad.shanbhag@einstein.yu.edu
%------------------------------------------------------------------------
% Created: ??????????????
%
% Revisions:
%	21 February, 2010 (SJS): updated documentation
%------------------------------------------------------------------------

% duration in milleseconds = 1000 * (samples/seconds) * # of bins (samples)
ms = (1000/Fs) * bin;