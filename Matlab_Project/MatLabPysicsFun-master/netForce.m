function [Fx , Fy ] = netForce(point)
    Fx = sum(point.forc (:,1));
    Fy = sum(point.forc (:,2));
end