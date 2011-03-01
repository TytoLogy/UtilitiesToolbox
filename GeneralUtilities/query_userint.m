function outval = query_userint(msgtxt, default)
%------------------------------------------------------------------------
%outval = query_userint(msgtxt, default)
%------------------------------------------------------------------------
% Utilities Toolbox
%------------------------------------------------------------------------
%	prints message msgtxt and returns outval
%	
%------------------------------------------------------------------------
% Input Arguments:
% 	msgtxt	question string
%	default	default value
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
% 
% Output Arguments:
% 	outval	1 if yes, 0 if no
%
%------------------------------------------------------------------------
% See also: query_user
%------------------------------------------------------------------------

%------------------------------------------------------------------------
% Sharad J. Shanbhag
% sharad.shanbhag@einstein.yu.edu
%------------------------------------------------------------------------
% Created: ???????
%
% Revisions:
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
	outtxt = sprintf('%s (%d)? ', msgtxt, default);
else
	outtxt = sprintf('%s [%d - %d](%d)? ', msgtxt, default(1), default(2), default(3));
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



