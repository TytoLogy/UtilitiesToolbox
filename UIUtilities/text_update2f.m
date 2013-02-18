function val = text_update2f(textObj, sliderObj, lim, varargin)
% val = text_update(sliderObj, textObj, varargin)
%	
%	takes string from UI object text, checks to see if it is in range, then
%	changes slider position to new value if so, or reverts string to slider
%	value, returns new (or old) value in the string

%	Sharad Shanbhag
%	sshanbha@aecom.yu.edu

	tmp = read_ui_str(textObj, 'n');	
	if checklim(tmp, lim)
		val = tmp;
	else
		disp([get(sliderObj, 'Tag') ' out of range']);
		val = read_ui_val(sliderObj);
	end
	
	if length(varargin)
		update_ui_str(textObj, sprintf(varargin{1}, val));
	else
		update_ui_str(textObj, sprintf('%.2f', val));
	end
	
	update_ui_val(sliderObj, val);

	
	
	
	