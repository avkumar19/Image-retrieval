function varargout = newclickbased(varargin)
% NEWCLICKBASED MATLAB code for newclickbased.fig
%      NEWCLICKBASED, by itself, creates a new NEWCLICKBASED or raises the existing
%      singleton*.
%
%      H = NEWCLICKBASED returns the handle to a new NEWCLICKBASED or the handle to
%      the existing singleton*.
%
%      NEWCLICKBASED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEWCLICKBASED.M with the given input arguments.
%
%      NEWCLICKBASED('Property','Value',...) creates a new NEWCLICKBASED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before newclickbased_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to newclickbased_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help newclickbased

% Last Modified by GUIDE v2.5 07-Mar-2017 23:04:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @newclickbased_OpeningFcn, ...
                   'gui_OutputFcn',  @newclickbased_OutputFcn, ...
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


% --- Executes just before newclickbased is made visible.
function newclickbased_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to newclickbased (see VARARGIN)

% Choose default command line output for newclickbased
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes newclickbased wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = newclickbased_OutputFcn(hObject, eventdata, handles) 
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
project1;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
r = evalin('base','rdata');
g = evalin('base','gdata');
b = evalin('base','bdata');

im1 = imread('486.jpg');
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
for j=1:10
    subplot(2,5,j),imshow(sprintf('%d.jpg',save(j)));
end

            