%function calulates the distance vector given two different locations of the point
function dvec = locas2dvec(loca2, loca1)
    x1 = loca2(1) - loca1(1); %finds change in x
    y1 = loca2(2) - loca1(2); %finds change in y
    x = x1/sqrt(x1^2 + y1^2); %finds the x comp of distance vec
    y = y1/sqrt(x1^2 + y1^2); %finds the y comp of distance vec
    dvec = [x y]; %makes distance vec 
end
