function outval = update_checkbox(handle, inval)
%------------------------------------------------------------------------
% outval = update_checkbox(handle, inval)
%------------------------------------------------------------------------
%	Given UI checkbox control handle, changes font to bold if checked, 
% 	or to normal if unchecked.
% 	returns the UI control value
% 	if inval is provided (0, 1), updates checkbox value
%------------------------------------------------------------------------
% Input Arguments:
% 	handles		UI interface control handle object
% 	
% 		Optional:
% 			inval	input value (0 or 1)
% 
% Output Arguments:
% 	outval	UI control value
%
%------------------------------------------------------------------------
%	See Also: UPDATE_UI_STR, UPDATE_UI_VAL, READ_UI_STR
%------------------------------------------------------------------------
%	UIutilities toolbox
%------------------------------------------------------------------------

%------------------------------------------------------------------------
%  Sharad J. Shanbhag
%	sharad.shanbhag@einstein.yu.edu
%------------------------------------------------------------------------
% Created: 5 November, 2009 (SJS)
%
% Revisions:
%------------------------------------------------------------------------

if exist('inval', 'var')
	if isnumeric(inval)
		inval = logical(inval(1));
		outval = update_ui_val(handle, inval);
	end
else
	outval = read_ui_val(handle);
end

if outval
	set(handle, 'FontWeight', 'bold')
else
	set(handle, 'FontWeight', 'normal')
end
