function [files, N] = get_filenames()


filenames = dir;
files = [];

N = 0;
for i = 1:length(dir)
	if ~filenames(i).isdir
		files = strvcat(files, filenames(i).name);
		N = N+1;
	end
end
