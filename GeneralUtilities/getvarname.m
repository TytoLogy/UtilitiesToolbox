function aName = getvarname(x) %#ok<INUSD>
% trick to get the name of a variable in a script or function as a string
% from idea here:
% https://www.mathworks.com/matlabcentral/answers/263718-what-is-the-best-way-to-get-the-name-of-a-variable-in-a-script

aName = inputname(1);