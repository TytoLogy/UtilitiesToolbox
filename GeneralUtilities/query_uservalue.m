function outval = query_uservalue(msgtxt, default)
%------------------------------------------------------------------------
% outval = query_uservalue(msgtxt, default)
%------------------------------------------------------------------------
% UtilitiesToolbox -> GeneralUtilities
%------------------------------------------------------------------------
%	prints message msgtxt and returns outval
%	
%	default:
%		can take 3 forms
%			1) a single numerical value 
%			2) a range of values and default value [low high default]
%			3) a string
%
%	if default is a range of values, query_userint will require the input
%	value to be in the range default(1) <= input value < default(2)
%
%	if default is 
%------------------------------------------------------------------------

%------------------------------------------------------------------------
% Sharad J. Shanbhag
% sshanbhag@neomed.edu
%------------------------------------------------------------------------
% Created: ?????? long long ago... (SJS)
%
% Revisions:
%	29 Aug 2012 (SJS): updated documentation
%------------------------------------------------------------------------

if nargin ~= 2
	error('must provide default value');
end

% set the output string that queries the user

cflag = 0;
if ischar(default)
	outtxt = sprintf('%s (%s)? ', msgtxt, default);
	cflag = 1;
elseif length(default) == 1
	outtxt = sprintf('%s (%.4f)? ', msgtxt, default);
else
	outtxt = sprintf('%s [%.4f - %.4f](%.4f)? ', msgtxt, default(1), default(2), default(3));
end

	
inval = [];
while length(inval) == 0
	if cflag
		inval = input(outtxt, 's');	% read string from user
	else
		inval = input(outtxt);	% read value from user
	end
	
	if length(inval) ~= 0	% if entered a value
		if (~cflag) & (length(default) == 3)	% if default is a numerical range
			if ~between(inval, default(1), default(2))	% then check to see if it's in range
				disp('value out of range');
				inval = [];
			else
				outval = inval;
			end
		else
			outval = inval;
		end
	else	% if user didn't enter a value
		if (~cflag) & (length(default) == 3)	% if default is a numerical range
				inval = default(3);
				outval = default(3);
		else
			inval = default;
			outval = default;
		end		
	end
end



