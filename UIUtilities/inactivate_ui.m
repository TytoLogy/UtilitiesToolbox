function inactivate_ui(handle)
%------------------------------------------------------------------------
% inactivate_ui(handle)
%------------------------------------------------------------------------
% TytoLogy:UtilitiesToolbox:UIUtilities
%------------------------------------------------------------------------
% 
% sets Enable property of uicontrol object handle to inactive
% 
%------------------------------------------------------------------------
% Input Arguments:
% 	handle	ui control handle
%
%------------------------------------------------------------------------
% See also: disable_ui, enable_ui, UIutilities Toolbox
%------------------------------------------------------------------------

%------------------------------------------------------------------------
%  Go Ashida and Sharad Shanbhag
%	ashida@umd.edu
%	sshanbhag@neomed.edu
%------------------------------------------------------------------------
% Created: 20 Feb 2012 (GA)
%
% Revisions:
%	3 May 2016 (SJS): added to TytoLogy:UIutilities toolbox
%------------------------------------------------------------------------

% set Enable to 'inactive'
set(handle, 'Enable', 'inactive');
