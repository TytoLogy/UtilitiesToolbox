function odata = decimate2(idata, r)
%------------------------------------------------------------------------
% odata = decimate2(idata, r)
%------------------------------------------------------------------------
% Resample idata at a lower rate after lowpass filtering.
% 
%------------------------------------------------------------------------
% Input Arguments:
%	idata		input matrix
%	r			decimation factor (integer greater than 0)
%
% Output Arguments:
%	odata		output matrix with sample rate = input rate / r
%
%------------------------------------------------------------------------
% See also: decimate
%------------------------------------------------------------------------

%------------------------------------------------------------------------
% Sharad Shanbhag
% sharad.shanbhag@einstein.yu.edu
%------------------------------------------------------------------------
% Created: 12 August, 2008
%
% Revisions:
%	9 September, 2008 (SJS):
% 		- added documentation
% 		- added check for r < 2
%	2 March, 2010 (SJS): updated documentation
%------------------------------------------------------------------------

if r < 2
	odata = idata;
	return
else
	[rows, cols] = size(idata);

	if rows >= cols	% work along rows
		for i = 1:cols
			odata(:, i) = decimate(idata(:, i), r);
		end
	else
		for i = 1:rows
			odata(i, :) = decimate(idata(i, :), r);
		end
	end
end

