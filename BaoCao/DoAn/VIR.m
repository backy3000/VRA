function varargout = VIR(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @VIR_OpeningFcn, ...
                   'gui_OutputFcn',  @VIR_OutputFcn, ...
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

function VIR_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

guidata(hObject, handles);

function varargout = VIR_OutputFcn(hObject, eventdata, handles) 



varargout{1} = handles.output;


%Ham chon anh
function btnBrowser_Callback(hObject, eventdata, handles)

global imgObj ImgQuery;
global x l;
global handlesImg handlesImgObj;
x=[1 4];
l=cell(1,4);
handlesImgObj=handles.imgObj;
handlesImg=cell(1,5);
handlesImg{1}=handles.imgObj1;
handlesImg{2}=handles.imgObj2;
handlesImg{3}=handles.imgObj3;
handlesImg{4}=handles.imgObj4;
handlesImg{5}=handles.imgObj5;
for i=1:5
    cla(handlesImg{i},'reset');
end

[name,path]=uigetfile({'*.*'});
if ~isequal(name,0)
    imgurl=strcat(path,name);
    imginfo=imfinfo(imgurl);
    x(1)=1;
    x(2)=imginfo.Width;
    x(3)=1;
    x(4)=imginfo.Height;
    imgObj=imread(imgurl);
    axes(handles.imgObj);
    h=imshow(imgObj);    
    set(h, 'buttondownfcn', @load_rectangle);
    load_line();
    
    ImgQuery = im2single(rgb2gray(imgObj));    
else
    return;
end

%Ham goi xu ly
function btnProcess_Callback(hObject, eventdata, handles)
global handlesImg x ImgQuery;
%Xu ly
[ids dists ImgQuery verbose files]=processImage(x,ImgQuery);
for i=1:size(ids{1},2)
    % Show 5 anh top
    if verbose==1 && i<=5
        axes(handlesImg{i});
        imshow(imread(fullfile('oxford\images\', files(ids{1}(i)).name)));
        title(files(ids{1}(i)).name);
    end
end

%Ham lay toa do cua vung duoc chon
function load_rectangle(hObject, eventdata)
global handlesImgObj x;
rect = getrect(handlesImgObj);

X1 = round(rect(1));
Y1 = round(rect(2));
X2 = round(X1 + rect(3));
Y2 = round(Y1 + rect(4));

x=[X1 X2 Y1 Y2];
load_line();


%Ham ve vung duoc chon
function load_line()
global handlesImgObj x l;
if ~isempty(l{1})
    for i=1:4
        delete(l{i});
    end
end
axes(handlesImgObj);
hold on;
l{1}=plot([x(1) x(2)], [x(3) x(3)], 'g');
l{2}=plot([x(2) x(2)], [x(3) x(4)], 'g');
l{3}=plot([x(2) x(1)], [x(4) x(4)], 'g');
l{4}=plot([x(1) x(1)], [x(4) x(3)], 'g');
hold off;
