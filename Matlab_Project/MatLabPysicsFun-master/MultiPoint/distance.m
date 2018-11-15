%calculates the scalar distance between points A and B
function d = distance(PointA, PointB)
    d = (PointA.loca(1) - PointB.loca(1))^2 + (PointA.loca(2) - PointB.loca(2))^2;
    d = sqrt(d);
end
