function point = movePt(point, time)
%{
using the net Force from above, and the physics equations of motion
to calculate the factors of point after the given time interval 
%}
[NFx,NFy] = netForce(point);
accx = NFx/point.mass;
accy = NFy/point.mass;
Vx = point.velo(1) + accx*time;
Delx = point.velo(1)*time+(.5)*(accx)*(time)^2;
Vy = point.velo(2) + accy*time;
Dely = point.velo(2)*time+(.5)*(accy)*(time)^2;
newptx = Delx+point.loca(1);
newpty = Dely+point.loca(2);
point.loca = [newptx, newpty];
point.velo = [Vx, Vy];

end 