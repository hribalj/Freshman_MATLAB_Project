PointA = struct('mass',1,'chrg',0,'loca',[1,6],'velo', [0,0], 'forc',[0,0]);
PointB = struct('mass',1,'chrg',0,'loca',[1,4],'velo', [0,0], 'forc',[0,0]);
PointC = struct('mass',1,'chrg',0,'loca',[-1,6],'velo', [0,0], 'forc',[0,0]);
PointD = struct('mass',1,'chrg',0,'loca',[-1,4],'velo', [0,0], 'forc',[0,0]);
PointE = struct('mass',1,'chrg',0,'loca',[6,1],'velo', [0,0], 'forc',[0,0]);
PointF = struct('mass',1,'chrg',0,'loca',[4,1],'velo', [0,0], 'forc',[0,0]);
PointG = struct('mass',1,'chrg',0,'loca',[6,-1],'velo', [0,0], 'forc',[0,0]);
PointH = struct('mass',1,'chrg',0,'loca',[4,-1],'velo', [0,0], 'forc',[0,0]);


Network1 = struct('pnts',[PointA PointB PointC PointD],'boun',[],'area',0,'loca',[0 0],'velo',[0,-1],'avel',0,'mass',0,'mofi',0,'forc',[0 0],'name', 'Network 1');
Network2 = struct('pnts',[PointE PointF PointG PointH],'boun',[],'area',0,'loca',[0 0],'velo',[-1,0],'avel',0,'mass',0,'mofi',0,'forc',[0 0], 'name', 'Network 2');
Networks = [Network1 Network2];

options = struct('FOV', 4, 'stuff', 1);

for P = 1:length(Networks)
    Networks(P) = construct(Networks(P));
end





