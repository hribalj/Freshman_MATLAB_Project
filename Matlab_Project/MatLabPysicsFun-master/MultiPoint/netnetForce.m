function [X Y] = netnetForce(network)
    X = 0;
    Y = 0;
    for P = 1:length(network.pnts)
        [x,y] = netForce(network.pnts(P));
        X = X + x;
        Y = Y + y;
    end
end