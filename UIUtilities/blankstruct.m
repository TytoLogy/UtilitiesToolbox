function out = blankstruct(s)

if ~isstruct(s)
	error('blankstruct: ceci n''est pas une structure');
end

fields = fieldnames(s);
nfields = length(fields);
for i = 1:nfields
	s.(fields{i}) = [];
end
out = s;