function show_uictrl(handle)
%------------------------------------------------------------------------
% show_uictrl(handle)
%------------------------------------------------------------------------
% UIUtilitiesToolbox
%------------------------------------------------------------------------
% 
% makes visible, enables and turns on hit test for
% uicontrol object, handle
% 
% sets Enable property of uicontrol object handle to on, 
%   sets Visible to 'on', and sets HitTest to 'on'
% 
%------------------------------------------------------------------------
% Input Arguments:
% 	handle	ui control handle
%
%------------------------------------------------------------------------
% See also: hide_uictrl, enable_ui, disable_ui, UIutilities Toolbox
%------------------------------------------------------------------------

%------------------------------------------------------------------------
% Sharad Shanbhag
% sshanbhag@neomed.edu
%------------------------------------------------------------------------
% Created: 6 October. 2009
%
% Revisions:
%	16 Jul 2012 (SJS): 
%	 -	minor updates to comments
%	 -	updated email address
%	 -	moved HitTest setting to enable_ui
%	18 Jul 2012 (SJS)
%	 - enabled handling of a list of handles
%------------------------------------------------------------------------

for n = 1:numel(handle)

	% enable the UI control
	enable_ui(handle(n))
	% make it visible
	set_ui_vis(handle(n), 'on');
end

