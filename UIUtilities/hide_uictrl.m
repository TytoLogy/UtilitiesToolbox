function hide_uictrl(handle)
% hide_uictrl(handle)
% 
% hides, disables turns off hit test for uicontrol object, handle
% 
% sets Enable property of uicontrol object handle to off, 
%   sets Visible to 'off', and sets HitTest to 'off'
% 
% Input Arguments:
% 	handle	ui control handle
%
% See also: disable_ui, UIutilities Toolbox
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%------------------------------------------------------------------------
%  Sharad Shanbhag
%	sshanbha@aecom.yu.edu
%------------------------------------------------------------------------
% Created: 6 October, 2009
%
% Revisions:
%------------------------------------------------------------------------

% disable the UI control
disable_ui(handle)

% make it invisible
set_ui_vis(handle, 'off');

% turn off hit test
set(handle, 'HitTest', 'off');

