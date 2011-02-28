function C = stamp2time(coiltrace);
%function C = stamp2time(coiltrace);
%
%	converts timestamps in coiltrace (1st column) to 
%	absolute time and trims off any bad elements
%
% Sharad J Shanbhag
% sharad@etho.caltech.edu

coiltrace(:, 1) = coiltrace(:,1)-coiltrace(1,1);

i = length(coiltrace);
iflag = 0;
while iflag == 0
	if coiltrace(i, 1) > 0
		iflag = 1;
	else
		i = i-1;
	end
end


C = coiltrace(1:i, :);
