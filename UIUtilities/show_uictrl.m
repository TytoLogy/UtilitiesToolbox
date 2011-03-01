function show_uictrl(handle)
% show_uictrl(handle)
% 
% makes visible, enables and turns on hit test for
% uicontrol object, handle
% 
% sets Enable property of uicontrol object handle to on, 
%   sets Visible to 'on', and sets HitTest to 'on'
% 
% Input Arguments:
% 	handle	ui control handle
%
% See also: hide_uictrl, UIutilities Toolbox
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%------------------------------------------------------------------------
%  Sharad Shanbhag
%	sshanbha@aecom.yu.edu
%------------------------------------------------------------------------
% Created: 6 October. 2009
%
% Revisions:
%------------------------------------------------------------------------

% enable the UI control
enable_ui(handle)

% make it visible
set_ui_vis(handle, 'on');

% turn on hit test
set(handle, 'HitTest', 'on');

