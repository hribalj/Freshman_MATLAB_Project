function points = gravitate(points)
    for k = 1:length(points)
        for l = (1:length(points))
            if(l == k)
                continue;
            end
            points(k).forc = [points(k).forc;forceOfG(points(k),points(l))];
        end
    end
end

function force = forceOfG(pointObj,pointSub)
    global G;
    r = distance(pointObj,pointSub);
    f = G * pointObj.mass * pointSub.mass / r^2; %F = Gm1m2/r^2
    force = -1 * f * locas2dvec(pointObj.loca, pointSub.loca);
end

