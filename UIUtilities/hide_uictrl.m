function hide_uictrl(handle)
%------------------------------------------------------------------------
% hide_uictrl(handle)
%------------------------------------------------------------------------
% UIUtilitiesToolbox
%------------------------------------------------------------------------
% hides, disables turns off hit test for uicontrol object, handle
% 
% sets Enable property of uicontrol object handle to off, 
%   sets Visible to 'off', and sets HitTest to 'off'
% 
%------------------------------------------------------------------------
% Input Arguments:
% 	handle	ui control handle
%
%------------------------------------------------------------------------
% See also: show_uictrl, enable_ui, disable_ui, UIutilities Toolbox
%------------------------------------------------------------------------

%------------------------------------------------------------------------
% Sharad Shanbhag
% sshanbhag@neomed.edu
%------------------------------------------------------------------------
% Created: 6 October, 2009
%
% Revisions:
%	16 Jul 2012 (SJS):
%	 -	minor updates to comments
%	 -	updated email address
%	 -	moved HitTest setting to disable_ui
%	18 Jul 2012 (SJS)
%	 - enabled handling of a list of handles
%------------------------------------------------------------------------

for n = 1:numel(handle)
	% disable the UI control
	disable_ui(handle(n))
	% make it invisible
	set_ui_vis(handle(n), 'off');
end
