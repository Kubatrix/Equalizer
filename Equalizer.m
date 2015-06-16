function varargout = zabawa(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @zabawa_OpeningFcn, ...
                   'gui_OutputFcn',  @zabawa_OutputFcn, ...
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

function zabawa_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = zabawa_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function y=inputdlg()
muza=wavread('C:\Users\Piotr\Downloads\eit\win');
t=length(muza)/44100;
muz_seg=muza(10*44100 : 15*44100);

function slider1_Callback(hObject, eventdata, handles) 
muza=wavread('C:\Users\Piotr\Downloads\eit\win');
t=length(muza)/44100;
muz_seg=muza(1*44100 : 38*44100);

polozenie1 = get(handles.slider1, 'Value');
ppol=polozenie1;
 N=10;
 teta=0.02;
 [Z1,Z2]=butter(N,teta,'low');
fil1=(ppol*filter(Z1,Z2,muz_seg))/10;
odtworz=fil1;
sound(odtworz,44100)

function slider1_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider2_Callback(hObject, eventdata, handles)
muza=wavread('C:\Users\Piotr\Downloads\eit\win');
t=length(muza)/44100;
muz_seg=muza(1*44100 : 38*44100);

polozenie2 = get(handles.slider2, 'Value');
dpol=polozenie2
N=10
 teta=0.1
 [Z1,Z2]=butter(N,teta,'low');
fil2=dpol*filter(Z1,Z2,muz_seg);
odtworz=fil2;
sound(odtworz,44100)

function slider2_CreateFcn(hObject, eventdata, handles)
inputdlg()
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider3_Callback(hObject, eventdata, handles)
muza=wavread('C:\Users\Piotr\Downloads\eit\win');
t=length(muza)/44100;
muz_seg=muza(1*44100 : 38*44100);

polozenie3 = get(handles.slider3, 'Value');
tpol=polozenie3
 N=10
 teta=0.2
 [Z1,Z2]=butter(N,teta,'low');
fil3=tpol*filter(Z1,Z2,muz_seg);
odtworz=fil3;
sound(odtworz,44100)

function slider3_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider4_Callback(hObject, eventdata, handles)
muza=wavread('C:\Users\Piotr\Downloads\eit\win');
t=length(muza)/44100;
muz_seg=muza(1*44100 : 38*44100);

polozenie4 = get(handles.slider4, 'Value');
czpol=polozenie4
 N=10
 teta=0.5
 [Z1,Z2]=butter(N,teta,'low');
fil4=czpol*filter(Z1,Z2,muz_seg);
odtworz=fil4;
sound(odtworz,44100)

function slider4_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider5_Callback(hObject, eventdata, handles)
muza=wavread('C:\Users\Piotr\Downloads\eit\win');
t=length(muza)/44100;
muz_seg=muza(1*44100 : 38*44100);

polozenie5 = get(handles.slider5, 'Value');
piapol=polozenie5
 N=10;
 teta=0.9;
 [Z1,Z2]=butter(N,teta,'low');
fil5=piapol*filter(Z1,Z2,muz_seg);
odtworz=fil5;
sound(odtworz,44100)

function slider5_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
