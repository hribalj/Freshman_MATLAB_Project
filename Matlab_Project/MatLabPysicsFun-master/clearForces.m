function points = clearForces(points)
    for P = 1:length(points)
        points(P).forc = [0,0];
    end
end