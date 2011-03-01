function bin = findtimebins(times, timearray)
% function bin = findtimebins(times, timearray)
%
% INPUT ARGS:
%	times = struct
%		times.onset = onset times
%		times.offset = offset times
%
%	timearray = array of times;
%
% OUTPUT ARG:
%	bin.onset = onset bin
%	bin.offset = offset bin
%
% Sharad Shanbhag
% sharad@etho.caltech.edu

onset = find(timearray>=times.onset);
offset = find(timearray<=times.offset);

if length(onset) == 0
	disp('findtimebins: could not find onset');
	onset = 1;
end
if length(offset) == 0;
	disp('findtimebins: could not find offset');
	offset = length(timearray)
end

bin.onset = onset(1);
bin.offset = offset(length(offset));

