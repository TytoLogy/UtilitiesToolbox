function out = read_ui_str(handle, str)
%--------------------------------------------------------------------------
% read_ui_str(handle, str)
%--------------------------------------------------------------------------
% UIUtilities Toolbox
%--------------------------------------------------------------------------
%	Reads the UI control string value
%
%	if 'str' is set to 'n', string is converted to a number before being
%	returned.
%--------------------------------------------------------------------------
% Input Arguments:
% 		handle	handle to ui object
% 		str		'n' returns a number
% 					default returns string
% Output Arguments:
%		out		string or numerical array
%
%--------------------------------------------------------------------------
%	See Also: UPDATE_UI_STR, UPDATE_UI_VAL, READ_UI_VAL
%--------------------------------------------------------------------------

%------------------------------------------------------------------------
% Sharad Shanbhag
% sshanbhag@neomed.edu
%------------------------------------------------------------------------
% Created: long long ago
%
% Modified:
%	11 Mar 2012 (SJS): updated documentation
%------------------------------------------------------------------------

out = get(handle, 'String');

if nargin == 2
	if str == 'n' %number
		out = str2double(out);
	end
end