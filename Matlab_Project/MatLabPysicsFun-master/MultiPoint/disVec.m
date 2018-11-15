%calculates a displacement vector between two points 
function dsVec = disVec(point1,point2)
   dsVec = [point2.loca(1) - point1.loca(1) , point2.loca(2) - point1.loca(2)];
end
