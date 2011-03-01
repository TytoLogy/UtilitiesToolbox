function out = read_ui_str(handle, str)
%function read_ui_str(handle, str)
%
%	Reads the UI control string
%	if 'str' is set to 'n', string is converted to a number before being
%	returned.
%
%	See Also: UPDATE_UI_STR, UPDATE_UI_VAL, READ_UI_VAL
%
% Sharad J. Shanbhag
% sharad@etho.caltech.edu

out = get(handle, 'String');

if nargin == 2
	if str == 'n' %number
		out = str2double(out);
	end
end