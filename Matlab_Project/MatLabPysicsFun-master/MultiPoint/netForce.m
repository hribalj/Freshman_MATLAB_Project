%function calculates the net force 
function [Fx , Fy ] = netForce(point)
    
    x = point.forc(:,1);
    y = point.forc(:,2);
  
    x = x(not(isnan(x)));
    y = y(not(isnan(y)));  
    
    Fx = sum(x); %calculates the net force in the x direction
    Fy = sum(y); %calculates the net force in the y direction 
end
