function varargout = clickbased(varargin)
% CLICKBASED MATLAB code for clickbased.fig
%      CLICKBASED, by itself, creates a new CLICKBASED or raises the existing
%      singleton*.
%
%      H = CLICKBASED returns the handle to a new CLICKBASED or the handle to
%      the existing singleton*.
%
%      CLICKBASED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CLICKBASED.M with the given input arguments.
%
%      CLICKBASED('Property','Value',...) creates a new CLICKBASED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before clickbased_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to clickbased_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help clickbased

% Last Modified by GUIDE v2.5 09-Mar-2017 12:52:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @clickbased_OpeningFcn, ...
                   'gui_OutputFcn',  @clickbased_OutputFcn, ...
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


% --- Executes just before clickbased is made visible.
function clickbased_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to clickbased (see VARARGIN)

% Choose default command line output for clickbased
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes clickbased wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = clickbased_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in loadbutton.
function loadbutton_Callback(hObject, eventdata, handles)
% hObject    handle to loadbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in browseb.
function browseb_Callback(hObject, eventdata, handles)
% hObject    handle to browseb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = uigetfile();
assignin('base','q',a);

% --- Executes on button press in searchbutton.
function searchbutton_Callback(hObject, eventdata, handles)
% hObject    handle to searchbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
r = evalin('base','rdata');
g = evalin('base','gdata');
b = evalin('base','bdata');
a = evalin('base','q');
im1 = imread(a);
im1gray = rgb2gray(im1);
rh = imhist(im1gray(:,:,1))/255;
gh = imhist(im1gray(:,1,:))/255;
bh = imhist(im1gray(1,:,:))/255;

for i=1:999
    d(i) = sqrt(sum((rh-r{i}).^2))+sqrt(sum((gh-g{i}).^2))+ sqrt(sum((bh-b{i}).^2));
end
new = sort(d);

for j=1:10
    for i=1:999
        if d(i) == new(j)
            save(j) = i;
            d(i) = -1;
        end
    end
end
%assignin('base','save',saver);
for j=1:10
    subplot(2,5,j),imshow(sprintf('%d.jpg',save(j)));
end



% --- Executes on button press in Image1.
function Image1_Callback(hObject, eventdata, handles)
% hObject    handle to Image1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
b = evalin('base','o1');
if(handles.Image1)
    b = b+1;
    assignin('base','o1',b);
end



% --- Executes on button press in Image2.
function Image2_Callback(hObject, eventdata, handles)
% hObject    handle to Image2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
b = evalin('base','o2');
if(handles.Image1)
    b = b+1;
    assignin('base','o2',b);
end


% --- Executes on button press in Image3.
function Image3_Callback(hObject, eventdata, handles)
% hObject    handle to Image3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
b = evalin('base','o3');
if(handles.Image1)
    b = b+1;
    assignin('base','o3',b);
end


% --- Executes on button press in Image4.
function Image4_Callback(hObject, eventdata, handles)
% hObject    handle to Image4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
b = evalin('base','o4');
if(handles.Image1)
    b = b+1;
    assignin('base','o4',b);
end


% --- Executes on button press in Image5.
function Image5_Callback(hObject, eventdata, handles)
% hObject    handle to Image5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
b = evalin('base','o5');
if(handles.Image1)
    b = b+1;
    assignin('base','o5',b);
end


% --- Executes on button press in Image10.
function Image10_Callback(hObject, eventdata, handles)
% hObject    handle to Image10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
b = evalin('base','o10');
if(handles.Image1)
    b = b+1;
    assignin('base','o10',b);
end


% --- Executes on button press in Image9.
function Image9_Callback(hObject, eventdata, handles)
% hObject    handle to Image9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
b = evalin('base','o9');
if(handles.Image1)
    b = b+1;
    assignin('base','o9',b);
end


% --- Executes on button press in Image8.
function Image8_Callback(hObject, eventdata, handles)
% hObject    handle to Image8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
b = evalin('base','o8');
if(handles.Image1)
    b = b+1;
    assignin('base','o8',b);
end


% --- Executes on button press in Image7.
function Image7_Callback(hObject, eventdata, handles)
% hObject    handle to Image7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
b = evalin('base','o7');
if(handles.Image1)
    b = b+1;
    assignin('base','o7',b);
end


% --- Executes on button press in Image6.
function Image6_Callback(hObject, eventdata, handles)
% hObject    handle to Image6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
b = evalin('base','o6');
if(handles.Image1)
    b = b+1;
    assignin('base','o6',b);
end


% --- Executes on button press in ResearchB.
function ResearchB_Callback(hObject, eventdata, handles)
% hObject    handle to ResearchB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
X(1) = evalin('base','o1');
X(2) = evalin('base','o2');
X(3) = evalin('base','o3');
X(4) = evalin('base','o4');
X(5) = evalin('base','o5');
X(6) = evalin('base','o6');
X(7) = evalin('base','o7');
X(8) = evalin('base','o8');
X(9) = evalin('base','o9');
X(10) = evalin('base','o10');
X1 = sort(X,'descend');
%display(X);
%display(X1);
r = evalin('base','rdata');
g = evalin('base','gdata');
b = evalin('base','bdata');
a = evalin('base','q');
im1 = imread(a);
im1gray = rgb2gray(im1);
rh = imhist(im1gray(:,:,1))/255;
gh = imhist(im1gray(:,1,:))/255;
bh = imhist(im1gray(1,:,:))/255;

for i=1:999
    d(i) = sqrt(sum((rh-r{i}).^2))+sqrt(sum((gh-g{i}).^2))+ sqrt(sum((bh-b{i}).^2));
end
new = sort(d);

for j=1:10
    for i=1:999
        if d(i) == new(j)
            save(j) = i;
            d(i) = -1;
        end
    end
end

for i=1:10
    for j=1:10
        if(X(j) == X1(i))
            UltraSave(i) = j;
            X(j) = -1;
            break
        end
    end
end
%display(UltraSave);
for j=1:10
    subplot(2,5,j),imshow(sprintf('%d.jpg',save(UltraSave(j))));
end

            
