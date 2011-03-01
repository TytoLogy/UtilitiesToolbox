function val = read_ui_val(handle)
% val = read_ui_val(handle)
%
%	Given UI control handle, returns the UI control value
%
%
%	See Also: UPDATE_UI_STR, UPDATE_UI_VAL, READ_UI_STR
%

% Sharad J. Shanbhag
% sshanbha@aecom.yu.edu


val = get(handle, 'Value');