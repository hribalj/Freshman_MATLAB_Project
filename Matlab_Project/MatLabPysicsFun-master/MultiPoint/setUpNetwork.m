function network = setUpNetwork(network)
    netMass = 0;
    Xs = zeros(length(network.pnts),1);
    Ys = zeros(length(network.pnts),1);
    iter = 1;
    for P = 1:length(network.pnts)
        netMass = netMass + network.pnts(P).mass;
        Xs(iter) = network.pnts(P).loca(1);
        Ys(iter) = network.pnts(P).loca(2);
        iter = iter + 1;
    end
    Xs = Xs';
    Ys = Ys';
    network.mass = netMass;
    network.loca = centerOfMass(network);
    network.mofi = momentOfInertia(network);
    [A,network.area] = convhull(Xs,Ys,'simplify',true);
    network.boun = A;
    
    
    r = zeros(1:length(network.pnts));
    for zxc = 1:length(A)
        x = A(zxc);
        r(x) = sqrt(sum((network.pnts(x).loca - network.loca).^2));
    end 
    
    network.maxradius = max(r);
    
    
    network = network;
end

%momentOfInertia function takes the network of points and uses the center of mass and the distance from the points to the center of mass to calculate the moment of inertia
function mOI = momentOfInertia(network)
    mOI = 0;
    cOM = centerOfMass(network);
    for P = 1:length(network.pnts)
       A = struct('loca',network.pnts(P).loca);
       B = struct('loca',cOM);
       mOI = mOI + network.pnts(P).mass * distance(A,B)^2; 
    end
end

 %function calculates the center of mass
 function cenOfMass = centerOfMass(network)
    sumX = 0;
    sumY = 0;
    sumM = 0;
    for P = 1:length(network.pnts) %for loop iterates through the points of the network 
        sumX = sumX + network.pnts(P).loca(1)*network.pnts(P).mass; %multiplies the position and the mass of the points in the network to get the sum of all x values
        sumY = sumY + network.pnts(P).loca(2)*network.pnts(P).mass; %multiplies the position and the mass of the points in the network to get the sum of all y values
        sumM = sumM + network.pnts(P).mass; %adds of the masses to get the total mass
    end
    cenOfMass = [sumX sumY]./sumM; %takes the vector made up of the sum of the x and y values and divides each element by the total mass
end
