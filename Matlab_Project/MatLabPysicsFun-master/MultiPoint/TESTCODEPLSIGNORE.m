pnt1 = POINT;
pnt1.chrg = 12

pnt2 = POINT
pnt2.chrg = 1

pnts = [pnt1 pnt2];


ntwrk = NETWORK
ntwrk.velo = [0,0]
ntwrk.mass = 8
ntwrk.pnts = pnts


ntwrk1 = NETWORK
ntwrk.velo = [0,-1]



ntwrks(2) = ntwrk1
ntwrks(1) = ntwrk

ntwrks(1).pnts(1).chrg