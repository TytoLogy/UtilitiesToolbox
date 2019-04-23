function outval = query_user(msgtxt, default)
%------------------------------------------------------------------------
%outval = query_user(msgtxt, default)
%------------------------------------------------------------------------
% Utilities Toolbox
%------------------------------------------------------------------------
%	prints message msgtxt and returns 0 or 1
%	default is 0 or 1
%------------------------------------------------------------------------
% Input Arguments:
% 	msgtxt	question string
%	default	default value
% 
% Output Arguments:
% 	outval	1 if yes, 0 if no
%
%------------------------------------------------------------------------
% See also: query_userint
%------------------------------------------------------------------------

%------------------------------------------------------------------------
% Sharad J. Shanbhag
% sshanbhag@neomed.edu
%------------------------------------------------------------------------
% Created: ???????
%
% Revisions:
%	23 Apr 2019 (SJS): some housekeeping
%------------------------------------------------------------------------

if nargin == 0
	msgtxt = '  ';
end

if nargin == 2
	if default == 1
		defchar = 'y';
	else
		defchar = 'n';
	end;
	outtxt = sprintf('%s (y/n)(%s)? ', msgtxt, defchar);
else		
	outtxt = sprintf('%s (y/n)? ', msgtxt);
end

inval = [];

while length(inval) == 0 %#ok<ISMT>

	inval = input(outtxt, 's');
	if strcmpi(inval, 'y')
		outval = 1;
	elseif strcmpi(inval, 'n')
		outval = 0;
	elseif nargin == 2 && isempty(inval)
		outval = default;
		inval = default;
	else
		disp('Please input y or n');
		inval = [];
	end
end



