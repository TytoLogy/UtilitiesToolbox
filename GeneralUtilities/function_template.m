function Output = function_template(Input)
%-------------------------------------------------------------------------
% Output = function_template(Input)
%-------------------------------------------------------------------------
% 
% Description
% 
%-------------------------------------------------------------------------
% Input Arguments:
% 	Input		input info
% 
% Output Arguments:
% 	Output	output info
%
%-------------------------------------------------------------------------
% See also: 
%-------------------------------------------------------------------------

%-------------------------------------------------------------------------
% Sharad J. Shanbhag
% sshanbhag@neomed.edu
%-------------------------------------------------------------------------
% Created: XX XXXX, 2013 (SJS)
%
% Revisions:
%-------------------------------------------------------------------------
% TO DO:
%-------------------------------------------------------------------------


%-------------------------------------------------------------------------
%-------------------------------------------------------------------------
% check inputs
%-------------------------------------------------------------------------
%-------------------------------------------------------------------------
% set default values
fprintf('%s: using default values\n', mfilename);
set_defaults;

if ~isempty(varargin)
	argn = 1;
	while argn <= length(varargin)
		switch upper(varargin{argn})
			case 'DEFAULT'
				break;
			case 'CATEGORIES'
				Ncategories = varargin{argn+1};
				argn = argn + 2;
			case 'REPS'
				Nreps = varargin{argn+1};
				argn = argn + 2;
			case 'NSPIKES'
				Nspikes = varargin{argn+1};
				argn = argn + 2;
			case 'TOFFSET'
				Toffset = varargin{argn+1};
				argn = argn + 2;
			otherwise
				error('%s: unknown option %s', mfilename, varargin{argn};
		end	% END switch(varargin)
	end	% END while argn
end	% END if

%-------------------------------------------------------------------------
%-------------------------------------------------------------------------
% do stuff
%-------------------------------------------------------------------------
%-------------------------------------------------------------------------

%-------------------------------------------------------------------------
%-------------------------------------------------------------------------
end
%-------------------------------------------------------------------------
%-------------------------------------------------------------------------


%-------------------------------------------------------------------------
%-------------------------------------------------------------------------
function set_defaults
	evalin('caller', 'Ncategories = 3;');
	evalin('caller', 'Nreps = 5;');
	evalin('caller', 'Nspikes = [5 5 5];');
	evalin('caller', 'Toffset = [.01 .02 .03];');
end
