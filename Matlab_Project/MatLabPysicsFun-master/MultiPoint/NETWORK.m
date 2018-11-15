classdef NETWORK
    properties
        pnts = InitializePnts;
        boun
        area
        loca
        velo 
        avel
        mass
        mofi
        forc = [0 0];
        name
        maxradius
    end
end
function pnts=InitializePnts
    pnts(2,1) = POINT;
end