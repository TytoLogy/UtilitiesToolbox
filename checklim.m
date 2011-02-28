function outval = checklim(val, lim)
% outval = checklim(val, lim)
%
% returns 1 if lim(1) <= val <= lim(2), 0 otherwise
%
% Examples:
% 
% 		>> checklim(1, [0 10])
%		ans =
%			 1
% 
% 		>> checklim([0 99], [-1 10])
% 
% 		ans =
% 
% 			 0
% 
% Input Arguments:
% val		value to test
% lim		[min max] limit vector
% 
% Output Arguments:
% 	0		val is out of bounds or invalid val or lim 
% 	1		in bounds
%
% See Also: between,  range

%--------------------------------------------------------------------------
% Sharad J. Shanbhag
% sshanbha@aecom.yu.edu
%--------------------------------------------------------------------------
% Revision History
%	6 Mar 2009 2009 (SJS): 
%		- expanded to handle val = [a b]
%		- improved documentation
%--------------------------------------------------------------------------
% TO DO:
%	* what to about case where length(val) == 2 and val(1) > val(2)????
%--------------------------------------------------------------------------

outval = 0;


if ~isnumeric(val) | ~isnumeric(lim)
	% return 0 if inputs are not numeric
	warning([mfilename ': val & lim must be numeric!']);
	return
elseif length(lim) ~= 2
	% return 0 if input limits is not of right format
	warning([mfilename ': lim needs to be [min max]']);
	return
elseif ~between(length(val), 1, 2)
	% return 0 if input val is not a single number or range
	warning([mfilename ': val must be a single value or range [min max]']);
	return
end

if length(val) == 1
	% if val is a single number, use between
	outval = between(val, lim(1), lim(2));
	return
else
	% val is a range, so check high and low limits
	outval =  between(val(1), lim(1), lim(2)) & between(val(2), lim(1), lim(2));
end