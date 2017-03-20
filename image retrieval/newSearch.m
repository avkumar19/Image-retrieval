function varargout = newSearch(varargin)
% NEWSEARCH MATLAB code for newSearch.fig
%      NEWSEARCH, by itself, creates a new NEWSEARCH or raises the existing
%      singleton*.
%
%      H = NEWSEARCH returns the handle to a new NEWSEARCH or the handle to
%      the existing singleton*.
%
%      NEWSEARCH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEWSEARCH.M with the given input arguments.
%
%      NEWSEARCH('Property','Value',...) creates a new NEWSEARCH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before newSearch_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to newSearch_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help newSearch

% Last Modified by GUIDE v2.5 30-Jan-2017 18:19:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @newSearch_OpeningFcn, ...
                   'gui_OutputFcn',  @newSearch_OutputFcn, ...
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


% --- Executes just before newSearch is made visible.
function newSearch_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to newSearch (see VARARGIN)

% Choose default command line output for newSearch
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes newSearch wait for user response (see UIRESUME)
% uiwait(handles.figure1);
function imageno_Callback(hObject, eventdata, handles)
% hObject    handle to imageno (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of imageno as text
%        str2double(get(hObject,'String')) returns contents of imageno as a double


% --- Executes during object creation, after setting all properties.
function imageno_CreateFcn(hObject, eventdata, handles)
% hObject    handle to imageno (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Outputs from this function are returned to the command line.
function varargout = newSearch_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in mainButton.
function mainButton_Callback(hObject, eventdata, handles)
% hObject    handle to mainButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
clear all;
c=cell(1,999);
rdata = cell(1,999);
gdata = cell(1,999);
bdata = cell(1,999);
for i=1:999
c{i}=imread(sprintf('%d.jpg',i));
im = rgb2gray(c{i});
rdata{i} = imhist(im(:,:,1))/255;
gdata{i} = imhist(im(:,1,:))/255;
bdata{i} = imhist(im(1,:,:))/255;
end
%q = str2num(get(handles.imageno,'String'))
im1 = imread(sprintf('%d.jpg',q));
im1gray = rgb2gray(im1);
rh = imhist(im1gray(:,:,1))/255;
gh = imhist(im1gray(:,1,:))/255;
bh = imhist(im1gray(1,:,:))/255;

for i=1:999
    d(i) = sqrt(sum((rh-rdata{i}).^2))+sqrt(sum((gh-gdata{i}).^2))+ sqrt(sum((bh-bdata{i}).^2));
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

            
