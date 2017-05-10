function  out = iseven(in)
%------------------------------------------------------------------------
% out = isodd(in)
%------------------------------------------------------------------------
% TytoLogy -> Utilities Toolbox -> General Utilities
%------------------------------------------------------------------------
%
%	returns 1 (true) if input value is even, 0 (false) if odd
% 
%------------------------------------------------------------------------
% Input Arguments:
% 	in		input integer
% 
% Output Arguments:
% 	out	1 if in value is even, 0 if not
%
%------------------------------------------------------------------------
% See also: isodd
%------------------------------------------------------------------------

%------------------------------------------------------------------------
% Sharad J. Shanbhag
% sshanbhag@neoucom.edu
%------------------------------------------------------------------------
% Created: 29 September, 2010 (SJS)
%
% Revisions:
%	10 May 2017 (SJS): updated documentation
%------------------------------------------------------------------------


%----------------------------------------------------------------
% Checks
%----------------------------------------------------------------
if ~isnumeric(in)
	error('%s; input must be numeric!', mfilename);
end

% compute modulus of input with 2
in_mod2 = mod(in, 2);

% check is remainder is 0
out = in_mod2 == 0;

