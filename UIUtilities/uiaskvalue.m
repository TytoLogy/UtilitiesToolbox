function varargout = uiaskvalue(varargin)
% UIASKVALUE MATLAB code for uiaskvalue.fig
%      UIASKVALUE by itself, creates a new UIASKVALUE or raises the
%      existing singleton*.
%
%      H = UIASKVALUE returns the handle to a new UIASKVALUE or the handle to
%      the existing singleton*.
%
%      UIASKVALUE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UIASKVALUE.M with the given input arguments.
%
%      UIASKVALUE('Property','Value',...) creates a new UIASKVALUE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before uiaskvalue_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to uiaskvalue_OpeningFcn via varargin.
% 				case 'value'
% 					if ischar(varargin{index+1})
% 						handles.ValueType = 'CHAR';
% 						handles.Value = varargin{index+1};
% 					else
% 						handles.ValueType = 'NUM';
% 						handles.Value = varargin{index+1};
% 					end
% 
% 				case 'valuetype'
% 					if isequal(lower(varargin{index+1}), 'CHAR')
% 						handles.ValueType = 'CHAR';
% 					elseif isequal(lower(varargin{index+1}), 'NUM')
% 						handles.ValueType = 'NUM';
% 					else
% 						disp('Invalid VALUETYPE, using default (NUM)')
% 						handles.ValueType = 'NUM';
% 					end
% 
% 				case 'valuetext'
% 					update_ui_str(handles.ValueText, [varargin{index+1} ':']);
% 					
% 				case 'questiontext'
% 					update_ui_str(handles.QuestionText, varargin{index+1});
% 					
% 				case 'figurename'
% 					set(handles.figure1, 'Name', varargin{index+1});%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help uiaskvalue

% Last Modified by GUIDE v2.5 10-Dec-2012 17:54:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @uiaskvalue_OpeningFcn, ...
                   'gui_OutputFcn',  @uiaskvalue_OutputFcn, ...
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
%******************************************************************************
%******************************************************************************
%******************************************************************************

%******************************************************************************
%******************************************************************************
%******************************************************************************
%% Essential Functions
%******************************************************************************
%******************************************************************************
%******************************************************************************

%------------------------------------------------------------------------------
%------------------------------------------------------------------------------
% --- Executes just before uiaskvalue is made visible.
function uiaskvalue_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to uiaskvalue (see VARARGIN)
%------------------------------------------------------------------------------

	if(nargin <= 3)
		% Choose default command line output for uiaskvalue
		handles.ValueType = 'NUM';
		handles.Value = 0;
		update_ui_str(handles.ValueText, '');
		update_ui_str(handles.QuestionText, '');
		set(handles.figure1, 'Name', '');

	else
		for index = 1:2:(nargin-3)

			if (nargin-3) == index
				break
			end

			switch lower(varargin{index})
				case 'value'
					if ischar(varargin{index+1})
						handles.ValueType = 'CHAR';
						handles.Value = varargin{index+1};
					else
						handles.ValueType = 'NUM';
						handles.Value = varargin{index+1};
					end

				case 'valuetype'
% 					fprintf('setting %s to %s\n', varargin{index}, varargin{index+1})
					if isequal(upper(varargin{index+1}), 'CHAR')
						handles.ValueType = 'CHAR';
					elseif isequal(upper(varargin{index+1}), 'NUM')
						handles.ValueType = 'NUM';
					else
						disp('Invalid VALUETYPE, using default (NUM)')
						handles.ValueType = 'NUM';
					end

				case 'valuetext'
					update_ui_str(handles.ValueText, [varargin{index+1} ':']);
					
				case 'questiontext'
					update_ui_str(handles.QuestionText, varargin{index+1});
					
				case 'figurename'
					set(handles.figure1, 'Name', varargin{index+1});
				
				otherwise
					fprintf('WTF???  %s', varargin{index+1});
			end
		end
	end
	% store Value as output
	handles.output = handles.Value;
	handles.OriginalValue = handles.Value;
	% Update handles structure
	guidata(hObject, handles);
	
	% update gui
	update_ui_str(handles.ValueCtrl, handles.Value);
	
	update_ui_str(handles.SaveCtrl, 'Accept');
	update_ui_str(handles.CancelCtrl, 'Cancel');
	
	% Determine the position of the dialog - centered on the callback figure
	% if available, else, centered on the screen
	FigPos=get(0,'DefaultFigurePosition');
	OldUnits = get(hObject, 'Units');
	set(hObject, 'Units', 'pixels');
	OldPos = get(hObject,'Position');
	FigWidth = OldPos(3);
	FigHeight = OldPos(4);
	if isempty(gcbf)
		 ScreenUnits=get(0,'Units');
		 set(0,'Units','pixels');
		 ScreenSize=get(0,'ScreenSize');
		 set(0,'Units',ScreenUnits);
		 FigPos(1)=1/2*(ScreenSize(3)-FigWidth);
		 FigPos(2)=2/3*(ScreenSize(4)-FigHeight);
	else
		 GCBFOldUnits = get(gcbf,'Units');
		 set(gcbf,'Units','pixels');
		 GCBFPos = get(gcbf,'Position');
		 set(gcbf,'Units',GCBFOldUnits);
		 FigPos(1:2) = [(GCBFPos(1) + GCBFPos(3) / 2) - FigWidth / 2, ...
							 (GCBFPos(2) + GCBFPos(4) / 2) - FigHeight / 2];
	end
	FigPos(3:4)=[FigWidth FigHeight];
	set(hObject, 'Position', FigPos);
	set(hObject, 'Units', OldUnits);
		
	% Make the GUI modal
	set(handles.figure1,'WindowStyle','modal')
	% UIWAIT makes uiaskvalue wait for user response (see UIRESUME)
	uiwait(handles.figure1);
%------------------------------------------------------------------------------
%------------------------------------------------------------------------------

%------------------------------------------------------------------------------
%------------------------------------------------------------------------------
% --- Outputs from this function are returned to the command line.
function varargout = uiaskvalue_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%------------------------------------------------------------------------------
	% Get default command line output from handles structure
	varargout{1} = handles.output;

	% The figure can be deleted now
	delete(handles.figure1);
%------------------------------------------------------------------------------
%------------------------------------------------------------------------------
%******************************************************************************
%******************************************************************************
%******************************************************************************


%******************************************************************************
%******************************************************************************
%******************************************************************************
%% Action Functions
%******************************************************************************
%******************************************************************************
%******************************************************************************

%------------------------------------------------------------------------------
%------------------------------------------------------------------------------
% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'waitstatus'), 'waiting')
    % The GUI is still in UIWAIT, us UIRESUME
    uiresume(hObject);
else
    % The GUI is no longer waiting, just close it
    delete(hObject);
end
%------------------------------------------------------------------------------
%------------------------------------------------------------------------------

%------------------------------------------------------------------------------
%------------------------------------------------------------------------------
% --- Executes on key press over figure1 with no controls selected.
function figure1_KeyPressFcn(hObject, eventdata, handles)
	% Check for "enter" or "escape"
	if isequal(get(hObject,'CurrentKey'),'escape')
		% User said no by hitting escape
		handles.output = 'No';
		% Update handles structure
		guidata(hObject, handles);
		% resume
		uiresume(handles.figure1);
	end    

	if isequal(get(hObject,'CurrentKey'),'return')
		 uiresume(handles.figure1);
	end    
%------------------------------------------------------------------------------
%------------------------------------------------------------------------------
%******************************************************************************
%******************************************************************************
%******************************************************************************


%******************************************************************************
%******************************************************************************
%******************************************************************************
%% CALLBACKS
%******************************************************************************
%******************************************************************************
%******************************************************************************

%------------------------------------------------------------------------------
%------------------------------------------------------------------------------
% --- Executes on button press in SaveCtrl.
function SaveCtrl_Callback(hObject, eventdata, handles)
	handles.output = handles.Value;

	% Update handles structure
	guidata(hObject, handles);

	% Use UIRESUME instead of delete because the OutputFcn needs
	% to get the updated handles structure.
	uiresume(handles.figure1);
%------------------------------------------------------------------------------
%------------------------------------------------------------------------------

%------------------------------------------------------------------------------
%------------------------------------------------------------------------------
% --- Executes on button press in CancelCtrl.
function CancelCtrl_Callback(hObject, eventdata, handles)
	handles.output = handles.OriginalValue;

	% Update handles structure
	guidata(hObject, handles);

	% Use UIRESUME instead of delete because the OutputFcn needs
	% to get the updated handles structure.
	uiresume(handles.figure1);
%------------------------------------------------------------------------------
%------------------------------------------------------------------------------

%------------------------------------------------------------------------------
%------------------------------------------------------------------------------
function ValueCtrl_Callback(hObject, eventdata, handles)
	if isequal(handles.ValueType, 'CHAR')
		newVal = read_ui_str(hObject);
	else
		newVal = read_ui_str(hObject, 'n');
	end	
	handles.Value = newVal;
	guidata(hObject, handles);
%------------------------------------------------------------------------------
%------------------------------------------------------------------------------

%******************************************************************************
%******************************************************************************
%******************************************************************************


%******************************************************************************
%******************************************************************************
%******************************************************************************
%% Executes during object creation, after setting all properties.
%******************************************************************************
%******************************************************************************
%******************************************************************************
function ValueCtrl_CreateFcn(hObject, eventdata, handles)
	if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
		set(hObject,'BackgroundColor','white');
	end
%******************************************************************************
%******************************************************************************
%******************************************************************************
