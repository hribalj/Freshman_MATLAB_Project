function net = rotateNet(net,interval)
angle = AngleTurn(net.avel,interval);
for iter = 1:length(net.pnts)
    net.pnts(iter) = rotatePoint(net.pnts(iter), angle );
end
net.avel= net.avel+ netTorq(net)/ net.mofi * interval;
net = net;
end

function theta = AngleTurn(w,t)
theta= w *t;
end

function pt = rotatePoint(pt, angle)
A= [ cos(angle), -1*sin(angle); sin(angle), cos(angle) ];
pt.loca = A*(pt.loca');
end

%function calculates the net torque of the network
function netTorq = netTorq(network)
   netTorq = 0; %initially sets net torque to 0
   for P = 1:length(network.pnts) %takes a set of points that make up the network
       [A,B] = netForce(network.pnts(P));
       cp = cross([disVec(network,network.pnts(P)) 0],[A B 0]); %takes the cross product of the distance between the center of mass and a point and the netForce 
       netTorq = netTorq + cp(3);
   end
end


