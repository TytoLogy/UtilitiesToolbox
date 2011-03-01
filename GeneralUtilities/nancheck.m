function outVal = nancheck(inVal, replaceVal)
%------------------------------------------------------------------------
% outVal = nancheck(inVal, replaceVal)
%------------------------------------------------------------------------
% 
% replaces NaN values in inVal with 0 (or replaceVal, if given)
% 
%------------------------------------------------------------------------
% Input Arguments:
% 	inVal		vector or matrix
%	
%	Optional:
% 		replaceVal		replacement value for NaNs in inVal
% 							(if not provided, default is 0)
% 
% Output Arguments:
% 	outVal	output vector or matrix with NaNs replaced by 0 
% 				(or replaceVal)
%
%------------------------------------------------------------------------
% See also: isnan
%------------------------------------------------------------------------

%------------------------------------------------------------------------
% Sharad J. Shanbhag
% sshanbhag@neoucom.edu
%------------------------------------------------------------------------
% Created: 19 January, 2011 (SJS)
%
% Revisions:
%------------------------------------------------------------------------

% check if replaceVal was given as input
if nargin ~= 2
	replaceVal = 0;
end

% check for NaN, replace if found
a = isnan(inVal);
if sum(sum(a))
	% NaN detected; find linear array positions of NaN values
	nanvals = find(a);
	% replace NaN values
	inVal(nanvals) = replaceVal*ones(size(nanvals));
end

% set output
outVal = inVal;