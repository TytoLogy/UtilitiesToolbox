function [fighandle, stopbutton] = stoppanel
%--------------------------------------------------------------------------
% [fighandle, stopbutton] = stoppanel
%--------------------------------------------------------------------------
% UIutilities Toolbox
%--------------------------------------------------------------------------
% 
% Program to create a uipanel with stop toggle buttions
%
%--------------------------------------------------------------------------
% Input Arguments:
%	none
% 
% Output Arguments:
% 	fighandle		handle to panel figure window
% 	cancelButton	handle to cancel button
% 	pauseButton		handle to pause toggle button
%--------------------------------------------------------------------------
% See Also: cancelpausepanel
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
% Sharad J. Shanbhag
% 
% sharad.shanbhag@einstein.yu.edu
%--------------------------------------------------------------------------
% Revision History
%	24 November 09 (SJS): Created 
%--------------------------------------------------------------------------

fighandle = figure;
s = get(fighandle, 'Position');

set(fighandle,	'Position', [200 600 110 45], ...
					'MenuBar', 'none', ...
					'NumberTitle', 'off', ...
					'Resize', 'off');


stopbutton = uicontrol(		'Style',		'togglebutton', ...
									'String',	'STOP', ...
									'Position', [5 5 100 35], ...
									'ForegroundColor', [1 0 0]);
								
set(stopbutton, 'Callback', @stoppanel_buttonpress);

drawnow
%--------------------------------------------------------------------------


%--------------------------------------------------------------------------
function stoppanel_buttonpress(src, eventdata)
	if read_ui_val(src)
		update_ui_str(src, 'Stopping...');
		set(src, 'ForegroundColor', [0.5 1 0.5]);
	else
		update_ui_str(src, 'STOP');
		set(src, 'ForegroundColor', [1 0 0]);
	end
%--------------------------------------------------------------------------
 
		
	


