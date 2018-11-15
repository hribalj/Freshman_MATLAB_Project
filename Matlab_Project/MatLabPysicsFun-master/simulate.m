function points = simulate(points,forceFuncs,interval,time)
    timeE = 0;
    while(timeE < time)
        points = clearForces(points);
        for F = 1:length(forceFuncs)
            points = forceFuncs{F}(points);
        end
        for P = 1:length(points)
            points(P) = movePt(points(P),interval);
        end
        timeE = timeE + interval;
    end
end