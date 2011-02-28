recdur= 5000;
newfile = 1;
trial = 1;


inf_file = query_uservar('Name of saccade info file', 'net_sac.txt');
sac_file = query_uservar('Name of saccade output mat file', 'sac_traces.mat');
Sinfo = read_saccade_info(inf_file);

N = length(Sinfo);
%N=1;

datapath_base = 'H:\exper\behave\';
datapath_dates = {'c4_26_02' 'c4_27_02a' 'c4_27_02b' 'c5_01_02'};
dataname_cdpts = {'c_04_26_02_20_ffdat.txt' 'c_04_27_02_12_ffdat.txt' 'c_04_27_02_12_ffdat.txt' 'c_05_01_02_10_ffdat.txt'};
dataname_cdid = [1 55 120 150 0];

S = cell(1);

j = 1;
nameind = 1;
for i = 1:N
	
%	if strcmp(Sinfo{i}.dataname, dataname_cdpts{nameind}) & (i == dataname_cdid(nameind))
	if i == dataname_cdid(nameind)
		datadate = datapath_dates{nameind};
		datapath = [datapath_base datadate '\'];
		nameind = nameind +1;
	end
		
	disp(['dataname = ' Sinfo{i}.dataname]);
	disp(['datapath = ' datapath]);
	rawfile = strcat(datapath, Sinfo{i}.dataname);
	disp(['fullpath = ' rawfile]);

	rawdata = load(rawfile, '-ascii');
	
	%convert the timestamp data in the rawdata to absolute time
	rawdata = stamp2time(rawdata);
	
	S{j}.data = extract_saccade(rawdata, Sinfo{i}.start, Sinfo{i}.hold);
	S{j}.info = Sinfo{i};
	S{j}.dataquat = angles2quat(S{j}.data(:, 2:4), 'deg');
	j = j+1;
end

save(sac_file, 'S')