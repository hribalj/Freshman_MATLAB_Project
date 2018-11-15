%function takes the inputs of network and time to find the the position and velocity 
function network = moveNet(network,time)
    [NFx,NFy] = netnetForce(network); %calculates the netforce of the network 
    accx = NFx/network.mass; %acceleration in x direction
    accy = NFy/network.mass; %acceleration in y direction
    Vx = network.velo(1) + accx*time; %velocity in the x direction
    Delx = network.velo(1)*time+(.5)*(accx)*(time)^2; %change in position in x direction
    Vy = network.velo(2) + accy*time; %change in velocity in the y direction
    Dely = network.velo(2)*time+(.5)*(accy)*(time)^2; %chance in position in y direction
    newptx = Delx+network.loca(1); %calculates the new x coordinates
    newpty = Dely+network.loca(2); %calcultes the new y coordinates
    for p = 1:length(network.pnts)
        network.pnts(p).loca = [network.pnts(p).loca(1) + Delx ,  network.pnts(p).loca(2) + Dely ];
    end
    network.loca = [newptx, newpty]; %provides the x and y values in vector
    network.velo = [Vx, Vy]; %provides the x and y velocity in vector
end 
