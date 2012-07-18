function enable_ui(handle)
%------------------------------------------------------------------------
% enable_ui(handle)
%------------------------------------------------------------------------
% UIUtilitiesToolbox
%------------------------------------------------------------------------
% sets Enable property of uicontrol object handle to 'on' and
% HitTest property to 'on'
% 
%------------------------------------------------------------------------
% Input Arguments:
% 	handle		ui control handle
%
%------------------------------------------------------------------------
% See also: disable_ui, hide_uictrl, show_uictrl, UIutilities Toolbox
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
	% set Enable to on
	set(handle(n), 'Enable', 'on');
	% turn on hit test
	set(handle(n), 'HitTest', 'on');
end
