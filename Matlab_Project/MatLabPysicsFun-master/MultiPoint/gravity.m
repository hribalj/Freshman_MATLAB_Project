function force = gravity(pointObj,pointSub)
    global G;
    G = 6.67408e-11;
    r = distance(pointObj,pointSub);
    f = G * pointObj.mass * pointSub.mass / r^2; %F = Gm1m2/r^2
    force = -1 * f * locas2dvec(pointObj.loca, pointSub.loca);
end

