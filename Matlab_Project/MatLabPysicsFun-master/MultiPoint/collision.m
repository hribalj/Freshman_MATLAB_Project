function Networks = collision(Networks,a,b)
if(isColliding(Networks(a),Networks(b)))
    v1fx = ( (Networks(a).mass - Networks(b).mass) * Networks(a).velo(1) + 2*Networks(b).mass*Networks(b).velo(1))/(Networks(a).mass + Networks(b).mass);
    v2fx = ( 2*Networks(a).mass*Networks(a).velo(1) - (Networks(a).mass-Networks(b).mass)*Networks(b).velo(1))/(Networks(a).mass+Networks(b).mass);
    v1fy = ( (Networks(a).mass - Networks(b).mass) * Networks(a).velo(2) + 2*Networks(b).mass*Networks(b).velo(2))/(Networks(a).mass + Networks(b).mass);
    v2fy = ( 2*Networks(a).mass*Networks(a).velo(2) - (Networks(a).mass-Networks(b).mass)*Networks(b).velo(2))/(Networks(a).mass+Networks(b).mass);
    Networks(a) = applyImpulse(Networks(a),[v1fx - Networks(a).velo(1),v1fy - Networks(a).velo(2)]*Networks(a).mass);
    Networks(b) = applyImpulse(Networks(b),[v2fx - Networks(b).velo(1),v2fy - Networks(b).velo(2)]*Networks(b).mass);
end
end

function isCollidingo = isColliding(NetworkS,NetworkO)
isCollidingo = 0;
if(distance(NetworkS,NetworkO) > NetworkS.maxradius + NetworkO.maxradius)
    return;
end
for pnt = 1:length(NetworkS.pnts)
    isCollidingo = isCollidingo | isClipping(NetworkS.pnts(pnt),NetworkO.pnts(NetworkO.boun));
    if((isCollidingo))
        break;
    end
end
end


function bool = isClipping(pntA, vertices)
bool = 1;
Pq = pntA.loca';
for v = length(vertices):-1:1
    V(v,:) = vertices(v).loca;
end
Pc = [mean(V(:,1)) mean(V(:,2))];

for v = 1:length(vertices)-1
    V1 = V(v,:);
    V2 = V(v+1,:);
    
    P(1) = det([ det([Pq;Pc]) det([Pq(1) 1 ; Pc(1) 1]) ; det([V1;V2]) det([V1(1) 1; V2(1) 1])]) / det([ det([Pq(1) 1 ; Pc(1) 1]) det([Pq(2) 1 ; Pc(2) 1]) ; det([V1(1) 1; V2(1) 1]) det([V1(2) 1; V2(2) 1])]);
    P(2) = det([ det([Pq;Pc]) det([Pq(2) 1 ; Pc(2) 1]) ; det([V1;V2]) det([V1(2) 1; V2(2) 1])]) / det([ det([Pq(1) 1 ; Pc(1) 1]) det([Pq(2) 1 ; Pc(2) 1]) ; det([V1(1) 1; V2(1) 1]) det([V1(2) 1; V2(2) 1])]);
    
    bool = bool || P(1) >= min([Pq(1) Pc(1)]) && P(1) <= max([Pq(1) Pc(1)]) && P(1) >= min([V1(1) V2(1)]) && P(1) <= max([V1(1) V2(1)]) && P(2) >= min([Pq(2) Pc(2)]) && P(2) <= max([Pq(2) Pc(2)]) && P(2) >= min([V1(2) V2(2)]) && P(2) <= max([V1(2) V2(2)]);
    
end
end


function Network = applyImpulse(Network,impvec)
Network.velo = (Network.velo*Network.mass+impvec)/Network.mass;
fprintf('COLLISION! applying impulse of %.1f %.1f to %s\n',impvec,Network.name)
end

% If you are reading this, and planning on building on it for your ENGR160
% project, 1) shame on you for taking the easy way out rather than building
% something new 2) editing this function is the right, but thankless thing
% to do. No one is going to say, "golly, his objects richochet off each
% other not like balls, but like the shape they actually are!" But you'll
% know. Down in your heart, you'll remember that all nighter hacking it
% together. And you should be proud. -The Creator
%
%P.S. There are hidden messages in this project.
%P.P.S. I have some suggestions for what you could do:
%       1) add the third dimension. Or fourth
%       2) add concave shape support so that you can do things like gears
%       3) add more forces
%       4) alchemy
%       If you do anything cool with it, hit me up.
