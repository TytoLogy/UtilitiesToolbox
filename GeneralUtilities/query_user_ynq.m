function outval = query_user_ynq(msgtxt, default)
%------------------------------------------------------------------------
% outval = query_user_ynq(msgtxt, default)
%------------------------------------------------------------------------
% Utilities Toolbox
%------------------------------------------------------------------------
%	prints message msgtxt and returns 'y', 'n' or 'q'
%	specify default as y n or q 
%------------------------------------------------------------------------
% Input Arguments:
% 	msgtxt	question string
%	default	default value
% 
% Output Arguments:
% 	outval	1 if yes, 0 if no, -1 if quit
%
%------------------------------------------------------------------------
% See also: query_user
%------------------------------------------------------------------------

%------------------------------------------------------------------------
% Sharad J. Shanbhag
% sshanbhag@neomed.edu
%------------------------------------------------------------------------
% Created: 5 October 2020 from query_user
%
% Revisions:
%------------------------------------------------------------------------

% define some things
valid_chars = 'ynq';

%------------------------------------------------------------------------
% process inputs
%------------------------------------------------------------------------
% set msgtxt to empty and default value to 'y' if no inputs
if nargin == 0
	msgtxt = '  ';
	defchar = 'y';
	defval = 1;
end

% check if default was provided
if nargin == 2
	% length must be 1
	if length(default) ~= 1
		error('%s: default must be either ''y'', ''n'', or ''q''', mfilename);
	% and must be either y, n , q
	elseif ~any(default == valid_chars)
		error('%s: default must be either ''y'', ''n'', or ''q''', mfilename);
	else
		defchar = default;
		switch defchar
			case 'y'
				defval = 1;
			case 'n'
				defval = 0;
			case 'q'
				defval = -1;
		end
	end
	% set output string
	outtxt = sprintf('%s (y/n/q)(%s)? ', msgtxt, defchar);
else
	outtxt = sprintf('%s (y/n/q)? ', msgtxt);
end

% initialize input val 
inval = [];

% loop 
while length(inval) == 0 %#ok<ISMT>
	% ask question (get string)
	inval = input(outtxt, 's');
	% process answer
	if strcmpi(inval, 'y')
		% output is 1 if answer was 'y'
		outval = 1;
	elseif strcmpi(inval, 'n')
		% output is 0 if answer was 'n'
		outval = 0;
	elseif strcmpi(inval, 'q')
		% output is -1 if answer was 'q'
		outval = -1;
	% no answer, and default was provided, use default value
	elseif nargin == 2 && isempty(inval)
		outval = defval;
		inval = defchar;
	else
		% alert user, reset inval
		beep
		disp(['Invalid answer: ' inval]);
		disp('Please input y, n or q');
		inval = [];
	end
end



