function intersections_demo
np = 201;
p = peaks(np);
xy = linspace(-3,3,np);
[dx,dy] = gradient(p,xy,xy);
cx = contourc(xy,xy,dx,[0 0]);
cy = contourc(xy,xy,dy,[0 0]);
[~,vx] = splitcontours(cx);
[~,vy] = splitcontours(cy);
[xx,yy] = intersections(vx(:,1),vx(:,2),vy(:,1),vy(:,2));

contour(xy,xy,p,20,'Color',[0.85 0.85 0.85])
axis square
orient portrait
set(gcf,'paperpos',[0 0 5 5])
set(gca,'ytick',-3:3)
set(gca,'xtick',-3:3)
hold on
hh = plot(vx(:,1),vx(:,2),vy(:,1),vy(:,2),xx,yy,'ok');
legend(hh,{'curve 1','curve 2','intersections'})
title('Local Extrema and Saddle Points of peaks Function')
hold off



function [s,v] = splitcontours(con)
%splitcontours: Convert contour matrix to structure array.

% written by Douglas M. Schwarz.

len_con = size(con,2);
val_flag = false(1,len_con);
ptr = 1;
while ptr < len_con
val_flag(ptr) = true;
ptr = ptr + con(2,ptr) + 1;
end
num_cons = sum(val_flag);
val_locs = [find(val_flag),len_con+1];
nvals = diff(val_locs) - 1;
s = repmat(struct('value',[],'x',[],'y',[],'n',[]),1,num_cons);
for i = 1:num_cons
s(i).value = con(1,val_locs(i));
s(i).n = nvals(i);
i1 = val_locs(i) + 1;
i2 = val_locs(i+1) - 1;
s(i).x = con(1,i1:i2).';
s(i).y = con(2,i1:i2).';
end

if nargout > 1
v = con.';
v(val_flag,:) = NaN;
v(1,:) = [];
end 