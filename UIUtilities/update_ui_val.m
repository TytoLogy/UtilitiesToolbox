function update_ui_val(handle, val)
%function update_ui_val(handle, val)
%
%	Sets the value of the UI control handle to val
%
%	See Also: UPDATE_UI_STR, READ_UI_STR, READ_UI_VAL

% Sharad J. Shanbhag
% sshanbha@aecom.yu.edu


set(handle, 'Value', val);
