function varargout = NeymanPearsonHypTesting(varargin)
% NEYMANPEARSONHYPTESTING M-file for NeymanPearsonHypTesting.fig
%      NEYMANPEARSONHYPTESTING, by itself, creates a new NEYMANPEARSONHYPTESTING or raises the existing
%      singleton*.
%
%      H = NEYMANPEARSONHYPTESTING returns the handle to a new NEYMANPEARSONHYPTESTING or the handle to
%      the existing singleton*.
%
%      NEYMANPEARSONHYPTESTING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEYMANPEARSONHYPTESTING.M with the given input arguments.
%
%      NEYMANPEARSONHYPTESTING('Property','Value',...) creates a new NEYMANPEARSONHYPTESTING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NeymanPearsonHypTesting_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NeymanPearsonHypTesting_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NeymanPearsonHypTesting

% Last Modified by GUIDE v2.5 13-Mar-2015 17:31:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @NeymanPearsonHypTesting_OpeningFcn, ...
    'gui_OutputFcn',  @NeymanPearsonHypTesting_OutputFcn, ...
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


% --- Executes just before NeymanPearsonHypTesting is made visible.
function NeymanPearsonHypTesting_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to NeymanPearsonHypTesting (see VARARGIN)

% Choose default command line output for NeymanPearsonHypTesting
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes NeymanPearsonHypTesting wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = NeymanPearsonHypTesting_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function pfa_Callback(hObject, eventdata, handles)
% hObject    handle to pfa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pfa as text
%        str2double(get(hObject,'String')) returns contents of pfa as a double


% --- Executes during object creation, after setting all properties.
function pfa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pfa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function var_Callback(hObject, eventdata, handles)
% hObject    handle to var (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of var as text
%        str2double(get(hObject,'String')) returns contents of var as a double


% --- Executes during object creation, after setting all properties.
function var_CreateFcn(hObject, eventdata, handles)
% hObject    handle to var (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Probability of False Alarm
Pfa = get(handles.pfa,'String');

if strcmp(Pfa,'Enter Value')
    msgbox('Please enter the value of Probability of False Alarm');
    return;
end

% Variance
Var = get(handles.var,'String');


%% For a single sample hypothesis
% H0 = x/u = 0
% H1 = x/u = 1

% Calculating the value of gamma
gamma = icdf('norm',1-str2num(Pfa),0,1); % Inverse CDF

% Calculating the Probability of Detection
Pd = 1-cdf('norm',gamma-1,0,1);
Pm = 1-Pd; % Probability of miss

String_SH{1} = 'Single Hypothesis';
String_SH{2} = ['Threshold (Gamma) = ' num2str(gamma)];
String_SH{3} = ['Probabilty of Detection = ' num2str(Pd)];
String_SH{4} = ['Probabilty of Miss = ' num2str(Pm)];

set(handles.sh,'String',String_SH);
set(handles.sh,'FontWeight','bold');
set(handles.sh,'FontSize',9);

%% For a composite sample hypothesis
% Consider the radar receiving a sine signal and its addition with
% noise

t = 0:.1:20;
x = sin(t); % Create sine signal.
y = awgn(x,10,'measured'); % Add white Gaussian noise.
figure;
subplot(3,1,1);
plot(t,x) % Plot both signals.
title('Original Signal s[n]');
xlabel('Time'); ylabel('Amplitude');

subplot(3,1,2);
plot(t,y);
title('Signal with noise s[n]+w[n]');
xlabel('Time'); ylabel('Amplitude');

% Consider X[n] = w[n] for the null hypothesis, in this case 'y'
% Lets calculate the Probability of false alarm
% No of samples = 20
X=0;
for ii = 1:1:20
    X = X + (y(ii));
end

gamma_c = icdf('norm',((X-str2num(Pfa))/20),0,1);

X_2=0;
for ii = 1:1:20
    X_2 = X_2 + (y(ii)*x(ii));
end

Pd_c = 1-cdf('norm',((gamma_c-X_2)/20),0,1); % Probability of detection
Pm_c = 1-Pd_c; % Probability of miss

String_SH{1} = 'Composite Hypothesis';
String_SH{2} = ['Threshold (Gamma) = ' num2str(gamma_c)];
String_SH{3} = ['Probabilty of Detection = ' num2str(Pd_c)];
String_SH{4} = ['Probabilty of Miss = ' num2str(Pm_c)];

set(handles.ch,'String',String_SH);
set(handles.ch,'FontWeight','bold');
set(handles.ch,'FontSize',9);

ax_1 = subplot(3,1,3);
plot(t,y);
ylim(ax_1,[-gamma_c gamma_c]);
title('Detected Signal');
xlabel('Time'); ylabel('Amplitude');
