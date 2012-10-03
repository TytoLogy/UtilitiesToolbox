function outval = query_userarray(msgtxt, default, inputrange)
%------------------------------------------------------------------------
% outval = query_userarray(msgtxt, default, inputrange)
%------------------------------------------------------------------------
% UtilitiesToolbox -> GeneralUtilities
%------------------------------------------------------------------------
%	prints message msgtxt and returns outval
%	
%	default:
%		can take 3 forms
%			1) a single numerical value 
%			2) an array of numbers
%			3) a string
%
%	inputrange is optional, and applies only to numeric inputs.  
% 	it is a 1X2 vector of form [minvalue maxvalue]
%
%	if a string input is desired, a default string must be provided!
%
%
%	if default is a inputrange of values, query_userarray will require the input
%	values to be in the inputrange default(1) <= input value < default(2)
%
%------------------------------------------------------------------------

%------------------------------------------------------------------------
% Sharad J. Shanbhag
% sshanbhag@neomed.edu
%------------------------------------------------------------------------
% Created: 3 October, 2012 from query_uservalue (SJS)
%
% Revisions:
%------------------------------------------------------------------------

if nargin == 1
	default = [];
	inputrange = [];
elseif nargin == 2
	inputrange = [];
end

% set the output string that queries the user
cflag = 0;
if ischar(default)
	outtxt = sprintf('%s (%s)', msgtxt, default);
	cflag = 1;
elseif ~isempty(default)
	defstr = sprintf('%.2f ', default);
	outtxt = sprintf('%s (%s)', msgtxt, default);
else
	outtxt = msgtxt;
end

if ~isempty(inputrange)
	outtxt = sprintf('%s [%.4f - %.4f]? ', outtxt, inputrange(1), inputrange(2));
else
	outtxt = sprintf('%s? ', outtxt);
end

inval = [];
while length(inval) == 0
	inval = input(outtxt, 's');	% read string from user
	
	if ~cflag
 		inval = str2num(inval);
 	end
	
	if length(inval) ~= 0
		% if entered a value
		if ~isempty(inputrange)
			% if input range check was asked for
			% then check to see if it's in range
			if ~all(between(inval, inputrange(1), inputrange(2)))	
				disp('value out of range');
				inval = [];
			else
				outval = inval;
			end
		else
			outval = inval;
		end
	else
		% if user didn't enter a value but a default was given
		if ~isempty(default) 
			inval = default;
			outval = default;
		else
			% spank user
			fprintf('Bad user! you must enter a value!\nTry Again, please\n\n');
			inval = [];
		end		
	end
end



