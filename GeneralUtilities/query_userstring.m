function outstr = query_userstring(msgtxt, default)
%-------------------------------------------------------------------------
% outstr = query_userstring(msgtxt, default)
%-------------------------------------------------------------------------
% 
%	prints message msgtxt and returns outstr
%	
%	default is default string (optional)
%-------------------------------------------------------------------------

%-------------------------------------------------------------------------
% Sharad Shanbhag
% sjshanbhag@gmail.com
%-------------------------------------------------------------------------
% Created: 23 March 2010 (SJS) from query_uservar
%
% Revisions:
%
%-------------------------------------------------------------------------

if nargin ~= 2
	default = '';
elseif isnumeric(default)
	default = num2str(default);
end

% set the output string that queries the user
if isempty(default)
	outtxt = sprintf('%s: ', msgtxt);
else
	outtxt = sprintf('%s (default = %s)? ', msgtxt, default);
end

	
inval = [];
while length(inval) == 0
	inval = input(outtxt, 's');	% read string from user
	
	if length(inval) ~= 0	% if entered a value
		outstr = inval;
	else	% if user didn't enter a value, return default
		inval = default;
		outstr = default;
	end
end



