function mousePosition (hObject,eventdata)
global clickcounter
global bin 
global arrow
global location
global velocity
global mass


C = get (gca, 'CurrentPoint');
X = C(1,1);
Y = C(1,2);

clickcounter = clickcounter + 1;
disp(clickcounter)
if clickcounter <= 3
 bin(clickcounter) = plot(X,Y,'o','MarkerSize',12,'MarkerFaceColor','k');
%   arrow = annotation('arrow',[X/40 Y/40],...  %location of arrow is not working
%       'color','g','LineWidth',1.5,...
%   'ButtonDownFcn', @startArrowFcn);
%   set (gcf, 'WindowButtonUpFcn', {@mouseStop});
prompt = {'Enter the velocity','Enter the mass'};
dlg_title = sprintf('%s %s','Object',clickcounter);
num_lines = 1;
defans = {'',''};
answer = inputdlg(prompt,dlg_title,num_lines,defans);
velocity(clickcounter,:) = str2num(answer{1});
mass(clickcounter) = str2num(answer{2});
location(clickcounter,:) = [X Y];
end

% pointsnet(mass,NaN,[X Y])
end
