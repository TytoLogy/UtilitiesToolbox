function update_ui_str(handle, str)
%function update_ui_str(handle, str)
%
%	sets the UI control string to the value of str.
%	str can be a numeric value or a character string.
%
%	See Also: UPDATE_UI_VAL, READ_UI_VAL, READ_UI_STR
%
% Sharad J. Shanbhag
% sharad@etho.caltech.edu

if ischar(str)
	set(handle, 'String', str);
elseif isnumeric(str)
	set(handle, 'String', num2str(str));
else
	set(handle, 'String', '---');
end
