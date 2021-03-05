function y = round_up_integer(x, iVal)
% y = round_up_integer(x, iVal)
% rounds up to nearest multiple of iVal

% force iVal to integer
if iVal < 1
	warning([mfilename ': iVal must be integer >= 1. Forcing to 1']);
	iVal = 1;
end
% Round x up to the nearest multiple of p.
y = iVal * round(ceil(x / iVal));