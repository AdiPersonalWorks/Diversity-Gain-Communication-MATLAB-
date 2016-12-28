function varargout = DiversityGain(varargin)
% DIVERSITYGAIN M-file for DiversityGain.fig
%      DIVERSITYGAIN, by itself, creates a new DIVERSITYGAIN or raises the existing
%      singleton*.
%
%      H = DIVERSITYGAIN returns the handle to a new DIVERSITYGAIN or the handle to
%      the existing singleton*.
%
%      DIVERSITYGAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIVERSITYGAIN.M with the given input arguments.
%
%      DIVERSITYGAIN('Property','Value',...) creates a new DIVERSITYGAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DiversityGain_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DiversityGain_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DiversityGain

% Last Modified by GUIDE v2.5 13-Mar-2015 16:27:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DiversityGain_OpeningFcn, ...
                   'gui_OutputFcn',  @DiversityGain_OutputFcn, ...
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


% --- Executes just before DiversityGain is made visible.
function DiversityGain_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DiversityGain (see VARARGIN)

% Choose default command line output for DiversityGain
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DiversityGain wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DiversityGain_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in SelectionDiversity.
function SelectionDiversity_Callback(hObject, eventdata, handles)
% hObject    handle to SelectionDiversity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
BERRayFadingChannel_SelDiversity();

% --- Executes on button press in egc.
function egc_Callback(hObject, eventdata, handles)
% hObject    handle to egc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
BERRayFadingChannel_EGC();

% --- Executes on button press in mrc.
function mrc_Callback(hObject, eventdata, handles)
% hObject    handle to mrc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
BERRayFadingChannel_MRC();

% --- Executes on button press in recdiversity.
function recdiversity_Callback(hObject, eventdata, handles)
% hObject    handle to recdiversity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
BERReceiverDiversity();

% --- Executes on button press in rayfading.
function rayfading_Callback(hObject, eventdata, handles)
% hObject    handle to rayfading (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
BERRayleighFadingChannel();


% --- Executes on button press in comp.
function comp_Callback(hObject, eventdata, handles)
% hObject    handle to comp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
DiversityMethodsSinglePlot();


% --- Executes on button press in ed.
function ed_Callback(hObject, eventdata, handles)
% hObject    handle to ed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ErgyDetectionRayChannel();
