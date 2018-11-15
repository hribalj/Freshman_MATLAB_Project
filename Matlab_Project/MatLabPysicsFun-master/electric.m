function points = electric(points)
    for k = 1:length(points)
        for l = (1:length(points))
            if(l == k)
                continue;
            end
            points(k).forc = [points(k).forc;forceOfEM(points(k),points(l))];
        end
    end
end

function force = forceOfEM(pointObj,pointSub)
    global E;
    r = distance(pointObj,pointSub);
    f = 1/(4*pi*E) * pointObj.chrg * pointSub.chrg / r^2; %F = Gm1m2/r^2
    force = f * locas2dvec(pointObj.loca, pointSub.loca);
end