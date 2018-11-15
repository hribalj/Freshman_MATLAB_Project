PointA = struct('mass',1000,'chrg',-1,'loca',[0,100],'velo', [0,0], 'forc',[0,0]);
PointB = struct('mass',1000,'chrg',+1,'loca',[0,0],'velo', [0,0], 'forc',[0,0]);
%PointC = struct('mass',3000,'loca',[1.000,3.000],'velo', [0,0], 'forc',[[0,-9.8];[0,9.8]]);

global G;
global E;

G = 6.67408 * 10^-11; % m^3 kg^-1 s^-2
E = 8.8541878176*10^-12;

Points = [PointA PointB]; % change to a structure
clear PointA;
clear PointB;

Points = simulate(Points,{@gravitate,@electric},.01,2);