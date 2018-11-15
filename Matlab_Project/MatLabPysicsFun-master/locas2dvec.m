function dvec = locas2dvec(loca1, loca2)
    x1 = loca1(1) - loca2(1);
    y1 = loca1(2) - loca2(2);
    x = x1/sqrt(x1^2 + y1^2);
    y = y1/sqrt(x1^2 + y1^2);
    dvec = [x y];
end