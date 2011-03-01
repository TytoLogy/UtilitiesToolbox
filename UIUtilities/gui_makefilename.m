function filename = gui_makefilename(action, settings_exp, varargin)
%FUNCTION FILENAME = GUI_MAKEFILENAME(ACTION, SETTINGS_EXP, VARARGIN)
%
%	action: 'data' | 'analog' | 'map'
%	settings_exp: experiment settings structure
%	varargin: cell of string arrays to append to filename
%
% Sharad Shanbhag
% sharad@etho.caltech.edu

% general structure of the data file name is
%
% animal_day-month-year_unit_{varargin strings}.mxf
%
% for analog data:
%
% animal_day-month-year_unit_{varargin strings}_ana.mxf

file_ext = '.mxf';
action = lower(action);

filename = sprintf('%s_%s_%d', settings_exp.owl, date, settings_exp.unit);

if length(varargin)
	for i = 1:length(varargin)
		filename = sprintf('%s_%s', filename, varargin{i})
	end
end

if strcmp(action, 'data')
	filename = sprintf('%s.mxf', filename);
elseif strcmp(action, 'analog')
	filename = sprintf('%s_ana.mxf', filename);
elseif strcmp(action, 'map')
	filename = sprintf('%s_map.mxf', filename);
else
	filename = sprintf('%s.mxf', filename);
end
