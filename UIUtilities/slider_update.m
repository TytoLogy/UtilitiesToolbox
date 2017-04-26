function val = slider_update(sliderObj, textObj, varargin)
%------------------------------------------------------------------------
% val = slider_update(sliderObj, textObj, varargin)
%------------------------------------------------------------------------
% 
%	takes value val from UI object sliderObj, writes value
%	to string in UI object textObj, in optional format string
%	in varargin.  default format is '%d'
% 
%	returns value of sliderObj in val
% 
%------------------------------------------------------------------------
% Input Arguments:
% 	sliderObj	ui control handle for a slider object
% 	textObj		ui control handle for a text object
%	varargin		sprintf format string for text in textObj
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
%	15 October, 2009:	added help + documentation
%------------------------------------------------------------------------


if ~strcmp(get(sliderObj, 'Style'), 'slider')
	warning([mfilename ': object ' inputname(1) ' is not a slider object'])
	val = [];
	return;
end

if ~(strcmp(get(textObj, 'Style'), 'edit') || strcmp(get(textObj, 'Style'), 'text'))
	warning([mfilename ': object ' inputname(2) ' is not an edit or text object'])
	val = [];
	return;
end

val = read_ui_val(sliderObj);
if isempty(varargin)
	update_ui_str(textObj, sprintf('%.0f', val));
else
	update_ui_str(textObj, sprintf(varargin{1}, val));
end
	

