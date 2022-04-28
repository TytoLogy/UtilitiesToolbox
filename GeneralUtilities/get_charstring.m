function str = get_charstring(inVal, stringChar)
% given input string inVal or integer inVal, return a string with
% either length(inVal) if inVal is a string or length == inVal if inVal is
% and integer. each element of this string will be stringChar
%
% Example:
%
% >> s = get_charstring('aString', '&')
% s =
%     '&&&&&&&'

if ischar(inVal)
	strlen = length(inVal);
elseif isnumeric(inVal)
	strlen = inVal;
elseif isempty(inVal)
	str = '';
	return
else
	error('%s: unknown input type %s', mfilename, class(inVal));
end

str = repmat(stringChar, 1, strlen); 