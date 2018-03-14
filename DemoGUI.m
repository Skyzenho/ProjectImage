function varargout = DemoGUI(varargin)
% DEMOGUI MATLAB code for DemoGUI.fig
%      DEMOGUI, by itself, creates a new DEMOGUI or raises the existing
%      singleton*.
%
%      H = DEMOGUI returns the handle to a new DEMOGUI or the handle to
%      the existing singleton*.
%
%      DEMOGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DEMOGUI.M with the given input arguments.
%
%      DEMOGUI('Property','Value',...) creates a new DEMOGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DemoGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DemoGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DemoGUI

% Last Modified by GUIDE v2.5 23-Jan-2018 21:12:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DemoGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @DemoGUI_OutputFcn, ...
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


% --- Executes just before DemoGUI is made visible.
function DemoGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DemoGUI (see VARARGIN)

% Choose default command line output for DemoGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DemoGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialize variables and GUI items 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global myImage;
myImage = [];
set(handles.RC,'String','R');
set(handles.GC,'String','G');
set(handles.BC,'String','B');
set(handles.RS,'String','R');
set(handles.GS,'String','G');
set(handles.BS,'String','B');
set(handles.RG,'String','R');
set(handles.GG,'String','G');
set(handles.BG,'String','B');
set(handles.SFact,'String','SF');
set(handles.resp,'string',' ');
set(handles.axes1,'YTick',[]);
set(handles.axes1,'XTick',[]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Outputs from this function are returned to the command line.
function varargout = DemoGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Load image after clicking button 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[FileName,PathName] = uigetfile({'*.jpg;*.tif;*.png;*.gif','All Image Files';...
          '*.*','All Files' },'Select image files only!');
global myImage;
myImage = imread(fullfile(PathName,FileName));
axes(handles.axes1);
imshow(myImage);
set(handles.resp,'string',' ');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on key press with focus on pushbutton1 and none of its controls.
function pushbutton1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do processing calculation in loaded image
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global myImage;
if(~isempty(myImage))
    RC=get(handles.RC,'string');
    if strcmp(RC,'R') 
        RC=205;
    elseif strcmp(RC,'R2')
        RC=94;
    else
        RC=num2str(RC);
    end
    GC=get(handles.GC,'string');
    if strcmp(GC,'G')
        GC=138;
    elseif strcmp(GC,'G2')
        GC=67;
    else
        GC=num2str(GC);
    end
    BC=get(handles.BC,'string');
    if strcmp(BC,'B') 
        BC=84;  
    elseif strcmp(BC,'B2')
        BC=58;
    else
        BC=num2str(BC); 
    end
    RS=get(handles.RS,'string');
    if strcmp(RS,'R')
        RS=155; 
    elseif strcmp(RS,'R2')
        RS=120;
    else
        RS=num2str(RS);
    end
    GS=get(handles.GS,'string');
    if strcmp(GS,'G') 
        GS=130; 
    elseif strcmp(GS,'G2') 
        GS=112;
    else
        GS=num2str(GS);
    end
    BS=get(handles.BS,'string');
    if strcmp(BS,'B')  
        BS=97;  
    elseif strcmp(BS,'B2')
        BS=103;
    else
        BS=num2str(BS);
    end
    RG=get(handles.RG,'string');
    if strcmp(RG,'R')
        RG=179; 
    elseif strcmp(RG,'R2')
        RG=100;
    else
        RS=num2str(RG);
    end
    GG=get(handles.GG,'string');
    if strcmp(GG,'G') 
        GG=140;
    elseif strcmp(GG,'G2')
        GG=90;
    else
        GS=num2str(GG);
    end
    BG=get(handles.BG,'string');
    if strcmp(BG,'B') 
        BG=69;
    elseif strcmp(BG,'B2')
        BG=61;
    else
        BS=num2str(BG);
    end
    SF=get(handles.SFact,'string');
    if strcmp(SF,'SF') 
        SF=0.044;
    elseif strcmp(SF,'SF2')
        SF=0.0023;
    else
        SF=num2str(SF);
    end
    Copper=[RC GC BC];
    Silver=[RS GS BS];
    Gold=[RG GG BG];
    imgseg=seghsv(myImage);% do the segmentation
    axes(handles.axes1);
    [S,CC,NomC,value]=classification(myImage,imgseg,SF,Copper,Silver,Gold);
   
    n=size(S,1);
    axes(handles.axes1);
    for i=1:n
        viscircles([S(i).Centroid(1) S(i).Centroid(2)],S(i).EquivDiameter/2);
        text(S(i).Centroid(1),S(i).Centroid(2),NomC(i,:));
    end
    format bank
    value=value/100;
    set(handles.resp,'string',num2str(value));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function RC_Callback(hObject, eventdata, handles)
% hObject    handle to RC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RC as text
%        str2double(get(hObject,'String')) returns contents of RC as a double


% --- Executes during object creation, after setting all properties.
function RC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function GC_Callback(hObject, eventdata, handles)
% hObject    handle to GC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of GC as text
%        str2double(get(hObject,'String')) returns contents of GC as a double


% --- Executes during object creation, after setting all properties.
function GC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function BC_Callback(hObject, eventdata, handles)
% hObject    handle to BC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of BC as text
%        str2double(get(hObject,'String')) returns contents of BC as a double


% --- Executes during object creation, after setting all properties.
function BC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function resp_Callback(hObject, eventdata, handles)
% hObject    handle to resp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of resp as text
%        str2double(get(hObject,'String')) returns contents of resp as a double


% --- Executes during object creation, after setting all properties.
function resp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to resp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RS_Callback(hObject, eventdata, handles)
% hObject    handle to RS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RS as text
%        str2double(get(hObject,'String')) returns contents of RS as a double


% --- Executes during object creation, after setting all properties.
function RS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function GS_Callback(hObject, eventdata, handles)
% hObject    handle to GS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of GS as text
%        str2double(get(hObject,'String')) returns contents of GS as a double


% --- Executes during object creation, after setting all properties.
function GS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function BS_Callback(hObject, eventdata, handles)
% hObject    handle to BS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of BS as text
%        str2double(get(hObject,'String')) returns contents of BS as a double


% --- Executes during object creation, after setting all properties.
function BS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RG_Callback(hObject, eventdata, handles)
% hObject    handle to RG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RG as text
%        str2double(get(hObject,'String')) returns contents of RG as a double


% --- Executes during object creation, after setting all properties.
function RG_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function GG_Callback(hObject, eventdata, handles)
% hObject    handle to GG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of GG as text
%        str2double(get(hObject,'String')) returns contents of GG as a double


% --- Executes during object creation, after setting all properties.
function GG_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function BG_Callback(hObject, eventdata, handles)
% hObject    handle to BG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of BG as text
%        str2double(get(hObject,'String')) returns contents of BG as a double


% --- Executes during object creation, after setting all properties.
function BG_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SFact_Callback(hObject, eventdata, handles)
% hObject    handle to SFact (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SFact as text
%        str2double(get(hObject,'String')) returns contents of SFact as a double


% --- Executes during object creation, after setting all properties.
function SFact_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SFact (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
set(handles.RC,'String','R2');
set(handles.GC,'String','G2');
set(handles.BC,'String','B2');
set(handles.RS,'String','R2');
set(handles.GS,'String','G2');
set(handles.BS,'String','B2');
set(handles.RG,'String','R2');
set(handles.GG,'String','G2');
set(handles.BG,'String','B2');
set(handles.SFact,'String','SF2');
set(handles.resp,'string',' ');
set(handles.uipanel1,'visible','Off');

% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel1,'visible','On');
% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
set(handles.RC,'String','R');
set(handles.GC,'String','G');
set(handles.BC,'String','B');
set(handles.RS,'String','R');
set(handles.GS,'String','G');
set(handles.BS,'String','B');
set(handles.RG,'String','R');
set(handles.GG,'String','G');
set(handles.BG,'String','B');
set(handles.SFact,'String','SF');
set(handles.resp,'string',' ');
set(handles.uipanel1,'visible','Off');
