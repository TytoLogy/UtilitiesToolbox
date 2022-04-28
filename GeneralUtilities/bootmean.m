function varargout = bootmean(vals, nboot, alpha, btype, varargin)
%------------------------------------------------------------------------
% data = bootmean(vals, nboot, alpha, btype)
% 	performs bootstrap without plotting
% 	
% data = bootmean(vals, nboot, alpha, btype, histbins)
% 	performs bootstrap plots histograms of results and CI in new figure
% 
% data = bootmean(vals, nboot, alpha, btype, histbins, figureH)
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
% 	data	bootstrapped  mean results
% 	 struct with fields:
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

% calculate normal mean of spikes
D.mean.value = mean(vals);
[D.mean.ci, D.mean.bootsample] = ...
	bootci(nboot, {@mean, vals}, 'alpha', alpha, 'type', btype);
% compute mean from bootstrapped values
D.mean.bootvalue = median(D.mean.bootsample);

if plotFlag
	Hmean = histogram(D.mean.bootsample, histbins);
	yrange = ylim;
	line(D.mean.bootvalue*[1 1], yrange, 'Color', [0.85,0.33,0.10], 'LineWidth', 3);
	line(D.mean.ci(1)*[1 1], yrange, 'Color', [0.85,0.33,0.10]);
	line(D.mean.ci(2)*[1 1], yrange, 'Color', [0.85,0.33,0.10]);
	ylabel('# Mean', 'Interpreter', 'none');
else
	Hmean = [];
end	

varargout{1} = D;
if nargout == 2
	varargout{2} = Hmean;
end