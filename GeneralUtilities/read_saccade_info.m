function D = read_saccade_info(filename)	
%function D = read_saccade_info(filename)
%	dataname = output file name
%	basename = base name for raw position data
%	az, el, roll: structures of mean and std angle (e.g., az.mean, az.sd)
%	start, hold: _.onset, _.offset times in ms for start and stop of saccade
%	type: 0 = fixation saccade, 1 = hoop saccade, 2 = other
%	comment: text of comments (no control characters please)
%
%	save_saccade will create the file dataname and print a header if the file
%	dataname does not exist.  otherwise it will append the data to the existing
%	file.
%
% Sharad Shanbhag
% sharad@etho.caltech.edu

fp = -1;
mode = -1;

if ~isfile(filename) 
	error(sprintf('read_saccade: could not read file %s', dataname));
end
mode = 'r';

fp = fopen(filename, mode);

% read the header
hdr = fgetl(fp);

D = cell(1);

n = 1;
while ~feof(fp)
	% read the data filename

	d.dataname = fscanf(fp, '%s', 1);
	a = fscanf(fp, '%f', 17);

	i = 1;
	d.az.start_avg = a(i); i = i+1;
	d.el.start_avg = a(i); i = i+1;
	d.roll.start_avg = a(i); i = i+1;
	d.az.hold_avg = a(i); i = i+1;
	d.el.hold_avg = a(i); i = i+1;
	d.roll.hold_avg = a(i); i = i+1;
	d.az.start_std = a(i); i = i+1;
	d.el.start_std = a(i); i = i+1;
	d.roll.start_std = a(i); i = i+1;
	d.az.hold_std = a(i); i = i+1;
	d.el.hold_std = a(i); i = i+1;
	d.roll.hold_std = a(i); i = i+1;
	d.start.onset = a(i); i = i+1;
	d.start.offset = a(i); i = i+1;
	d.hold.onset = a(i); i = i+1;
	d.hold.offset = a(i); i = i+1;
	d.type = a(i);
	d.comment = fgetl(fp);

	D{n} = d;
	n = n+1;
end

fclose(fp);

