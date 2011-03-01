function [fighandle, cancelButton, pauseButton] = cancelpausepanel
%--------------------------------------------------------------------------
% [fighandle, cancelButton, pauseButton] = cancelpausepanel
%--------------------------------------------------------------------------
% UIutilities Toolbox
%--------------------------------------------------------------------------
% Program to create a uipanel with cancel and pause toggle buttions
%
%--------------------------------------------------------------------------
% Input Arguments:
%	None.
% 
% Output Arguments:
% 	fighandle		handle to panel figure window
% 	cancelButton	handle to cancel button
% 	pauseButton		handle to pause toggle button
%
%--------------------------------------------------------------------------
% See Also: HPCurve_playCache, HPSearch
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
% Sharad J. Shanbhag
% sharad.shanbhag@einstein.yu.edu
%--------------------------------------------------------------------------
% Created: 3 August 09 (SJS)
% 
% Revision History:
%	13 March, 2010 (SJS)
% 		- updated documentation
% 		- modified size and location
% 		- added font weight and size		
%--------------------------------------------------------------------------

xPos = 300;
yPos = 400;
width = 125;
height = 45;
fontSize = 10;
fontWeight = 'bold';

cancelbuttonpos = [5 5 55 35];
pausebuttonpos = [65 5 55 35];

fighandle = figure;
s = get(fighandle, 'Position');

set(fighandle,	'Position', [xPos yPos width height], ...
					'MenuBar', 'none', ...
					'NumberTitle', 'off', ...
					'Resize', 'off');


cancelButton= uicontrol(	'Style',		'togglebutton', ...
									'String',	'STOP', ...
									'Position', cancelbuttonpos, ...
									'ForegroundColor', [1 0 0], ...
									'FontSize', fontSize, ...
									'FontWeight', fontWeight);

pauseButton = uicontrol(	'Style',		'togglebutton', ...
									'String',	'Pause', ...
									'Position', pausebuttonpos, ... 
									'ForegroundColor', [0 .8 0], ...
									'FontSize', fontSize, ...
									'FontWeight', fontWeight);

drawnow


