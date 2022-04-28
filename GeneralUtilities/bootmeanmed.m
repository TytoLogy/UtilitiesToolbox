function varargout = bootmeanmed(vals, nboot, alpha, btype, varargin)
%------------------------------------------------------------------------
% data = bootmeanmed(vals, nboot, alpha, btype)
% 	performs bootstrap without plotting
% 	
% data = bootmeanmed(vals, nboot, alpha, btype, histbins)
% 	performs bootstrap plots histograms of results and CI in new figure
% 
% data = bootmeanmed(vals, nboot, alpha, btype, histbins, figureH)
% 	performs bootstrap plots histograms of results and CI in figureH
% 
%------------------------------------------------------------------------
% Inputs:
% 	vals	input values for bootstrap
% 	nboot	# bootstrap iterations
% 	alpha	alpha level (e.g., 0.1 for 90% CI, 0.05 for 95% CI)
% 	btype	type of percentile 'bca' is typical (see bootci for more info)
% 
%------------------------------------------------------------------------
% Output:
% 	data	bootstrapped median and mean results
% 	 struct with fields:
% 
% 		median: [1×1 struct]
% 		  stat struct with fields:
% 			value: value of stat from vals
%			bootvalue: value of stat from boostrapped values
% 			ci: [2×1 double] confidence interval values from bootstrap
% 			bootsample: [nboot×1 double] bootstrapped values
% 
% 		Hmed:   [1×1 Histogram] graphics handle 
% 					(if figure provided in input args)
% 
% 		mean:   [1×1 struct]
% 		  stat struct with fields:
% 			value: value of stat from vals
%			bootvalue: value of stat from boostrapped values
% 			ci: [2×1 double] confidence interval values from bootstrap
% 			bootsample: [nboot×1 double] bootstrapped values
% 
% 		Hmean:  [1×1 Histogram] 
% 				  graphics handle (if figure provided in input args)
%------------------------------------------------------------------------
% See Also: bootci, histogram, mean, median
%------------------------------------------------------------------------

if ~isempty(varargin)
	if length(varargin) == 1
		histbins = varargin{1};
		figure
		plotFlag = true;
	elseif length(varargin) == 2
		histbins = varargin{1};
		figure(varargin{2});
		plotFlag = true;
	else
		error('%s: bad varargs', mfilename);
	end
else
	plotFlag = false;
end

D.spikeRate = [];
% calculate normal median of spikes
D.median.value = median(vals);
% use bootci to get conf interval
[D.median.ci, D.median.bootsample] = ...
	bootci(nboot, {@median, vals}, 'alpha', alpha, 'type', btype);
% compute median from bootstrapped values
D.median.bootvalue = median(D.median.bootsample);

% calculate normal mean of spikes
D.mean.value = mean(vals);
[D.mean.ci, D.mean.bootsample] = ...
	bootci(nboot, {@mean, vals}, 'alpha', alpha, 'type', btype);
% compute mean from bootstrapped values
D.mean.bootvalue = median(D.mean.bootsample);

if plotFlag
	%{
	% histogram of median on left axis
	yyaxis left
	Hmed = histogram(D.median.bootsample, histbins);
	yrange = ylim;
	line(D.median.bootvalue*[1 1], yrange, 'Color', [0.00,0.45,0.74], 'LineWidth', 3);
	line(D.median.ci(1)*[1 1], yrange, 'Color', [0.00,0.45,0.74]);
	line(D.median.ci(2)*[1 1], yrange, 'Color', [0.00,0.45,0.74]);
	ylabel('# Median', 'Interpreter', 'none');

	yyaxis right
	Hmean = histogram(D.mean.bootsample, histbins);
	yrange = ylim;
	line(D.mean.bootvalue*[1 1], yrange, 'Color', [0.85,0.33,0.10], 'LineWidth', 3);
	line(D.mean.ci(1)*[1 1], yrange, 'Color', [0.85,0.33,0.10]);
	line(D.mean.ci(2)*[1 1], yrange, 'Color', [0.85,0.33,0.10]);
	ylabel('# Mean', 'Interpreter', 'none');
%}
	[Hmed, Hmean] = yyhistogram( ...
		            D.median.bootsample, D.median.bootvalue, D.median.ci, ...
					   D.mean.bootsample, D.mean.bootvalue, D.mean.ci, ...
						histbins, '# Median', '# Mean');
else
	Hmed = [];
	Hmean = [];
end	

varargout{1} = D;
if nargout == 2
	tmp.Hmed = Hmed;
	tmp.Hmean = Hmean;
	varargout{2} = tmp;
end