function bin = seconds2bin(seconds, Fs)
%--------------------------------------------------------------------------
% bin = seconds2bin(seconds, Fs)
%--------------------------------------------------------------------------
% Utilities Toolbox
%--------------------------------------------------------------------------
% 
% returns corresponding bin(s) for time seconds and sample rate Fs
%
%--------------------------------------------------------------------------
% 	Input Arguments:
%		seconds			time in seconds
%		Fs			sampling rate in samples/second
%--------------------------------------------------------------------------
%	Output Arguments:
% 		bin		bin #
%--------------------------------------------------------------------------
% See Also: ms2samples, bin2seconds
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
% Sharad J. Shanbhag
% sharad.shanbhag@einstein.yu.edu
%--------------------------------------------------------------------------
% Created: ??????????????
% 
% Revision History
%	21 February, 2010 (SJS): updated documentation
%--------------------------------------------------------------------------

bin = floor(Fs .* seconds);