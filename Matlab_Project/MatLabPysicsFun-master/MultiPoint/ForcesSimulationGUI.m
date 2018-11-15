%% ForcesSimulationGUI
%%
function varargout = ForcesSimulationGUI(varargin)
% FORCESSIMULATIONGUI MATLAB code for ForcesSimulationGUI.fig
%      FORCESSIMULATIONGUI, by itself, creates a new FORCESSIMULATIONGUI or raises the existing
%      singleton*.
%
%      H = FORCESSIMULATIONGUI returns the handle to a new FORCESSIMULATIONGUI or the handle to
%      the existing singleton*.
%
%      FORCESSIMULATIONGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FORCESSIMULATIONGUI.M with the given input arguments.
%
%      FORCESSIMULATIONGUI('Property','Value',...) creates a new FORCESSIMULATIONGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ForcesSimulationGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ForcesSimulationGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ForcesSimulationGUI

% Last Modified by GUIDE v2.5 25-Apr-2017 18:49:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ForcesSimulationGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ForcesSimulationGUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before ForcesSimulationGUI is made visible.
function ForcesSimulationGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ForcesSimulationGUI (see VARARGIN)


% Choose default command line output for ForcesSimulationGUI
handles.output = hObject;
set(handles.massobject1,'string','10');
set(handles.massobj2,'string','10');
set(handles.object3mass,'string','10');
set(handles.velocityobj1,'string','[1 0]');
set(handles.velocityobj2,'string','[-1 0]');
set(handles.object3velo,'string','[1 2]');
set(handles.Positionobj1,'string','[15 25]');
set(handles.Positionobj2,'string','[30 25]');
set(handles.object3pos,'string','[14 20]');
Speedmin = set(handles.speedslider,'Min',1);
Speedmax = set(handles.speedslider,'Max',100);
Speedvalue = set(handles.speedslider,'Value',50);

global clickcounter
clickcounter = 0;
global mass
global location
global velocity 



% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ForcesSimulationGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = ForcesSimulationGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1

presets = cellstr(get(handles.listbox1,'String'));


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function title_CreateFcn(hObject, eventdata, handles)
% hObject    handle to title (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function position_CreateFcn(hObject, eventdata, handles)
% hObject    handle to position (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

%TooltipString


% --- Executes during object deletion, before destroying properties.
function simulation_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to simulation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in Startbutton.
function Startbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Startbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Startbutton
handles.simulation;
global ENDING 
global clickcounter
global bin
global container 
global mass
global location
global velocity 
ENDING = 0;

if length(mass) == 0

mass = [str2num(get(handles.massobject1,'String'));str2num(get(handles.massobj2,'String'));str2num(get(handles.object3mass,'String'))];
velocity = [str2num(get(handles.velocityobj1,'String'));str2num(get(handles.velocityobj2,'String'));str2num(get(handles.object3velo,'String'))]; 
location = [str2num(get(handles.Positionobj1,'String'));str2num(get(handles.Positionobj2,'String'));str2num(get(handles.object3pos,'String'))];

end

set(handles.Startbutton,'Enable','off');

for c = clickcounter:-1:1
    set( bin(c), 'Visible', 'off')
end
clickcounter = 0;


%create the structures to plot 

Networks = pointsnet(location,velocity,mass);
for P = 1:length(Networks)
    Networks(P) = setUpNetwork(Networks(P));
end

pntForcFunc = {};
if handles.checkbox1.Value 
    pntForcFunc = {@gravity};
end

container = simulate(Networks,pntForcFunc,{},0.01,Inf,{},handles.simulation);
disp('simulation complete');


set(handles.Startbutton,'Enable','on');

% --- Executes on button press in Pausebutton.
function Pausebutton_Callback(hObject, eventdata, handles)
% hObject    handle to Pausebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Pausebutton
global ENDING
Pauseb = get(handles.Pausebutton,'Value');
Pauseb = ENDING;
ENDING = 1;



% --- Executes on selection change in simulationsetups.
function simulationsetups_Callback(hObject, eventdata, handles)
% hObject    handle to simulationsetups (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns simulationsetups contents as cell array
%        contents{get(hObject,'Value')} returns selected item from simulationsetups


% --- Executes during object creation, after setting all properties.
function simulationsetups_CreateFcn(hObject, eventdata, handles)
% hObject    handle to simulationsetups (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function simulation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to simulation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate simulation


% --- Executes on key press with focus on Startbutton and none of its controls.
function Startbutton_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to Startbutton (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



function massobject1_Callback(hObject, eventdata, handles)
% hObject    handle to massobject1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of massobject1 as text
%        str2double(get(hObject,'String')) returns contents of massobject1 as a double


% --- Executes during object creation, after setting all properties.
function massobject1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to massobject1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function velocityobj1_Callback(hObject, eventdata, handles)
% hObject    handle to velocityobj1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of velocityobj1 as text
%        str2double(get(hObject,'String')) returns contents of velocityobj1 as a double


% --- Executes during object creation, after setting all properties.
function velocityobj1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to velocityobj1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Positionobj1_Callback(hObject, eventdata, handles)
% hObject    handle to Positionobj1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Positionobj1 as text
%        str2double(get(hObject,'String')) returns contents of Positionobj1 as a double

% Positionobj1 = str2num(get(handles.Positionobj1,'String'));
% disp(Positionobj1)

% --- Executes during object creation, after setting all properties.
function Positionobj1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Positionobj1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function massobj2_Callback(hObject, eventdata, handles)
% hObject    handle to massobj2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of massobj2 as text
%        str2double(get(hObject,'String')) returns contents of massobj2 as a double


% --- Executes during object creation, after setting all properties.
function massobj2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to massobj2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function velocityobj2_Callback(hObject, eventdata, handles)
% hObject    handle to velocityobj2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of velocityobj2 as text
%        str2double(get(hObject,'String')) returns contents of velocityobj2 as a double


% --- Executes during object creation, after setting all properties.
function velocityobj2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to velocityobj2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to positionobj2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of positionobj2 as text
%        str2double(get(hObject,'String')) returns contents of positionobj2 as a double


% --- Executes during object creation, after setting all properties.
function positionobj2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to positionobj2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Positionobj2_Callback(hObject, eventdata, handles)
% hObject    handle to Positionobj2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Positionobj2 as text
%        str2double(get(hObject,'String')) returns contents of Positionobj2 as a double


% --- Executes during object creation, after setting all properties.
function Positionobj2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Positionobj2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function speedslider_Callback(hObject, eventdata, handles)
% hObject    handle to speedslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global TICKTIME;
% Speedmin = str2num(get(handles.speedslider,'Min'));
% Speedmax = str2num(get(handles.speedslider,'Max'));

Speedval = get(handles.speedslider,'Value');
TICKTIME = Speedval/1000;

% --- Executes during object creation, after setting all properties.
function speedslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to speedslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes during object creation, after setting all properties.
function mass_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



% --- Executes during object creation, after setting all properties.
function velocity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to velocity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function object3mass_Callback(hObject, eventdata, handles)
% hObject    handle to object3mass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of object3mass as text
%        str2double(get(hObject,'String')) returns contents of object3mass as a double


% --- Executes during object creation, after setting all properties.
function object3mass_CreateFcn(hObject, eventdata, handles)
% hObject    handle to object3mass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function object3velo_Callback(hObject, eventdata, handles)
% hObject    handle to object3velo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of object3velo as text
%        str2double(get(hObject,'String')) returns contents of object3velo as a double


% --- Executes during object creation, after setting all properties.
function object3velo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to object3velo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function object3pos_Callback(hObject, eventdata, handles)
% hObject    handle to object3pos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of object3pos as text
%        str2double(get(hObject,'String')) returns contents of object3pos as a double


% --- Executes during object creation, after setting all properties.
function object3pos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to object3pos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2
disp('STUFF')

% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
% global clickcounter
% 
clickcounter = 0;
Status = get(handles.radiobutton2,'Value');


mass = [str2num(get(handles.massobject1,'String'));str2num(get(handles.massobj2,'String'));str2num(get(handles.object3mass,'String'))];

pause(.001)
if Status == 1
    set(gcf,'Units','normalized');
    set (gcf, 'WindowButtonDownFcn', {@mousePosition});
end


% --- Executes on button press in togglebutton4.
function togglebutton4_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton4
Contb = get(handles.togglebutton4,'Value');

global container 
if Contb == 1
container = simulate(container,{},{},0.01,Inf,{},handles.simulation);
end

set(handles.togglebutton4,'value',0);


% --- Executes on key press with focus on radiobutton2 and none of its controls.
function radiobutton2_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
