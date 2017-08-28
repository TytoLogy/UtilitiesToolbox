function data = read_tabular_data(varargin)
%------------------------------------------------------------------------
% data = read_tabular_data(csvfile)
%------------------------------------------------------------------------
% 
% Reads in data from csv file with text header rows.
% Returns data in table form
% 
%------------------------------------------------------------------------
% Input Arguments:
% 	csvfile		path/filename of .csv file (optional)
% 					If not provided, user will be queried to provide file
% 					name and location
% 
% Output Arguments:
% 	data			data in table form
%
%------------------------------------------------------------------------
% See also: readtable, table data type
%------------------------------------------------------------------------

%------------------------------------------------------------------------
% Sharad J. Shanbhag
% sshanbhag@neomed.edu
%------------------------------------------------------------------------
% Created: 8 August 2017 (SJS)
%
% Revisions:
%------------------------------------------------------------------------
if isempty(varargin)
	[fname, fpath] = uigetfile('*.csv', 'Select csv data file');
	if fname == 0
		data = [];
		return
	end
	[fpath, fname, fext] = fileparts(fullfile(fpath, fname));
else
	[fpath, fname, fext] = fileparts(varargin{1});
	if ~isempty(fext)
		if ~strcmpi(fext, '.csv')
			warning('%s is not an obvious .csv file', fname);
		end
	else
		fext = '.csv';
	end
end

data = readtable(fullfile(fpath, [fname fext]), 'ReadRowNames', true);
