function creatshapes(Networks,axisJ)
axisJ;
cla;
% object = zeros(1,length(Networks));
for N = 1:length(Networks)
    X = zeros(1,length(Networks(N).pnts));
    Y = zeros(1,length(Networks(N).pnts));
    for P = 1:length(Networks(N).pnts)
        X(P) = Networks(N).pnts(P).loca(1);
        Y(P) = Networks(N).pnts(P).loca(2);
    end
    patch(axisJ,X,Y,'k');
end
