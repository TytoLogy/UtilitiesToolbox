function outval = query_int(msgtxt, range)
%outval = query_int(msgtxt, range)
%	prints message msgtxt and returns outval
%	
%	range:
%		a range of values [low high]
%
%	if range is a range of values, query_userint will require the input
%	value to be in the range(1) <= input value < range(2)
%

if nargin ~= 2
	range = [];
end

% set the output string that queries the user
if ~isempty(range)
	cflag = 0;
	if ischar(range)
		outtxt = sprintf('%s (%s)? ', msgtxt, range);
		cflag = 1;
	elseif length(range) == 1
		outtxt = sprintf('%s (%d)? ', msgtxt, range);
	else
		outtxt = sprintf('%s [%d - %d]? ', msgtxt, range(1), range(2));
	end
else
	outtxt = sprintf('%s ? ', msgtxt);
	cflag = 0;
end
	
inval = [];
while length(inval) == 0
	if cflag
		inval = input(outtxt, 's');	% read string from user
	else
		inval = input(outtxt);	% read value from user
	end
	
	if length(inval) ~= 0	% if entered a value
		if (~cflag) & (length(range) == 2)	% if range is a numerical range
			if ~between(inval, range(1), range(2))	% then check to see if it's in range
				disp('value out of range');
				inval = [];
			else
				outval = inval;
			end
		else
			outval = inval;
		end
	else	
		disp('Please re-enter value...');
	end
end



