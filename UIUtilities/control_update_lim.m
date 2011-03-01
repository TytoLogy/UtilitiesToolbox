function val = control_update_lim(textObj, sliderObj, newvalue, lim, varargin)
% val = control_update(textObj, sliderObj, newvalue, lim, varargin)
%
%	takes newvalue, checks to see if it is in range, then
%	changes slider position to new value if so, or reverts string to slider
%	value, returns new (or old) value in the string

%	Sharad Shanbhag
%	sshanbha@aecom.yu.edu

	if checklim(newvalue, lim)
		val = newvalue;
		if length(varargin)
			update_ui_str(textObj, sprintf(varargin{1}, val));
		else
			update_ui_str(textObj, sprintf('%.0f', val));
		end

		update_ui_val(sliderObj, val);
	else
		disp(['newvalue for ' get(sliderObj, 'Tag') ' out of range']);
		val = read_ui_val(sliderObj);
	end
	
	
	
	
	