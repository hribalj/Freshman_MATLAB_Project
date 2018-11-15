function dragArrowFcn(varargin)
global arrow
Mousept = get (gca, 'CurrentPoint');
Xpos = set(arrow,Mousept(1)*[1 1]);
Ypos = set(arrow,Mousept(2));
end
