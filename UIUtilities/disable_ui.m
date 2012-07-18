function disable_ui(handle)
%------------------------------------------------------------------------
% disable_ui(handle)
%------------------------------------------------------------------------
% UIUtilitiesToolbox
%------------------------------------------------------------------------
% 
% sets Enable property of uicontrol object handle to 'off'
% and HitTest property to 'off'
%
% note that the UI element is still visible - use hide_uictrl to
% disable the ui control as well as hide it.
% 
%------------------------------------------------------------------------
% Input Arguments:
% 	handle	ui control handle
%
%------------------------------------------------------------------------
% See also: enable_ui, hide_uictrl, show_uictrl, UIutilities Toolbox
%------------------------------------------------------------------------

%------------------------------------------------------------------------
% Sharad Shanbhag
% sshanbhag@neomed.edu
%------------------------------------------------------------------------
% Created: ??? (SJS)
%
% Revisions:
%	6 October, 2009:	added help + documentation
%	16 Jul 2012 (SJS): 
%	 -	minor updates to comments
%	 -	updated email address
%	 -	added HitTest setting 
%	18 Jul 2012 (SJS)
%	 - enabled handling of a list of handles
%------------------------------------------------------------------------

for n = 1:numel(handle)
	% set Enable to off
	set(handle(n), 'Enable', 'off');
	% turn off hit test
	set(handle(n), 'HitTest', 'off');
end
