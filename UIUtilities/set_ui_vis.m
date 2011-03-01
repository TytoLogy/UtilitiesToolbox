function set_ui_vis(handle, val)
%------------------------------------------------------------------------
% set_ui_vis(handle,  val))
%------------------------------------------------------------------------
% 
% if val = 1 or 'on', makes ui control object handle visible
% if val = 0 or 'off', hides ui control
% 
%------------------------------------------------------------------------
% Input Arguments:
% 	handle	ui control handle
%	val		0/1 or 'on'/'off'
% 
%------------------------------------------------------------------------
% See also: enable_ui, UIutilities Toolbox
%------------------------------------------------------------------------

%------------------------------------------------------------------------
%  Sharad Shanbhag
%	sshanbha@aecom.yu.edu
%------------------------------------------------------------------------
% Created: ??? (SJS)
%
% Revisions:
%	6 October, 2009:	added help + documentation
%------------------------------------------------------------------------
if ischar(val)
	val = lower(val);
	if strcmp(val, 'on') | strcmp(val, 'off')
		set(handle, 'Visible', val);
	else
		return
	end
elseif isnumeric(val)
	if val == 0
		set(handle, 'Visible', 'off');
	else
		set(handle, 'Visible', 'on');
	end
else
	return;
end
