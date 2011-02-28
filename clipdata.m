function out = clipdata(in, maxlevel)
% out = clipdata(in, maxlevel)
% 
%	imposes a "hard limit" on the input data (assumes AC signal)
%
%	Input:
% 		in			array of numbers
% 		maxlevel	value to clip data at (limits to +- maxlevel);

maxbins = find(in>maxlevel);
minbins = find(in<(-1*maxlevel));

out = in;
out(maxbins) = maxlevel;
out(minbins) = -maxlevel;
