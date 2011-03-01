function val = slider_limits(sliderObj, limits)
%------------------------------------------------------------------------
% val = slider_limits(sliderObj, limits)
%------------------------------------------------------------------------
% 
%	sets limits of slider using limits [2X1]
% 
%	returns value of sliderObj in val
% 
%------------------------------------------------------------------------
% Input Arguments:
% 	sliderObj	ui control handle for a slider object
% 	limits		2X1 vector of limits for slider [MIN MAX]
%
% Output Arguments;
% 	val	current value of slider
% 
%------------------------------------------------------------------------
% See also: enable_ui, UIutilities Toolbox
%------------------------------------------------------------------------

%------------------------------------------------------------------------
%  Sharad Shanbhag
%	sharad.shanbahg@einstein.yu.edu
%------------------------------------------------------------------------
% Created: 15 October, 2009(SJS)
%
% Revisions:
%------------------------------------------------------------------------

if ~strcmp(get(sliderObj, 'Style'), 'slider')
	warning([mfilename ': object ' inputname(1) ' is not a slider object'])
	val = [];
	return;
end

if limits(2) <= limits(1)
	warning([mfilename ': invalid limits values'])
	val = [];
	return;
end

% check to see if current slider value is within limits
val = read_ui_val(sliderObj);		
if ~between(val, limits(1), limits(2))
	disp([mfilename ': slider ' inputname(1) ' value will be set inside limits'])
	update_ui_val(sliderObj, limits(1));
	val = read_ui_val(sliderObj);
end

set(sliderObj, 'Min', limits(1));
set(sliderObj, 'Max', limits(2));
