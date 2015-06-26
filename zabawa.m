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

function muz_seg=inputdlg()
       [FN,PN]=uigetfile('*.mp3','');
       sciezka=[PN,FN]
       if any(PN)==1
       end
    [muza,fs]=audioread(sciezka);
    t=length(muza)/44100;
    muz_seg=muza(1*44100 : 70*44100);
    
function ppol=slider1_Callback(hObject, eventdata, handles); 
result (handles);

function slider1_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider2_Callback(hObject, eventdata, handles);
result (handles);

function slider2_CreateFcn(hObject, eventdata, handles);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider3_Callback(hObject, eventdata, handles)
result (handles);

function slider3_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider4_Callback(hObject, eventdata, handles);
result (handles);

function slider4_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider5_Callback(hObject, eventdata, handles);
result (handles);

function slider5_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function pushbutton1_Callback(hObject, eventdata, handles)
result(handles);

function pushbutton2_Callback(hObject, eventdata, handles)
result(handles);

function slider14_Callback(hObject, eventdata, handles)
result(handles);

function slider14_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function edit2_Callback(hObject, eventdata, handles)
result(handles);

function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function slider16_Callback(hObject, eventdata, handles)
result(handles);

function slider16_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function result (handles)
 muz_seg=0;
 guzik1= get(handles.pushbutton1, 'Value');
 guzik2= get(handles.pushbutton2, 'Value');    
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%if%%%%%%
if(guzik1==1)
muz_seg=inputdlg();
ppol = get(handles.slider1,'Value');
 N=1;
 f=44100;
 ff=10;
 fh=200;
 teta=0.9;
 %==================================================
 W=fh-ff;
 Bw=sqrt(ff*fh)*10;
 [Z,P,K]=buttap(N);
 [NUM,DEN]=zp2tf(Z,P,K);
 [NUMT,DENT]=lp2bp(NUM,DEN, W, Bw);
[BB,AA]=bilinear(NUMT,DENT,f);
 fil1=ppol*filter(BB,AA,muz_seg);
%==================================================
dpol= get(handles.slider2, 'Value');
%==================================================
 ff=200;
 fh=800;
 W=fh-ff;
 Bw=sqrt(ff*fh)*10;
 [Z,P,K]=buttap(N);
 [NUM,DEN]=zp2tf(Z,P,K);
  [NUMT,DENT]=lp2bp(NUM,DEN, W, Bw);
 [BB,AA]=bilinear(NUMT,DENT,f);
  fil2=dpol*filter(BB,AA,muz_seg);
%==================================================
tpol = get(handles.slider3, 'Value');
%==================================================
 ff=500;
 fh=3500;
 W=fh-ff;;
 Bw=sqrt(ff*fh)*10;
 [Z,P,K]=buttap(N);
 [NUM,DEN]=zp2tf(Z,P,K);
  [NUMT,DENT]=lp2bp(NUM,DEN, W, Bw);
 [BB,AA]=bilinear(NUMT,DENT,f);
  fil3=tpol*filter(BB,AA,muz_seg);
%==================================================
czpol = get(handles.slider4, 'Value');
%==================================================
 ff=3000;
 fh=14000;
 W=fh-ff;
 Bw=sqrt(ff*fh)*10;
 [Z,P,K]=buttap(N);
 [NUM,DEN]=zp2tf(Z,P,K);
 [NUMT,DENT]=lp2bp(NUM,DEN, W, Bw);
 [BB,AA]=bilinear(NUMT,DENT,f);
 fil4=czpol*filter(BB,AA,muz_seg);
%==================================================
piapol= get(handles.slider5, 'Value');
%==================================================
 ff=8000;
 fh=18000;
 W=fh-ff;
 Bw=sqrt(ff*fh)*10;
 [Z,P,K]=buttap(N);
 [NUM,DEN]=zp2tf(Z,P,K);
  [NUMT,DENT]=lp2bp(NUM,DEN, W, Bw);
 [BB,AA]=bilinear(NUMT,DENT,f);
  fil5=piapol*filter(BB,AA,muz_seg);
%==================================================
volume= get(handles.slider16, 'Value');
odtworz=(fil1+fil2+fil3+fil4+fil5)*volume/10;
szybkosc = get(handles.slider14,'Value');
frek=44100*(0.2+szybkosc);
clear sound
sound(odtworz, frek);
 end
%%%%%%  KONIEC iF%%%%%%%%%%%%
if(guzik2==1)
       clear sound
end
