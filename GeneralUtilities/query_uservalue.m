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
%			2) a range of values [low high]
% 					OR
% 				a range of values and default value [low high default]
%			3) a string
%
%	if default is a range of values [low high], query_userint will require
%	the input value to be in the range low <= input value < high without
%	assuming a default
%
%	if default is a range and a value [low high default], query_userint 
%	will require the input value to be in the range low <= input value < high
%	but assign the default value 
%------------------------------------------------------------------------

%------------------------------------------------------------------------
% Sharad J. Shanbhag
% sshanbhag@neomed.edu
%------------------------------------------------------------------------
% Created: ?????? long long ago... (SJS)
%
% Revisions:
%	29 Aug 2012 (SJS): updated documentation
%	12 May 2018 (SJS): modified default to simple accept a range
%------------------------------------------------------------------------

if nargin ~= 2
	error('must provide default value');
end

% set the output string that queries the user
% cflag will be 1 if input is expected to be a character, 0 for number
cflag = 0;
if ischar(default)
	outtxt = sprintf('%s (%s)? ', msgtxt, default);
	cflag = 1;
elseif length(default) == 1
	outtxt = sprintf('%s (%.4f)? ', msgtxt, default);
elseif length(default) == 2
	outtxt = sprintf('%s [%.4f - %.4f]? ', msgtxt, default(1), default(2));
elseif length(default) == 3
	outtxt = sprintf('%s [%.4f - %.4f](%.4f)? ', msgtxt, default(1), default(2), default(3));
end

% if character, then simple process...
if cflag
	inval = [];
	while length(inval) == 0 %#ok<ISMT>
		inval = input(outtxt, 's');	% read string from user
	end
	return

% otherwise, need to do more elaborate checks
else
	inval = [];
	
	while length(inval) == 0 %#ok<ISMT>
		inval = input(outtxt);	% read value from user

		% check if user entered a value
		if length(inval) ~= 0	%#ok<ISMT> 
			% if default is a numerical range (with or without default value)
			% then check to see if user entered value within range
			if length(default) > 1
				if ~between(inval, default(1), default(2))	
					disp('value out of range');
					inval = [];
				% valid value given, so store it
				else
					outval = inval;
				end
			else
				outval = inval;
			end
		else	% if user didn't enter a value
			if length(default) == 3	% if default value was given, use it
				% set inval to default so that we exit this loop
				inval = default(3);
				% set outval to default
				outval = default(3);
			elseif length(default) == 1
				% if default value was given as single value, use it
				% set inval to default so that we exit this loop
				inval = default(1);
				% set outval to default
				outval = default(1);				
			else
				% otherwise need to re-do
				disp('please enter a value!')
				inval = [];
				outval = [];
			end		
		end
	end

end


