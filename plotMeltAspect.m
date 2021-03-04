%% Check aspect of melt areas
za=geotiffread('ROIbb2/aspect');
% Sentinel-2 FSC product from MAJA-LIS (Gascoin et al. 2019)
d1='05feb'; 
d2='10feb';
f1=geotiffread(['ROIbb2/fsc' d1]);
f2=geotiffread(['ROIbb2/fsc' d2]);
m = f1>0 & f2==0 & f1<=100 & f2<=100 ; 
c = f1<=100 & f2<=100 ; 
%%
figure(1),clf
[t,rc]=rose(deg2rad(za(c)),deg2rad(0:18:360));
[~,rm]=rose(deg2rad(za(m)),deg2rad(0:18:360));
r=rm./rc;
r(isnan(r))=0;
polar(t,r,'-')
% north up and angles increasing anti-clockwise 
view(90, -90);
title({'Snowmelt area between 05 and 10 Feb', '% of clear-sky pixels by aspect bin'})
saveas(1,'html/meltAspect.png')