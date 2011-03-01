function disable_ui(handle)
%------------------------------------------------------------------------
% disable_ui(handle)
%------------------------------------------------------------------------
% 
% sets Enable property of uicontrol object handle to off
% 
%------------------------------------------------------------------------
% Input Arguments:
% 	handle	ui control handle
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
set(handle, 'Enable', 'off');
