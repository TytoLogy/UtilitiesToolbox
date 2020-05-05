function outval = between(val, low, high)
%------------------------------------------------------------------------
% outval = between(val, low, high)
%------------------------------------------------------------------------
% UtilitiesToolbox:GeneralUtilities
%------------------------------------------------------------------------
% returns 1 if low <= val <= high, 0 otherwise
% 
%------------------------------------------------------------------------
% Input Arguments:
% 	val	value or vector of values to check
% 	low	low limit value
% 	high	high limit value
%	
% Output Arguments:
% 	outVal	1 if val is in range [low, high], otherwise 0
%				* note that range includes low and high values, so maybe
%				  this is more accurately called "within"??
%------------------------------------------------------------------------
% See also: max, min
%------------------------------------------------------------------------

%------------------------------------------------------------------------
% Sharad J. Shanbhag
% sshanbhag@neomed.edu
%------------------------------------------------------------------------
% Created: ??? (SJS)
%
% Revisions:
%	6 Sep 2012 (SJS): updated email, comments, vectorized code
%	5 May 2020 (SJS): modified check for high < low (from old high <= low)
%------------------------------------------------------------------------

%% check inputs
if nargin ~= 3
	error('between: need val, low and high arguments');
end

if high < low
	error('between: high must be greater than low value');
end

%% process
outval = (val >= low) & (val <= high);

% old code (replaced 6 sept 2012)
% outval = 0;
% if (val >= low) & (val <= high)
% 	outval = 1;
% end


