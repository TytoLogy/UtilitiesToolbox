function [logfname, basefname] = fileselect(owl, mm, dd, yy, weird)

dir

if nargin ~= 5
	owl = 'c';
	mm = '04';
	dd = '01';
	yy = '02';
	weird = 0;
end

owl = query_uservar('Owl initial', owl);
mm = query_uservar('Month', mm);
dd = query_uservar('Day', dd);
yy = query_uservar('Year', yy);
weird = query_user('weird data file', weird);

logfname = sprintf('%s_%s_%s_%s_fflog.txt', owl,mm,dd,yy);

if weird
	basefname  = sprintf('w_%s_%s_%s_%s', owl,mm,dd,yy);
else
	basefname  = sprintf('%s_%s_%s_%s', owl,mm,dd,yy);
end

