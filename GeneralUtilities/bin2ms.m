function ms = bin2ms(bin, Fs)
%------------------------------------------------------------------------
% ms = bin2ms(bin, Fs)
%------------------------------------------------------------------------
% TytoLogy -> Utilities Toolbox -> General Utilities
%------------------------------------------------------------------------
% 
% returns corresponding ms for bins bin and sample rate Fs
%
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
%  Sharad J. Shanbhag
%	sshanbhag@neomed.edu
%------------------------------------------------------------------------
% Created: ??????????????
%
% Revisions:
%	21 February, 2010 (SJS): updated documentation
%	10 May 2017 (SJS): updated email
%------------------------------------------------------------------------

% duration in milleseconds = 1000 * (samples/seconds) * # of bins (samples)
ms = (1000/Fs) * bin;