function a = actualel(azimuth, elevation)

a = asin(cos(deg2rad(azimuth)) * sin(deg2rad(elevation)));
a = rad2deg(a);