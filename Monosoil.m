function varargout = Monosoil(varargin)
% MONOSOIL MATLAB code for Monosoil.fig
%      MONOSOIL, by itself, creates a new MONOSOIL or raises the existing
%      singleton*.
%
%      H = MONOSOIL returns the handle to a new MONOSOIL or the handle to
%      the existing singleton*.
%
%      MONOSOIL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MONOSOIL.M with the given input arguments.
%
%      MONOSOIL('Property','Value',...) creates a new MONOSOIL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Monosoil_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Monosoil_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Monosoil

% Last Modified by GUIDE v2.5 26-Jun-2020 08:18:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Monosoil_OpeningFcn, ...
                   'gui_OutputFcn',  @Monosoil_OutputFcn, ...
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


% --- Executes just before Monosoil is made visible.
%---- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function Monosoil_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Monosoil (see VARARGIN)
handles.GeneralQuestion =readtable('General2Question.xlsx'); %gets questions from an excel file
handles.General2Question =readtable('General2Question.xlsx'); %gets questions from an excel file
handles.LabQuestion=readtable('LabQuestions.xlsx'); %gets questions from an excel file
handles.Lab2Question=readtable('Lab2Questions.xlsx'); %gets questions from an excel file
set(handles.AnswerPanel,'visible','off')%makes answer panel visible
set(handles.AnswerCheckButton,'visible','off') %makes the answercheck button available
set(handles.command_text,'string','Welcome to Monosoil! To start click dice button.') %
handles.Pc8=0  % Pc's are preconsolidation pressure of NC clays.
handles.Pc27=0   % Pc's are preconsolidation pressure of NC clays.
handles.selection=1;
handles.table.Data{1,1}=0;
handles.table.Data{2,1}=0;
handles.table.Data{3,1}=0;
handles.table.Data{1,2}=300;
handles.table.Data{2,2}=300;
handles.table.Data{3,2}=300;
handles.owner = zeros(1,37);

% Choose default command line output for Monosoil
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Monosoil wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
% --- THIS PART CREATED BY MATLAB AUTOMATICALLY
function varargout = Monosoil_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
% --- Executes on button press in start_button.

% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function start_button_Callback(hObject, eventdata, handles)
handles.dice.Enable='on';
TeamNumber =handles.team_button.Value;
handles.start_button.Enable='off';%disables start button
switch 1
    case TeamNumber==1
        handles.table.Data{1,2}=handles.table.Data{1,2}+100;%team 2gets 100 money by clicking if team 1 wins, winner will be shown
                 if handles.table.Data{1,2}>=3000 
                         handles.mainpanel.Visible='Off';
                        handles.win1.Visible='On';
                        end
    case TeamNumber==2
        handles.table.Data{2,2}=handles.table.Data{2,2}+100;%team 2gets 100 money by clicking if team 2 wins, winner will be shown
                 if handles.table.Data{2,2}>=3000 
                         handles.mainpanel.Visible='Off';
                        handles.win2.Visible='On';
                        end
    case TeamNumber==3
        handles.table.Data{3,2}=handles.table.Data{3,2}+100;%team 2gets 100 money by clicking if team 3 wins, winner will be shown
                 if handles.table.Data{3,2}>=3000 
                         handles.mainpanel.Visible='Off';
                        handles.win3.Visible='On';
                        end
end
guidata(hObject, handles);
% hObject    handle to start_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in g1_new.
% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function g1_new_Callback(hObject, eventdata, handles)
handles.g1_new.Enable='off';%%%disables itself
% hObject    handle to g1_new (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.AnswerPanel,'visible','on');
set(handles.AnswerCheckButton,'visible','on');
x=handles.selection %to get team number
Location= handles.table.Data{x,1} % to get team location
owner=handles.owner(Location) % to get owner of the location
if  owner == 0 || owner == x
    
Maksnum=max(handles.GeneralQuestion.Number)
number=randi([1,Maksnum],1) 
chose1=handles.GeneralQuestion.A(number)
chose2=handles.GeneralQuestion.B(number)
chose3=handles.GeneralQuestion.C(number)
chose4=handles.GeneralQuestion.D(number)
ans=handles.GeneralQuestion.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.GeneralQuestion.Question{number}
set(handles.command_text,'string',question)
else 
    Maksnum=max(handles.General2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.General2Question.A(number)
chose2=handles.General2Question.B(number)
chose3=handles.General2Question.C(number)
chose4=handles.General2Question.D(number)
ans=handles.General2Question.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.General2Question.Question{number}
set(handles.command_text,'string',question)
    
end
guidata(hObject, handles)
% --- Executes on button press in g2.
% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function g2_Callback(hObject, eventdata, handles)
handles.g2.Enable='off';
% hObject    handle to g1_new (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.AnswerPanel,'visible','on');
set(handles.AnswerCheckButton,'visible','on');
x=handles.selection %to get team number
Location= handles.table.Data{x,1} % to get team location
owner=handles.owner(Location) % to get owner of the location
if  owner == 0 || owner == x
    
Maksnum=max(handles.GeneralQuestion.Number)
number=randi([1,Maksnum],1) 
chose1=handles.GeneralQuestion.A(number)
chose2=handles.GeneralQuestion.B(number)
chose3=handles.GeneralQuestion.C(number)
chose4=handles.GeneralQuestion.D(number)
ans=handles.GeneralQuestion.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.GeneralQuestion.Question{number}
set(handles.command_text,'string',question)
else 
    Maksnum=max(handles.General2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.General2Question.A(number)
chose2=handles.General2Question.B(number)
chose3=handles.General2Question.C(number)
chose4=handles.General2Question.D(number)
ans=handles.General2Question.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.General2Question.Question{number}
set(handles.command_text,'string',question)
    
end
guidata(hObject, handles)

% --- Executes on button press in taxi_button.
% --- THIS PART IS WRITTEN BY AHMET DOLMA
function taxi_button_Callback(hObject, eventdata, handles)
handles.heytaxi.Visible='on';%%shows heytaxi panel
handles.taxi_button.Enable='off';%%disables heytaxi button
% hObject    handle to taxi_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in bns1.
% --- THIS PART CREATED BY MATLAB AUTOMATICALLY
function bns1_Callback(hObject, eventdata, handles)
% hObject    handle to bns1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in oops27.
% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function oops27_Callback(hObject, eventdata, handles)
handles.dice.Enable='on';%%%enables dice
handles.oops27.Enable='off';%%disables ooops clay button
% hObject    handle to oops27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.AnswerPanel,'visible','off')
set(handles.AnswerCheckButton,'visible','off')
set(handles.command_text,'string','Subground soil is Normally Consolidated Clay. You must wait for consolidation. 10 percent of your money will be lost')
handles.selection=handles.team_button.Value;
x=handles.selection;
switch 1
    case x==1
        if handles.Pc27 <  handles.table.Data{1,2}
            handles.Pc27= handles.table.Data{1,2}
            set(handles.command_text,'string','Subground soil is Normally Consolidated Clay. You must wait for consolidation. 10 percent of your money will be lost')
            Pr=handles.Pc27 %Pr used to get numerical value in handles.Pc27
            text=['Pc=',num2str(Pr)]
            set(handles.oops27,'string',text)
            handles.lost1=handles.table.Data{1,2}/10;
            handles.table.Data{1,2}=handles.table.Data{1,2}-handles.lost1;
            handles.team_button.Value=2;
        else
            set(handles.command_text,'string','Your Money is less than Pc of the soil. You dont need to pay money for consolidation. Wait for your turn')
            handles.Pc27=handles.Pc27
        end
    case x==2
        handles.team_button.Value=3;
        if handles.Pc27 <  handles.table.Data{2,2}
            handles.Pc27= handles.table.Data{2,2}
            set(handles.command_text,'string','Subground soil is Normally Consolidated Clay. You must wait for consolidation. 10 percent of your money will be lost')
            Pr=handles.Pc27 %Pr used to get numerical value in handles.Pc8
            text=['Pc=',num2str(Pr)]
            set(handles.oops27,'string',text)
            handles.lost2=handles.table.Data{2,2}/10;
            handles.table.Data{2,2}=handles.table.Data{2,2}-handles.lost2;
        else
            set(handles.command_text,'string','Your Money is less than Pc of the soil. You dont need to pay money for consolidation. Wait for your turn')
            handles.Pc27=handles.Pc27
        end
    case x==3
        handles.team_button.Value=1;
        if handles.Pc27 <  handles.table.Data{3,2}
            handles.Pc27= handles.table.Data{3,2}
            set(handles.command_text,'string','Subground soil is Normally Consolidated Clay. You must wait for consolidation. 10 percent of your money will be lost')
            Pr=handles.Pc27 %Pr used to get numerical value in handles.Pc27
            text=['Pc=',num2str(Pr)]
            set(handles.oops27,'string',text)
            handles.lost3=handles.table.Data{3,2}/10;
            handles.table.Data{3,2}=handles.table.Data{3,2}-handles.lost3;
        else
            set(handles.command_text,'string','Your Money is less than Pc of the soil. You dont need to pay money for consolidation. Wait for your turn')
            handles.Pc27=handles.Pc27
        end
end
guidata(hObject,handles)

% --- Executes on button press in goodluck_button2.
% --- THIS PART IS WRITTEN BY AHMET DOLMA
function goodluck_button2_Callback(hObject, eventdata, handles)%%%%% same as goodluck_button1
handles.goodluck_button2.Enable='off';
handles.panel_luck.Visible='on'%
B=randperm(60);
b=B(1);
switch 1
    case 1<=b&&b<=7
        handles.txt_luck.String='Choose a General or Lab Test Question.If you answer the question correctly,take 150 money from the bank.If not, lose 150 money';
        handles.check_luck.Visible='on'
    case 7<b&&b<=14
        handles.txt_luck.String='Dice once. If it is an even number, get 100 money from other teams, if you get an odd number, pay 100 to them'
        handles.dice_luck.Visible='on'
    case 14<b&&b<=21
        handles.txt_luck.String='Dice twice. If total is between 6-12, take 200 cash from the bank'
        handles.dice_luck2.Visible='on'
    case 21<b&&b<=28
        handles.txt_luck.String='Take 50 money from other teams'
        handles.getmoney3.Visible='On'
    case 28<b&&b<=35
        handles.txt_luck.String='Pay your Taxes! Pay 50 money to the bank'
        handles.getmoney4.Visible='On'
        
        %--------------another big case---------------
    case 35<b&&b<=42
        handles.txt_luck.String='If you have 1500 money or more, give 100 money to the bank; if not, raise your money to 1500'
       x=handles.selection;    
       handles.getmoney5.Visible='on';
                    %first team
                       if x==1
                                       if 1500<=handles.table.Data{1,2}
                                           handles.getmoney5.String='Pay Money'
                                       else
                                            handles.getmoney5.String='1500$'
                                                end
                       elseif x==2
                                         if 1500<=handles.table.Data{2,2}
                                        handles.getmoney5.String='Pay Money'
                                         else
                                         handles.getmoney5.String='1500$'
                                         end
                       elseif x==3
                                    if 1500<=handles.table.Data{3,2}
                                        handles.getmoney5.String='Pay Money'
                                    else
                                        handles.getmoney5.String='1500$'
                                    end
                       end    
    case 42<b&&b<=46
        handles.txt_luck.String='Change money with another team'
        handles.panel_change.Visible='On'
        x=handles.selection;
            switch 1
               case x==1
                handles.change1.Enable='off';handles.change2.Enable='on';handles.change3.Enable='on';
                case x==2
                  handles.change2.Enable='off';handles.change1.Enable='on';handles.change3.Enable='on';
                  case x==3
                 handles.change3.Enable='off';handles.change2.Enable='on';handles.change1.Enable='on';
            end
%%%%%%%%%%%%%%%%%another big case%%%%%%%%%%%%%%%%%%
    case 46<b&&b<=50
        handles.txt_luck.String='Change location with another team and take 150 money from them'
        handles.panel_loc_change.Visible='On'
        x=handles.selection;
            switch 1
               case x==1
                handles.loc1.Enable='off';handles.loc2.Enable='on';handles.loc3.Enable='on';
                case x==2
                  handles.loc2.Enable='off';handles.loc1.Enable='on';handles.loc3.Enable='on';
                  case x==3
                 handles.loc3.Enable='off';handles.loc2.Enable='on';handles.loc1.Enable='on';
            end
    case 50<b&&b<=60
        handles.txt_luck.String='Dice once.If it is between 1 or 2, take half of your money from the bank'
        handles.dice_luck3.Visible='On';
end

         
         
         
        % hObject    handle to goodluck_button2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in oops8.
% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function oops8_Callback(hObject, eventdata, handles)%%same as oops27 button
handles.oops8.Enable='off'; %enables oops8 clay
handles.dice.Enable='on';  %enables dice
% hObject    handle to oops8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.AnswerPanel,'visible','off')
set(handles.AnswerCheckButton,'visible','off')
set(handles.command_text,'string','Subground soil is Normally Consolidated Clay. You must wait for consolidation. 10 percent of your money will be lost')
handles.selection=handles.team_button.Value;
x=handles.selection;
switch 1
    case x==1
        handles.team_button.Value=2;
        if handles.Pc8<handles.table.Data{1,2}
            handles.Pc8= handles.table.Data{1,2}
            set(handles.command_text,'string','Subground soil is Normally Consolidated Clay. You must wait for consolidation. 10 percent of your money will be lost')
            Pr=handles.Pc8 %Pr used to get numerical value in handles.Pc8
            text=['Pc=',num2str(Pr)]
            set(handles.oops8,'string',text)
            handles.lost1=handles.table.Data{1,2}/10;
            handles.table.Data{1,2}=handles.table.Data{1,2}-handles.lost1;
            
        else
            set(handles.command_text,'string','Your Money is less than Pc of the soil. You dont need to pay money for consolidation. Wait for your turn')
            handles.Pc8=handles.Pc8
        end
    case x==2
        handles.team_button.Value=3;
        if handles.Pc8 <  handles.table.Data{2,2}
            handles.Pc8= handles.table.Data{2,2}
            set(handles.command_text,'string','Subground soil is Normally Consolidated Clay. You must wait for consolidation. 10 percent of your money will be lost')
            Pr=handles.Pc8 %Pr used to get numerical value in handles.Pc8
            text=['Pc=',num2str(Pr)]
            set(handles.oops8,'string',text)
            handles.lost2=handles.table.Data{2,2}/10;
            handles.table.Data{2,2}=handles.table.Data{2,2}-handles.lost2;
        else
            set(handles.command_text,'string','Your Money is less than Pc of the soil. You dont need to pay money for consolidation. Wait for your turn')
            handles.Pc8=handles.Pc8
        end
    case x==3
        handles.team_button.Value=1;
        if handles.Pc8 <  handles.table.Data{3,2}
            handles.Pc8= handles.table.Data{3,2}
            set(handles.command_text,'string','Subground soil is Normally Consolidated Clay. You must wait for consolidation. 10 percent of your money will be lost')
            Pr=handles.Pc8 %Pr used to get numerical value in handles.Pc8
            text=['Pc=',num2str(Pr)]
            set(handles.oops8,'string',text)
            handles.lost3=handles.table.Data{3,2}/10;
            handles.table.Data{3,2}=handles.table.Data{3,2}-handles.lost3;
        else
            set(handles.command_text,'string','Your Money is less than Pc of the soil. You dont need to pay money for consolidation. Wait for your turn')
            handles.Pc8=handles.Pc8
        end
end
guidata(hObject,handles)
% --- Executes on button press in Universal_button.
% --- THIS PART IS WRITTEN BY AHMET DOLMA
function Universal_button_Callback(hObject, eventdata, handles)
handles.uni1.Enable='on';%%enables team 1 team 2 team 3 options in uni panel
handles.uni2.Enable='on';
handles.uni3.Enable='on';
handles.Universal_button.Enable='off';%disables itself
set(handles.universal_panel,'visible','on');%done
% hObject    handle to Universal_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton95.
function pushbutton95_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton95 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton96.
function pushbutton96_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton96 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in dice.
% --- THIS PART IS WRITTEN BY AHMET DOLMA
function dice_Callback(hObject, eventdata, handles)
handles.bonus_button.String='Show Bonuses'; %changes string to 'Show Bonusses'
handles.panelbonus1.Visible='Off'; %'Closes Bonus Panel 1'
handles.panelbonus2.Visible='Off'; %'Closes Bonus Panel 2'
handles.panelbonus3.Visible='Off'; %'Closes Bonus Panel 3'
handles.txt_luck.String=' ';  %empties luck card panel
handles.sorry.Visible='Off';     %closes 'Sorry :(' writing coming from luck cards
handles.dice_number.BackgroundColor=[1 1 1]; %dice number background becomes white
handles.panel_luck.Visible='off' %closes luck panel
set(handles.AnswerPanel,'visible','off')  %closes answer panel
set(handles.AnswerCheckButton,'visible','off')  %closes answer check button
set(handles.universal_panel,'visible','off')    % closes universal panel
set(handles.check_universal,'visible','off')    %closes check_universal button
set(handles.warning,'visible','off')    %%closes warning coming from taxi
set(handles.heytaxi,'visible','off')    %closes heytaxi panel
A=randperm(12);%dicing---choses a random for A(1)
handles.dice_number.String=num2str(A(1));%%%turns this value to String
team_number=handles.team_button.Value;%%%%
handles.selection=handles.team_button.Value;%team number is assigned to handles.selection
x=handles.selection; %team number is assigned as x
switch 1
    %ffirst team
    case x==1%%%if team 1 is selected in the pop up section, this will evaluate
        lc1=handles.table.Data{1,1};%%lc1 becomes the location value of team 1 
        lc1=lc1+A(1);%%%adds dice number to location value
        if lc1>37%%%%%%%if lc1 is bigger than 37, returns to 38-lc1 to start the table from beginning 
            handles.table.Data{1,2}=handles.table.Data{1,2}+100;%adds 100 money to team who passed start point
                        if handles.table.Data{1,2}>=3000 %if 3000 money has been reached, stop game and announce winner
                         handles.mainpanel.Visible='Off';%closes main panel(game panel,whole thing)
                        handles.win1.Visible='On';%announces the winner
                        end
            lc1=lc1-38;      %returns to table value
        end
        handles.table.Data{1,1}=lc1;%%%value of lc1 is assigned to the table
        handles.str_newnumber.String=num2str(lc1);%%%%New location is updated with respect to lc1 value (turned from number to string)
                            switch 1 %%%%%this switch is here to enable the button with respect to location
                                    case lc1==0
                                    handles.start_button.Enable='on';
                                    case lc1==1
                                    handles.g1_new.Enable='on';
                                    case lc1==2
                                    handles.g2.Enable='on';
                                    case lc1==3
                                    handles.lab3.Enable='on';
                                    case lc1==4
                                    handles.goodluck_button1.Enable='on';
                                    case lc1==5
                                    handles.lab5.Enable='on';
                                    case lc1==6
                                    handles.g6.Enable='on';
                                    case lc1==7
                                    handles.g7.Enable='on';
                                    case lc1==8
                                    handles.oops8.Enable='on';
                                    case lc1==9
                                    handles.g9.Enable='on';
                                    case lc1==10
                                    handles.Universal_button.Enable='on';
                                    case lc1==11
                                    handles.g11.Enable='on';
                                    case lc1==12
                                    handles.lab12.Enable='on';
                                    case lc1==13
                                    handles.g13.Enable='on';
                                    case lc1==14
                                    handles.goodluck_button2.Enable='on';
                                    case lc1==15
                                    handles.g15.Enable='on';
                                    case lc1==16
                                    handles.g16.Enable='on';
                                    case lc1==17
                                    handles.lab17.Enable='on';
                                    case lc1==18
                                    handles.g18.Enable='on';
                                    case lc1==19
                                    handles.lab19.Enable='on';
                                    case lc1==20
                                    handles.g20.Enable='on';
                                    case lc1==21
                                    handles.bns.Enable='on';
                                    case lc1==22
                                    handles.g22.Enable='on';
                                    case lc1==23
                                    handles.lab23.Enable='on';
                                    case lc1==24
                                    handles.goodluck_button3.Enable='on';
                                    case lc1==25
                                    handles.g25.Enable='on';
                                    case lc1==26
                                    handles.g26.Enable='on';
                                    case lc1==27
                                    handles.oops27.Enable='on';
                                    case lc1==28
                                    handles.lab28.Enable='on';
                                    case lc1==29
                                    handles.g29.Enable='on';
                                    case lc1==30
                                    handles.g30.Enable='on';
                                    case lc1==31
                                    handles.lab31.Enable='on';
                                    case lc1==32
                                    handles.g32.Enable='on';
                                    case lc1==33
                                    handles.bns2.Enable='on';
                                    case lc1==34
                                    handles.taxi_button.Enable='on';
                                    case lc1==35
                                    handles.lab35.Enable='on';
                                    case lc1==36
                                    handles.g36.Enable='on';
                                    case lc1==37
                                    handles.g37.Enable='on';
                            end
        %second team
    case x==2 %%%%%%%%%all same with x==1 case, look at line 479 for beginning
        lc2=handles.table.Data{2,1};
        lc2=lc2+A(1);
        if lc2>37
            handles.table.Data{2,2}=handles.table.Data{2,2}+100;
                        if handles.table.Data{2,2}>=3000 
                         handles.mainpanel.Visible='Off';
                        handles.win2.Visible='On';
                        end
            lc2=lc2-38;
        end
        handles.table.Data{2,1}=lc2;
        handles.str_newnumber.String=num2str(lc2);
        switch 1
                                    case lc2==0
                                    handles.start_button.Enable='on';
                                    case lc2==1
                                    handles.g1_new.Enable='on';
                                    case lc2==2
                                    handles.g2.Enable='on';
                                    case lc2==3
                                    handles.lab3.Enable='on';
                                    case lc2==4
                                    handles.goodluck_button1.Enable='on';
                                    case lc2==5
                                    handles.lab5.Enable='on';
                                    case lc2==6
                                    handles.g6.Enable='on';
                                    case lc2==7
                                    handles.g7.Enable='on';
                                    case lc2==8
                                    handles.oops8.Enable='on';
                                    case lc2==9
                                    handles.g9.Enable='on';
                                    case lc2==10
                                    handles.Universal_button.Enable='on';
                                    case lc2==11
                                    handles.g11.Enable='on';
                                    case lc2==12
                                    handles.lab12.Enable='on';
                                    case lc2==13
                                    handles.g13.Enable='on';
                                    case lc2==14
                                    handles.goodluck_button2.Enable='on';
                                    case lc2==15
                                    handles.g15.Enable='on';
                                    case lc2==16
                                    handles.g16.Enable='on';
                                    case lc2==17
                                    handles.lab17.Enable='on';
                                    case lc2==18
                                    handles.g18.Enable='on';
                                    case lc2==19
                                    handles.lab19.Enable='on';
                                    case lc2==20
                                    handles.g20.Enable='on';
                                    case lc2==21
                                    handles.bns.Enable='on';
                                    case lc2==22
                                    handles.g22.Enable='on';
                                    case lc2==23
                                    handles.lab23.Enable='on';
                                    case lc2==24
                                    handles.goodluck_button3.Enable='on';
                                    case lc2==25
                                    handles.g25.Enable='on';
                                    case lc2==26
                                    handles.g26.Enable='on';
                                    case lc2==27
                                    handles.oops27.Enable='on';
                                    case lc2==28
                                    handles.lab28.Enable='on';
                                    case lc2==29
                                    handles.g29.Enable='on';
                                    case lc2==30
                                    handles.g30.Enable='on';
                                    case lc2==31
                                    handles.lab31.Enable='on';
                                    case lc2==32
                                    handles.g32.Enable='on';
                                    case lc2==33
                                    handles.bns2.Enable='on';
                                    case lc2==34
                                    handles.taxi_button.Enable='on';
                                    case lc2==35
                                    handles.lab35.Enable='on';
                                    case lc2==36
                                    handles.g36.Enable='on';
                                    case lc2==37
                                    handles.g37.Enable='on';
                            end
    case x==3 %%%%%%%%%all same with x==1 case, look at line 479 for beginning
        handles.table.Data{3,2}=handles.table.Data{3,2}+100;
                        if handles.table.Data{3,2}>=3000 
                         handles.mainpanel.Visible='Off';
                        handles.win3.Visible='On';
                        end
        lc3=handles.table.Data{3,1};
        lc3=lc3+A(1);
        if lc3>37
            lc3=lc3-38;
        end
        handles.table.Data{3,1}=lc3;
        handles.str_newnumber.String=num2str(lc3);
        switch 1
                                    case lc3==0
                                    handles.start_button.Enable='on';
                                    case lc3==1
                                    handles.g1_new.Enable='on';
                                    case lc3==2
                                    handles.g2.Enable='on';
                                    case lc3==3
                                    handles.lab3.Enable='on';
                                    case lc3==4
                                    handles.goodluck_button1.Enable='on';
                                    case lc3==5
                                    handles.lab5.Enable='on';
                                    case lc3==6
                                    handles.g6.Enable='on';
                                    case lc3==7
                                    handles.g7.Enable='on';
                                    case lc3==8
                                    handles.oops8.Enable='on';
                                    case lc3==9
                                    handles.g9.Enable='on';
                                    case lc3==10
                                    handles.Universal_button.Enable='on';
                                    case lc3==11
                                    handles.g11.Enable='on';
                                    case lc3==12
                                    handles.lab12.Enable='on';
                                    case lc3==13
                                    handles.g13.Enable='on';
                                    case lc3==14
                                    handles.goodluck_button2.Enable='on';
                                    case lc3==15
                                    handles.g15.Enable='on';
                                    case lc3==16
                                    handles.g16.Enable='on';
                                    case lc3==17
                                    handles.lab17.Enable='on';
                                    case lc3==18
                                    handles.g18.Enable='on';
                                    case lc3==19
                                    handles.lab19.Enable='on';
                                    case lc3==20
                                    handles.g20.Enable='on';
                                    case lc3==21
                                    handles.bns.Enable='on';
                                    case lc3==22
                                    handles.g22.Enable='on';
                                    case lc3==23
                                    handles.lab23.Enable='on';
                                    case lc3==24
                                    handles.goodluck_button3.Enable='on';
                                    case lc3==25
                                    handles.g25.Enable='on';
                                    case lc3==26
                                    handles.g26.Enable='on';
                                    case lc3==27
                                    handles.oops27.Enable='on';
                                    case lc3==28
                                    handles.lab28.Enable='on';
                                    case lc3==29
                                    handles.g29.Enable='on';
                                    case lc3==30
                                    handles.g30.Enable='on';
                                    case lc3==31
                                    handles.lab31.Enable='on';
                                    case lc3==32
                                    handles.g32.Enable='on';
                                    case lc3==33
                                    handles.bns2.Enable='on';
                                    case lc3==34
                                    handles.taxi_button.Enable='on';
                                    case lc3==35
                                    handles.lab35.Enable='on';
                                    case lc3==36
                                    handles.g36.Enable='on';
                                    case lc3==37
                                    handles.g37.Enable='on';
                            end
end
handles.dice.Enable='off';%%%disables dice button
guidata(hObject,handles);


%it'll take 0 and make it a number to move 
%it'll evaluate location


% hObject    handle to dice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in team_button.
% --- THIS PART IS WRITTEN BY AHMET DOLMA
function team_button_Callback(hObject, eventdata, handles)
handles.selection=handles.team_button.Value;%%%updates team value to handles.selection
guidata(hObject,handles);
% hObject    handle to team_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns team_button contents as cell array
%        contents{get(hObject,'Value')} returns selected item from team_button


% --- Executes during object creation, after setting all properties.
% --- THIS PART IS WRITTEN BY AHMET DOLMA
function team_button_CreateFcn(hObject, eventdata, handles)
% hObject    handle to team_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over command_text.
function command_text_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to command_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton98.
function pushbutton98_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton98 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton99.
function pushbutton99_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton99 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in AnswerCheckButton.
% --- THIS PART IS WRITTEN BY AHMET DOLMA
function AnswerCheckButton_Callback(hObject, eventdata, handles)
handles.AnswerCheckButton.Visible='Off';%check answer button dissapears
handles.dice.Enable='on';%enables the dice button
% hObject    handle to AnswerCheckButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Muhammet
Answer=handles.answer; % This calls right answer from general question button.
selectedAnswer = handles.selectedAnswer; % This compares right answer in excel and seleected radio button.
tf=strcmp(selectedAnswer,Answer);
switch tf 
    case 1
    set(handles.command_text,'string','Right Answer!')
    x=handles.team_button.Value;
   
        switch 1
        case x==1
        handles.table.Data{1,2}=handles.table.Data{1,2}+100;
                        if handles.table.Data{1,2}>=3000 
                         handles.mainpanel.Visible='Off';
                        handles.win1.Visible='On';
                        end
        Location= handles.table.Data{1,1}
        handles.owner(Location)= 1
        color= [1 0 1] %Color of Team 1 'Magenta'
        handles.team_button.Value=2;
        
        case x==2
        handles.table.Data{2,2}=handles.table.Data{2,2}+100;
                        if handles.table.Data{2,2}>=3000 
                         handles.mainpanel.Visible='Off';
                        handles.win2.Visible='On';
                        end
        Location= handles.table.Data{2,1}
        handles.owner(Location)= 2
        color=[0.65 0.65 0.65] %color of team 2 'grey'
        handles.team_button.Value=3;
         handles.dice.Enable='On';
        case x==3
        handles.table.Data{3,2}=handles.table.Data{3,2}+100;
                            if handles.table.Data{3,2}>=3000 
                              handles.mainpanel.Visible='Off';
                                 handles.win3.Visible='On';
                            end
        Location= handles.table.Data{3,1}
        handles.owner(Location)= 3
        color=[0.64 0.08 0.18]
        handles.team_button.Value=1;
         handles.dice.Enable='On';
        end
        if Location == 1
            set(handles.g1_new,'BackGround',color)
        elseif Location == 2
             set(handles.g2,'BackGround',color)
        elseif Location == 2
             set(handles.g2,'BackGround',color)
        elseif Location == 3
             set(handles.lab3,'BackGround',color)
        elseif Location == 4
             set(handles.goodluck_button2,'BackGround',color)
         elseif Location == 5
             set(handles.lab5,'BackGround',color)
         elseif Location == 6
             set(handles.g6,'BackGround',color)
         elseif Location == 7
             set(handles.g7,'BackGround',color)
      
         elseif Location == 9
             set(handles.g9,'BackGround',color)
        elseif Location == 11
             set(handles.g11,'BackGround',color)
         elseif Location == 12
             set(handles.lab12,'BackGround',color)
        elseif Location == 13
             set(handles.g13,'BackGround',color)
        elseif Location == 15
             set(handles.g15,'BackGround',color)
        elseif Location == 16
             set(handles.g16,'BackGround',color)
        elseif Location == 17
             set(handles.lab17,'BackGround',color)
        elseif Location == 18
             set(handles.g18,'BackGround',color)
        elseif Location == 19
             set(handles.lab19,'BackGround',color)
        elseif Location == 20
             set(handles.g20,'BackGround',color)
        elseif Location == 22
             set(handles.g22,'BackGround',color)
        elseif Location == 23
             set(handles.lab23,'BackGround',color)
        elseif Location == 25
             set(handles.g25,'BackGround',color)
        elseif Location == 26
             set(handles.g26,'BackGround',color)
        elseif Location == 28
             set(handles.lab28,'BackGround',color)
        elseif Location == 29
             set(handles.g29,'BackGround',color)
        elseif Location == 30
             set(handles.g30,'BackGround',color)
        elseif Location == 31
             set(handles.lab31,'BackGround',color)
        elseif Location == 32
             set(handles.g32,'BackGround',color)
        elseif Location == 35
             set(handles.lab35,'BackGround',color)
        elseif Location == 36
             set(handles.g36,'BackGround',color)
        elseif Location == 37
             set(handles.g37,'BackGround',color)
        
        end

 otherwise
    set(handles.command_text,'string','Wrong Answer!')
    x=handles.selection
    switch 1
    case x==1
        handles.team_button.Value=2;
         handles.dice.Enable='On';
         Location= handles.table.Data{1,1} %to find current location
         owner =handles.owner(Location)% To get owner of the location
         if owner == 2 || owner == 3
         handles.table.Data{owner,2}=handles.table.Data{owner,2}+50
         handles.table.Data{1,2}=handles.table.Data{1,2}-50;
         elseif owner==0
         handles.table.Data{1,2}=handles.table.Data{1,2}-50;
         end
    case x==2
        handles.team_button.Value=3;
         handles.dice.Enable='On';
          Location= handles.table.Data{2,1}
          owner =handles.owner(Location)% To get owner of the location
         if owner ==1 || owner ==3
          handles.table.Data{2,2}=handles.table.Data{2,2}-50;
          handles.table.Data{owner,2}= handles.table.Data{owner,2}+50
         elseif owner==0
          handles.table.Data{2,2}=handles.table.Data{2,2}-50;
         end
    case x==3
        handles.team_button.Value=1;
         handles.dice.Enable='On';
          Location= handles.table.Data{3,1}
          owner =handles.owner(Location)% To get owner of the location
          if owner == 1 || owner == 2
         handles.table.Data{3,2}=handles.table.Data{3,2}-50;
         handles.table.Data{owner,2}= handles.table.Data{owner,2}+50
          elseif owner==0
         handles.table.Data{3,2}=handles.table.Data{3,2}-50;
          end
    end
end
guidata(hObject, handles);
%%%%%%%%%%%%%Ahmet Universal Part%%%%Timer for Universal%%%%%%%%%%



% --- Executes during object creation, after setting all properties.
function AnswerPanel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AnswerPanel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when selected object is changed in AnswerPanel.
function AnswerPanel_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in AnswerPanel 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.selectedAnswer= get(hObject,'string');
guidata(hObject, handles)


% --- Executes when entered data in editable cell(s) in table.
function table_CellEditCallback(hObject, eventdata, handles)
a=5;
% hObject    handle to table (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when selected cell(s) is changed in table.
function table_CellSelectionCallback(hObject, eventdata, handles)

% hObject    handle to table (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in togglebutton2.
function togglebutton2_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton2


% --- Executes on button press in g36.
% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function g36_Callback(hObject, eventdata, handles)%%all questions are same as g1_new
handles.g36.Enable='off';
% hObject    handle to g36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.AnswerPanel,'visible','on');
set(handles.AnswerCheckButton,'visible','on');
x=handles.selection %to get team number
Location= handles.table.Data{x,1} % to get team location
owner=handles.owner(Location) % to get owner of the location
if  owner == 0 || owner == x
    
Maksnum=max(handles.GeneralQuestion.Number)
number=randi([1,Maksnum],1) 
chose1=handles.GeneralQuestion.A(number)
chose2=handles.GeneralQuestion.B(number)
chose3=handles.GeneralQuestion.C(number)
chose4=handles.GeneralQuestion.D(number)
ans=handles.GeneralQuestion.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.GeneralQuestion.Question{number}
set(handles.command_text,'string',question)
else 
    Maksnum=max(handles.General2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.General2Question.A(number)
chose2=handles.General2Question.B(number)
chose3=handles.General2Question.C(number)
chose4=handles.General2Question.D(number)
ans=handles.General2Question.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.General2Question.Question{number}
set(handles.command_text,'string',question)
    
end
guidata(hObject, handles)

% --- Executes on button press in lab35.
% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function lab35_Callback(hObject, eventdata, handles)
handles.lab35.Enable='off';
% hObject    handle to lab35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.AnswerPanel,'visible','on');
set(handles.AnswerCheckButton,'visible','on');
x=handles.selection %to get team number
Location= handles.table.Data{x,1} % to get team location
owner=handles.owner(Location) % to get owner of the location
if  owner == 0 || owner == x
    
Maksnum=max(handles.Lab2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.LabQuestion.A(number)
chose2=handles.LabQuestion.B(number)
chose3=handles.LabQuestion.C(number)
chose4=handles.LabQuestion.D(number)
ans=handles.LabQuestion.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.LabQuestion.Question{number}
set(handles.command_text,'string',question)
else 
    Maksnum=max(handles.Lab2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.Lab2Question.A(number)
chose2=handles.Lab2Question.B(number)
chose3=handles.Lab2Question.C(number)
chose4=handles.Lab2Question.D(number)
ans=handles.Lab2Question.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.Lab2Question.Question{number}
set(handles.command_text,'string',question)
    
end
guidata(hObject, handles)

% --- Executes on button press in g32.
% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function g32_Callback(hObject, eventdata, handles)
handles.g32.Enable='Off';
% hObject    handle to g32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.AnswerPanel,'visible','on');
set(handles.AnswerCheckButton,'visible','on');
x=handles.selection %to get team number
Location= handles.table.Data{x,1} % to get team location
owner=handles.owner(Location) % to get owner of the location
if  owner == 0 || owner == x
    
Maksnum=max(handles.GeneralQuestion.Number)
number=randi([1,Maksnum],1) 
chose1=handles.GeneralQuestion.A(number)
chose2=handles.GeneralQuestion.B(number)
chose3=handles.GeneralQuestion.C(number)
chose4=handles.GeneralQuestion.D(number)
ans=handles.GeneralQuestion.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.GeneralQuestion.Question{number}
set(handles.command_text,'string',question)
else 
    Maksnum=max(handles.General2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.General2Question.A(number)
chose2=handles.General2Question.B(number)
chose3=handles.General2Question.C(number)
chose4=handles.General2Question.D(number)
ans=handles.General2Question.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.General2Question.Question{number}
set(handles.command_text,'string',question)
    
end
guidata(hObject, handles)

% --- Executes on button press in lab31.
% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function lab31_Callback(hObject, eventdata, handles)
handles.lab31.Enable='off';
% hObject    handle to lab31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.AnswerPanel,'visible','on');
set(handles.AnswerCheckButton,'visible','on');
x=handles.selection %to get team number
Location= handles.table.Data{x,1} % to get team location
owner=handles.owner(Location) % to get owner of the location
if  owner == 0 || owner == x
    
Maksnum=max(handles.Lab2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.LabQuestion.A(number)
chose2=handles.LabQuestion.B(number)
chose3=handles.LabQuestion.C(number)
chose4=handles.LabQuestion.D(number)
ans=handles.LabQuestion.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.LabQuestion.Question{number}
set(handles.command_text,'string',question)
else 
    Maksnum=max(handles.Lab2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.Lab2Question.A(number)
chose2=handles.Lab2Question.B(number)
chose3=handles.Lab2Question.C(number)
chose4=handles.Lab2Question.D(number)
ans=handles.Lab2Question.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.Lab2Question.Question{number}
set(handles.command_text,'string',question)
    
end
guidata(hObject, handles)

% --- Executes on button press in g37.
% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function g37_Callback(hObject, eventdata, handles)
handles.g37.Enable='off';
% hObject    handle to g37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.AnswerPanel,'visible','on');
set(handles.AnswerCheckButton,'visible','on');
x=handles.selection %to get team number
Location= handles.table.Data{x,1} % to get team location
owner=handles.owner(Location) % to get owner of the location
if  owner == 0 || owner == x
    
Maksnum=max(handles.GeneralQuestion.Number)
number=randi([1,Maksnum],1) 
chose1=handles.GeneralQuestion.A(number)
chose2=handles.GeneralQuestion.B(number)
chose3=handles.GeneralQuestion.C(number)
chose4=handles.GeneralQuestion.D(number)
ans=handles.GeneralQuestion.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.GeneralQuestion.Question{number};
set(handles.command_text,'string',question)
else 
    Maksnum=max(handles.General2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.General2Question.A(number)
chose2=handles.General2Question.B(number)
chose3=handles.General2Question.C(number)
chose4=handles.General2Question.D(number)
ans=handles.General2Question.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.General2Question.Question{number}
set(handles.command_text,'string',question)
    
end
guidata(hObject, handles)

% --- Executes on button press in g30.
% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function g30_Callback(hObject, eventdata, handles)
handles.g30.Enable='Off';
% hObject    handle to g30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.AnswerPanel,'visible','on');
set(handles.AnswerCheckButton,'visible','on');
x=handles.selection %to get team number
Location= handles.table.Data{x,1} % to get team location
owner=handles.owner(Location) % to get owner of the location
if  owner == 0 || owner == x
    
Maksnum=max(handles.GeneralQuestion.Number)
number=randi([1,Maksnum],1) 
chose1=handles.GeneralQuestion.A(number)
chose2=handles.GeneralQuestion.B(number)
chose3=handles.GeneralQuestion.C(number)
chose4=handles.GeneralQuestion.D(number)
ans=handles.GeneralQuestion.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.GeneralQuestion.Question{number}
set(handles.command_text,'string',question)
else 
    Maksnum=max(handles.General2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.General2Question.A(number)
chose2=handles.General2Question.B(number)
chose3=handles.General2Question.C(number)
chose4=handles.General2Question.D(number)
ans=handles.General2Question.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.General2Question.Question{number}
set(handles.command_text,'string',question)
    
end
guidata(hObject, handles)
% --- Executes on button press in g29.
% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function g29_Callback(hObject, eventdata, handles)
handles.g29.Enable='Off';
% hObject    handle to g29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.AnswerPanel,'visible','on');
set(handles.AnswerCheckButton,'visible','on');
x=handles.selection %to get team number
Location= handles.table.Data{x,1} % to get team location
owner=handles.owner(Location) % to get owner of the location
if  owner == 0 || owner == x
    
Maksnum=max(handles.GeneralQuestion.Number)
number=randi([1,Maksnum],1) 
chose1=handles.GeneralQuestion.A(number)
chose2=handles.GeneralQuestion.B(number)
chose3=handles.GeneralQuestion.C(number)
chose4=handles.GeneralQuestion.D(number)
ans=handles.GeneralQuestion.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.GeneralQuestion.Question{number}
set(handles.command_text,'string',question)
else 
    Maksnum=max(handles.General2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.General2Question.A(number)
chose2=handles.General2Question.B(number)
chose3=handles.General2Question.C(number)
chose4=handles.General2Question.D(number)
ans=handles.General2Question.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.General2Question.Question{number}
set(handles.command_text,'string',question)
    
end
guidata(hObject, handles)

% --- Executes on button press in lab28.
% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function lab28_Callback(hObject, eventdata, handles)
handles.lab28.Enable='Off';
% hObject    handle to lab28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.AnswerPanel,'visible','on');
set(handles.AnswerCheckButton,'visible','on');
x=handles.selection; %to get team number
Location= handles.table.Data{x,1} % to get team location
owner=handles.owner(Location) % to get owner of the location
if  owner == 0 || owner == x
    
Maksnum=max(handles.Lab2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.LabQuestion.A(number)
chose2=handles.LabQuestion.B(number)
chose3=handles.LabQuestion.C(number)
chose4=handles.LabQuestion.D(number)
ans=handles.LabQuestion.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.LabQuestion.Question{number}
set(handles.command_text,'string',question)
else 
    Maksnum=max(handles.Lab2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.Lab2Question.A(number)
chose2=handles.Lab2Question.B(number)
chose3=handles.Lab2Question.C(number)
chose4=handles.Lab2Question.D(number)
ans=handles.Lab2Question.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.Lab2Question.Question{number}
set(handles.command_text,'string',question)
    
end
guidata(hObject, handles)

% --- Executes on button press in lab5.
% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function lab5_Callback(hObject, eventdata, handles)
handles.lab5.Enable='off';
% hObject    handle to lab5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.AnswerPanel,'visible','on');
set(handles.AnswerCheckButton,'visible','on');
x=handles.selection %to get team number
Location= handles.table.Data{x,1} % to get team location
owner=handles.owner(Location) % to get owner of the location
if  owner == 0 || owner == x
    
Maksnum=max(handles.Lab2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.LabQuestion.A(number)
chose2=handles.LabQuestion.B(number)
chose3=handles.LabQuestion.C(number)
chose4=handles.LabQuestion.D(number)
ans=handles.LabQuestion.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.LabQuestion.Question{number}
set(handles.command_text,'string',question)
else 
    Maksnum=max(handles.Lab2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.Lab2Question.A(number)
chose2=handles.Lab2Question.B(number)
chose3=handles.Lab2Question.C(number)
chose4=handles.Lab2Question.D(number)
ans=handles.Lab2Question.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.Lab2Question.Question{number}
set(handles.command_text,'string',question)
    
end
guidata(hObject, handles)
% --- Executes on button press in g6.
% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function g6_Callback(hObject, eventdata, handles)
handles.g6.Enable='off';
% hObject    handle to g1_new (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.AnswerPanel,'visible','on');
set(handles.AnswerCheckButton,'visible','on');
x=handles.selection %to get team number
Location= handles.table.Data{x,1} % to get team location
owner=handles.owner(Location) % to get owner of the location
if  owner == 0 || owner == x
    
Maksnum=max(handles.GeneralQuestion.Number)
number=randi([1,Maksnum],1) 
chose1=handles.GeneralQuestion.A(number)
chose2=handles.GeneralQuestion.B(number)
chose3=handles.GeneralQuestion.C(number)
chose4=handles.GeneralQuestion.D(number)
ans=handles.GeneralQuestion.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.GeneralQuestion.Question{number}
set(handles.command_text,'string',question)
else 
    Maksnum=max(handles.General2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.General2Question.A(number)
chose2=handles.General2Question.B(number)
chose3=handles.General2Question.C(number)
chose4=handles.General2Question.D(number)
ans=handles.General2Question.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.General2Question.Question{number}
set(handles.command_text,'string',question)
    
end
guidata(hObject, handles)
% --- Executes on button press in g7.
% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function g7_Callback(hObject, eventdata, handles)
handles.g7.Enable='off';
% hObject    handle to g7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.AnswerPanel,'visible','on');
set(handles.AnswerCheckButton,'visible','on');
x=handles.selection %to get team number
Location= handles.table.Data{x,1} % to get team location
owner=handles.owner(Location) % to get owner of the location
if  owner == 0 || owner == x
    
Maksnum=max(handles.GeneralQuestion.Number)
number=randi([1,Maksnum],1) 
chose1=handles.GeneralQuestion.A(number)
chose2=handles.GeneralQuestion.B(number)
chose3=handles.GeneralQuestion.C(number)
chose4=handles.GeneralQuestion.D(number)
ans=handles.GeneralQuestion.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.GeneralQuestion.Question{number}
set(handles.command_text,'string',question)
else 
    Maksnum=max(handles.General2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.General2Question.A(number)
chose2=handles.General2Question.B(number)
chose3=handles.General2Question.C(number)
chose4=handles.General2Question.D(number)
ans=handles.General2Question.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.General2Question.Question{number}
set(handles.command_text,'string',question)
    
end
guidata(hObject, handles)

% --- Executes on button press in g9.
% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function g9_Callback(hObject, eventdata, handles)
handles.g9.Enable='off';
% hObject    handle to g9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.AnswerPanel,'visible','on');
set(handles.AnswerCheckButton,'visible','on');
x=handles.selection %to get team number
Location= handles.table.Data{x,1} % to get team location
owner=handles.owner(Location) % to get owner of the location
if  owner == 0 || owner == x
    
Maksnum=max(handles.GeneralQuestion.Number)
number=randi([1,Maksnum],1) 
chose1=handles.GeneralQuestion.A(number)
chose2=handles.GeneralQuestion.B(number)
chose3=handles.GeneralQuestion.C(number)
chose4=handles.GeneralQuestion.D(number)
ans=handles.GeneralQuestion.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.GeneralQuestion.Question{number}
set(handles.command_text,'string',question)
else 
    Maksnum=max(handles.General2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.General2Question.A(number)
chose2=handles.General2Question.B(number)
chose3=handles.General2Question.C(number)
chose4=handles.General2Question.D(number)
ans=handles.General2Question.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.General2Question.Question{number}
set(handles.command_text,'string',question)
    
end
guidata(hObject, handles)

% --- Executes on button press in g11.
% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function g11_Callback(hObject, eventdata, handles)
handles.g11.Enable='off';
% hObject    handle to g11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.AnswerPanel,'visible','on');
set(handles.AnswerCheckButton,'visible','on');
x=handles.selection %to get team number
Location= handles.table.Data{x,1} % to get team location
owner=handles.owner(Location) % to get owner of the location
if  owner == 0 || owner == x
    
Maksnum=max(handles.GeneralQuestion.Number)
number=randi([1,Maksnum],1) 
chose1=handles.GeneralQuestion.A(number)
chose2=handles.GeneralQuestion.B(number)
chose3=handles.GeneralQuestion.C(number)
chose4=handles.GeneralQuestion.D(number)
ans=handles.GeneralQuestion.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.GeneralQuestion.Question{number}
set(handles.command_text,'string',question)
else 
    Maksnum=max(handles.General2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.General2Question.A(number)
chose2=handles.General2Question.B(number)
chose3=handles.General2Question.C(number)
chose4=handles.General2Question.D(number)
ans=handles.General2Question.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.General2Question.Question{number}
set(handles.command_text,'string',question)
    
end
guidata(hObject, handles)
% --- Executes on button press in g13.
% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function g13_Callback(hObject, eventdata, handles)
handles.g13.Enable='off';
% hObject    handle to g13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.AnswerPanel,'visible','on');
set(handles.AnswerCheckButton,'visible','on');
x=handles.selection %to get team number
Location= handles.table.Data{x,1} % to get team location
owner=handles.owner(Location) % to get owner of the location
if  owner == 0 || owner == x
    
Maksnum=max(handles.GeneralQuestion.Number)
number=randi([1,Maksnum],1) 
chose1=handles.GeneralQuestion.A(number)
chose2=handles.GeneralQuestion.B(number)
chose3=handles.GeneralQuestion.C(number)
chose4=handles.GeneralQuestion.D(number)
ans=handles.GeneralQuestion.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.GeneralQuestion.Question{number}
set(handles.command_text,'string',question)
else 
    Maksnum=max(handles.General2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.General2Question.A(number)
chose2=handles.General2Question.B(number)
chose3=handles.General2Question.C(number)
chose4=handles.General2Question.D(number)
ans=handles.General2Question.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.General2Question.Question{number}
set(handles.command_text,'string',question)
    
end
guidata(hObject, handles)

% --- Executes on button press in g16.
% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function g16_Callback(hObject, eventdata, handles)
handles.g16.Enable='off';
% hObject    handle to g16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.AnswerPanel,'visible','on');
set(handles.AnswerCheckButton,'visible','on');
x=handles.selection %to get team number
Location= handles.table.Data{x,1} % to get team location
owner=handles.owner(Location) % to get owner of the location
if  owner == 0 || owner == x
    
Maksnum=max(handles.GeneralQuestion.Number)
number=randi([1,Maksnum],1) 
chose1=handles.GeneralQuestion.A(number)
chose2=handles.GeneralQuestion.B(number)
chose3=handles.GeneralQuestion.C(number)
chose4=handles.GeneralQuestion.D(number)
ans=handles.GeneralQuestion.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.GeneralQuestion.Question{number}
set(handles.command_text,'string',question)
else 
    Maksnum=max(handles.General2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.General2Question.A(number)
chose2=handles.General2Question.B(number)
chose3=handles.General2Question.C(number)
chose4=handles.General2Question.D(number)
ans=handles.General2Question.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.General2Question.Question{number}
set(handles.command_text,'string',question)
    
end
guidata(hObject, handles)

% --- Executes on button press in g18.
% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function g18_Callback(hObject, eventdata, handles)
handles.g18.Enable='off';
% hObject    handle to g18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.AnswerPanel,'visible','on');
set(handles.AnswerCheckButton,'visible','on');
x=handles.selection %to get team number
Location= handles.table.Data{x,1} % to get team location
owner=handles.owner(Location) % to get owner of the location
if  owner == 0 || owner == x
    
Maksnum=max(handles.GeneralQuestion.Number)
number=randi([1,Maksnum],1) 
chose1=handles.GeneralQuestion.A(number)
chose2=handles.GeneralQuestion.B(number)
chose3=handles.GeneralQuestion.C(number)
chose4=handles.GeneralQuestion.D(number)
ans=handles.GeneralQuestion.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.GeneralQuestion.Question{number}
set(handles.command_text,'string',question)
else 
    Maksnum=max(handles.General2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.General2Question.A(number)
chose2=handles.General2Question.B(number)
chose3=handles.General2Question.C(number)
chose4=handles.General2Question.D(number)
ans=handles.General2Question.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.General2Question.Question{number}
set(handles.command_text,'string',question)
    
end
guidata(hObject, handles)

% --- Executes on button press in g25.
% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function g25_Callback(hObject, eventdata, handles)
handles.g25.Enable='Off';
% hObject    handle to g25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.AnswerPanel,'visible','on');
set(handles.AnswerCheckButton,'visible','on');
x=handles.selection %to get team number
Location= handles.table.Data{x,1} % to get team location
owner=handles.owner(Location) % to get owner of the location
if  owner == 0 || owner == x
    
Maksnum=max(handles.GeneralQuestion.Number)
number=randi([1,Maksnum],1) 
chose1=handles.GeneralQuestion.A(number)
chose2=handles.GeneralQuestion.B(number)
chose3=handles.GeneralQuestion.C(number)
chose4=handles.GeneralQuestion.D(number)
ans=handles.GeneralQuestion.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.GeneralQuestion.Question{number}
set(handles.command_text,'string',question)
else 
    Maksnum=max(handles.General2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.General2Question.A(number)
chose2=handles.General2Question.B(number)
chose3=handles.General2Question.C(number)
chose4=handles.General2Question.D(number)
ans=handles.General2Question.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.General2Question.Question{number}
set(handles.command_text,'string',question)
    
end
guidata(hObject, handles)
% --- Executes on button press in g26.
% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function g26_Callback(hObject, eventdata, handles)
handles.g25.Enable='Off';
% hObject    handle to g26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.AnswerPanel,'visible','on');
set(handles.AnswerCheckButton,'visible','on');
x=handles.selection %to get team number
Location= handles.table.Data{x,1} % to get team location
owner=handles.owner(Location) % to get owner of the location
if  owner == 0 || owner == x
    
Maksnum=max(handles.GeneralQuestion.Number)
number=randi([1,Maksnum],1) 
chose1=handles.GeneralQuestion.A(number)
chose2=handles.GeneralQuestion.B(number)
chose3=handles.GeneralQuestion.C(number)
chose4=handles.GeneralQuestion.D(number)
ans=handles.GeneralQuestion.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.GeneralQuestion.Question{number}
set(handles.command_text,'string',question)
else 
    Maksnum=max(handles.General2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.General2Question.A(number)
chose2=handles.General2Question.B(number)
chose3=handles.General2Question.C(number)
chose4=handles.General2Question.D(number)
ans=handles.General2Question.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.General2Question.Question{number}
set(handles.command_text,'string',question)
    
end
guidata(hObject, handles)

% --- Executes on button press in lab23.
% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function lab23_Callback(hObject, eventdata, handles)
handles.lab23.Enable='off';
% hObject    handle to lab23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.AnswerPanel,'visible','on');
set(handles.AnswerCheckButton,'visible','on');
x=handles.selection %to get team number
Location= handles.table.Data{x,1} % to get team location
owner=handles.owner(Location) % to get owner of the location
if  owner == 0 || owner == x
    
Maksnum=max(handles.Lab2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.LabQuestion.A(number)
chose2=handles.LabQuestion.B(number)
chose3=handles.LabQuestion.C(number)
chose4=handles.LabQuestion.D(number)
ans=handles.LabQuestion.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.LabQuestion.Question{number}
set(handles.command_text,'string',question)
else 
    Maksnum=max(handles.Lab2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.Lab2Question.A(number)
chose2=handles.Lab2Question.B(number)
chose3=handles.Lab2Question.C(number)
chose4=handles.Lab2Question.D(number)
ans=handles.Lab2Question.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.Lab2Question.Question{number}
set(handles.command_text,'string',question)
    
end
guidata(hObject, handles)

% --- Executes on button press in g22.
% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function g22_Callback(hObject, eventdata, handles)
handles.g22.Enable='Off';
         handles.dice.Enable='On';
% hObject    handle to g22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.AnswerPanel,'visible','on');
set(handles.AnswerCheckButton,'visible','on');
x=handles.selection %to get team number
Location= handles.table.Data{x,1} % to get team location
owner=handles.owner(Location) % to get owner of the location
if  owner == 0 || owner == x
    
Maksnum=max(handles.GeneralQuestion.Number)
number=randi([1,Maksnum],1) 
chose1=handles.GeneralQuestion.A(number)
chose2=handles.GeneralQuestion.B(number)
chose3=handles.GeneralQuestion.C(number)
chose4=handles.GeneralQuestion.D(number)
ans=handles.GeneralQuestion.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.GeneralQuestion.Question{number}
set(handles.command_text,'string',question)
else 
    Maksnum=max(handles.General2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.General2Question.A(number)
chose2=handles.General2Question.B(number)
chose3=handles.General2Question.C(number)
chose4=handles.General2Question.D(number)
ans=handles.General2Question.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.General2Question.Question{number}
set(handles.command_text,'string',question)
    
end
guidata(hObject, handles)

% --- Executes on button press in g15.
% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function g15_Callback(hObject, eventdata, handles)
handles.g15.Enable='off';
% hObject    handle to g20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.AnswerPanel,'visible','on');
set(handles.AnswerCheckButton,'visible','on');
x=handles.selection %to get team number
Location= handles.table.Data{x,1} % to get team location
owner=handles.owner(Location) % to get owner of the location
if  owner == 0 || owner == x
    
Maksnum=max(handles.GeneralQuestion.Number)
number=randi([1,Maksnum],1) 
chose1=handles.GeneralQuestion.A(number)
chose2=handles.GeneralQuestion.B(number)
chose3=handles.GeneralQuestion.C(number)
chose4=handles.GeneralQuestion.D(number)
ans=handles.GeneralQuestion.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.GeneralQuestion.Question{number}
set(handles.command_text,'string',question)
else 
    Maksnum=max(handles.General2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.General2Question.A(number)
chose2=handles.General2Question.B(number)
chose3=handles.General2Question.C(number)
chose4=handles.General2Question.D(number)
ans=handles.General2Question.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.General2Question.Question{number}
set(handles.command_text,'string',question)
    
end
guidata(hObject, handles)
% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function g20_Callback(hObject, eventdata, handles)
handles.g20.Enable='off';
% hObject    handle to g20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.AnswerPanel,'visible','on');
set(handles.AnswerCheckButton,'visible','on');
x=handles.selection %to get team number
Location= handles.table.Data{x,1} % to get team location
owner=handles.owner(Location) % to get owner of the location
if  owner == 0 || owner == x
    
Maksnum=max(handles.GeneralQuestion.Number)
number=randi([1,Maksnum],1) 
chose1=handles.GeneralQuestion.A(number)
chose2=handles.GeneralQuestion.B(number)
chose3=handles.GeneralQuestion.C(number)
chose4=handles.GeneralQuestion.D(number)
ans=handles.GeneralQuestion.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.GeneralQuestion.Question{number}
set(handles.command_text,'string',question)
else 
    Maksnum=max(handles.General2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.General2Question.A(number)
chose2=handles.General2Question.B(number)
chose3=handles.General2Question.C(number)
chose4=handles.General2Question.D(number)
ans=handles.General2Question.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.General2Question.Question{number}
set(handles.command_text,'string',question)
    
end
guidata(hObject, handles)

% --- Executes on button press in lab3.
% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function lab3_Callback(hObject, eventdata, handles)
handles.lab3.Enable='off';
% hObject    handle to lab28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.AnswerPanel,'visible','on');
set(handles.AnswerCheckButton,'visible','on');
x=handles.selection %to get team number
Location= handles.table.Data{x,1} % to get team location
owner=handles.owner(Location) % to get owner of the location
if  owner == 0 || owner == x
    
Maksnum=max(handles.Lab2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.LabQuestion.A(number)
chose2=handles.LabQuestion.B(number)
chose3=handles.LabQuestion.C(number)
chose4=handles.LabQuestion.D(number)
ans=handles.LabQuestion.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.LabQuestion.Question{number}
set(handles.command_text,'string',question)
else 
    Maksnum=max(handles.Lab2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.Lab2Question.A(number)
chose2=handles.Lab2Question.B(number)
chose3=handles.Lab2Question.C(number)
chose4=handles.Lab2Question.D(number)
ans=handles.Lab2Question.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.Lab2Question.Question{number}
set(handles.command_text,'string',question)
    
end
guidata(hObject, handles)

% --- Executes on button press in lab12
% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function lab12_Callback(hObject, eventdata, handles)
handles.lab12.Enable='off';
% hObject    handle to lab28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.AnswerPanel,'visible','on');
set(handles.AnswerCheckButton,'visible','on');
x=handles.selection %to get team number
Location= handles.table.Data{x,1} % to get team location
owner=handles.owner(Location) % to get owner of the location
if  owner == 0 || owner == x
    
Maksnum=max(handles.Lab2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.LabQuestion.A(number)
chose2=handles.LabQuestion.B(number)
chose3=handles.LabQuestion.C(number)
chose4=handles.LabQuestion.D(number)
ans=handles.LabQuestion.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.LabQuestion.Question{number}
set(handles.command_text,'string',question)
else 
    Maksnum=max(handles.Lab2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.Lab2Question.A(number)
chose2=handles.Lab2Question.B(number)
chose3=handles.Lab2Question.C(number)
chose4=handles.Lab2Question.D(number)
ans=handles.Lab2Question.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.Lab2Question.Question{number}
set(handles.command_text,'string',question)
    
end
guidata(hObject, handles)

% --- Executes on button press in lab17.
% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function lab17_Callback(hObject, eventdata, handles)
handles.lab17.Enable='off';
% hObject    handle to lab28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.AnswerPanel,'visible','on');
set(handles.AnswerCheckButton,'visible','on');
x=handles.selection %to get team number
Location= handles.table.Data{x,1} % to get team location
owner=handles.owner(Location) % to get owner of the location
if  owner == 0 || owner == x
    
Maksnum=max(handles.Lab2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.LabQuestion.A(number)
chose2=handles.LabQuestion.B(number)
chose3=handles.LabQuestion.C(number)
chose4=handles.LabQuestion.D(number)
ans=handles.LabQuestion.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.LabQuestion.Question{number}
set(handles.command_text,'string',question)
else 
    Maksnum=max(handles.Lab2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.Lab2Question.A(number)
chose2=handles.Lab2Question.B(number)
chose3=handles.Lab2Question.C(number)
chose4=handles.Lab2Question.D(number)
ans=handles.Lab2Question.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.Lab2Question.Question{number}
set(handles.command_text,'string',question)
    
end
guidata(hObject, handles)

% --- Executes on button press in lab19
% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function lab19_Callback(hObject, eventdata, handles)
handles.lab19.Enable='off';
% hObject    handle to lab28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.AnswerPanel,'visible','on');
set(handles.AnswerCheckButton,'visible','on');
x=handles.selection %to get team number
Location= handles.table.Data{x,1} % to get team location
owner=handles.owner(Location) % to get owner of the location
if  owner == 0 || owner == x
    
Maksnum=max(handles.Lab2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.LabQuestion.A(number)
chose2=handles.LabQuestion.B(number)
chose3=handles.LabQuestion.C(number)
chose4=handles.LabQuestion.D(number)
ans=handles.LabQuestion.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.LabQuestion.Question{number}
set(handles.command_text,'string',question)
else 
    Maksnum=max(handles.Lab2Question.Number)
number=randi([1,Maksnum],1) 
chose1=handles.Lab2Question.A(number)
chose2=handles.Lab2Question.B(number)
chose3=handles.Lab2Question.C(number)
chose4=handles.Lab2Question.D(number)
ans=handles.Lab2Question.Answer(number)
handles.answer=ans;
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.Lab2Question.Question{number}
set(handles.command_text,'string',question)
    
end
guidata(hObject, handles)

function ed_taxi_Callback(hObject, eventdata, handles)


% hObject    handle to ed_taxi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_taxi as text
%        str2double(get(hObject,'String')) returns contents of ed_taxi as a double


% --- Executes during object creation, after setting all properties.
function ed_taxi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_taxi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function warning_CreateFcn(hObject, eventdata, handles)
% hObject    handle to warning (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function g2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to g2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in uni3.
% --- THIS PART IS WRITTEN BY AHMET DOLMA
function uni3_Callback(hObject, eventdata, handles)
handles.uni3.Enable='off';%%%turns itself as disabled
handles.Team=3; %%Sets a value to team value
set(handles.AnswerPanel,'visible','on');    % opens answer panel
set(handles.check_universal,'visible','on');    % open check answer button for universal
Maksnum=max(handles.GeneralQuestion.Number);    %%%random number is chosen to assing asnwers to random buttons 
number=randi([1,Maksnum],1) ; 
chose1=handles.GeneralQuestion.A(number)
chose2=handles.GeneralQuestion.B(number)
chose3=handles.GeneralQuestion.C(number)
chose4=handles.GeneralQuestion.D(number)
ans=handles.GeneralQuestion.Answer(number)
handles.answer = ans % To store answer in string form. (handles structure used for call later.
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.GeneralQuestion.Question{number}
set(handles.command_text,'string',question)
guidata(hObject, handles)
tic%%% starts ticking the clock for team 3

% hObject    handle to uni3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in uni2.
% --- THIS PART IS WRITTEN BY AHMET DOLMA
function uni2_Callback(hObject, eventdata, handles)%%%%%same as uni3 button, just for team 2 . Check line 2252
handles.uni2.Enable='off';
handles.Team=2;
set(handles.AnswerPanel,'visible','on');
set(handles.check_universal,'visible','on');
Maksnum=max(handles.GeneralQuestion.Number);
number=randi([1,Maksnum],1);  % ?lerde bu number ? random yapaca??z
chose1=handles.GeneralQuestion.A(number)
chose2=handles.GeneralQuestion.B(number)
chose3=handles.GeneralQuestion.C(number)
chose4=handles.GeneralQuestion.D(number)
ans=handles.GeneralQuestion.Answer(number)
handles.answer = ans % To store answer in string form. (handles structure used for call later.
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.GeneralQuestion.Question{number}
set(handles.command_text,'string',question)
guidata(hObject, handles)
tic%%% starts ticking the clock for team 2
% hObject    handle to uni2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in uni1.
% --- THIS PART IS WRITTEN BY AHMET DOLMA
function uni1_Callback(hObject, eventdata, handles)%%%%%same as uni3 button, just for team 1 . Check line 2252
handles.uni1.Enable='off';
handles.Team=1;
set(handles.AnswerPanel,'visible','on');
set(handles.check_universal,'visible','on');
Maksnum=max(handles.GeneralQuestion.Number);
number=randi([1,Maksnum],1);  % ?lerde bu number ? random yapaca??z
chose1=handles.GeneralQuestion.A(number)
chose2=handles.GeneralQuestion.B(number)
chose3=handles.GeneralQuestion.C(number)
chose4=handles.GeneralQuestion.D(number)
ans=handles.GeneralQuestion.Answer(number)
handles.answer = ans % To store answer in string form. (handles structure used for call later.
set(handles.chose1,'string',chose1)
set(handles.chose2,'string',chose2)
set(handles.chose3,'string',chose3)
set(handles.chose4,'string',chose4)
question=handles.GeneralQuestion.Question{number}
set(handles.command_text,'string',question)
guidata(hObject, handles)
tic%%% starts ticking the clock for team 1
% hObject    handle to uni1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in getmoney.
% --- THIS PART IS WRITTEN BY AHMET DOLMA
function getmoney_Callback(hObject, eventdata, handles)
handles.dice.Enable='on';%%%enables the dice button
a=str2double(handles.uni_tx1.String)%%%turns string to double
b=str2double(handles.uni_tx2.String)%%%turns string to double
c=str2double(handles.uni_tx3.String)%%%turns string to double 
switch 1%%%%this switch compares the times and gives the lowest time 500 money
    case a<b&&a<c %%if the quickest team is first team, evaluate this case
        handles.table.Data{1,2}=handles.table.Data{1,2}+500; %%%add 500 money to team 1 
             if handles.table.Data{1,2}>=3000       %%%%this checks if the game should be finished or not
                 handles.mainpanel.Visible='off';   %%%turns off the main panel, game panel
                 handles.win1.Visible='on';         %%%announces the winner as team 1 
             end
    case b<a&&b<c      %%same as first case look line 2339, for team 2 having quickest answer
        handles.table.Data{2,2}=handles.table.Data{2,2}+500;
        if handles.table.Data{2,2}>=3000
                 handles.mainpanel.Visible='off';
                 handles.win2.Visible='on';
        end
    case c<a&&c<b      %%same as first case look line 2339, for team 3 having quickest answer
        handles.table.Data{3,2}=handles.table.Data{3,2}+500;
        if handles.table.Data{3,2}>=3000
                 handles.mainpanel.Visible='off';
                 handles.win3.Visible='on';
        end
    case a==inf&&b==inf&&c==inf%%%in case they all have answered wrong
        handles.universal_panel.Visible='off'%%turn off the panel
end
handles.uni_tx1.String='Time'%%sets the texts below team 1 button to Time
handles.uni_tx2.String='Time'%%sets the texts below team 2 button to Time
handles.uni_tx3.String='Time'%%sets the texts below team 3 button to Time
handles.universal_panel.Visible='off';%%turns off the universal button
guidata(hObject, handles)
% hObject    handle to getmoney (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in check_universal.
% --- THIS PART IS WRITTEN BY AHMET DOLMA
function check_universal_Callback(hObject, eventdata, handles)
handles.check_universal.Visible='Off';%%%%closes itself after clicking button
% hObject    handle to check_universal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Answer=handles.answer % This calls right answer from general question button.
selectedAnswer = handles.selectedAnswer % This compares right answer in excel and seleected radio button.
tf=strcmp(selectedAnswer,Answer)%%%compares if selectedanswer is same as Answer 
switch tf 
    case 1%%%%%%%
    set(handles.command_text,'string','Right Answer!')%%%%sets command texts head to Right Answer
       switch 1
        case handles.Team==1;  %%%if team 1 is selected 
        handles.uni_tx1.String=toc  %%%sets time period since clicking team 1 button in universal panel
        case handles.Team==2;   %%%if team 2 is selected
        handles.uni_tx2.String=toc   %%%sets time period since clicking team 2 button in universal panel
        case handles.Team==3;    %%%if team 3 is selected
        handles.uni_tx3.String=toc    %%%sets time period since clicking team 3 button in universal panel
       end
    otherwise%%%%if selected answer does not match with the real answer
    set(handles.command_text,'string','Wrong Answer!')%%%%%sets head of the command panel to Wrong Answer'
     switch 1
        case handles.Team==1;   %%in case of choosing wrong answer, it evaluates the time period for team 1 answered as infinity
        handles.uni_tx1.String='inf' %%sets the text below Team 1 button as infinity
        case handles.Team==2;   %%in case of choosing wrong answer, it evaluates the time period for team 2 answered as infinity
        handles.uni_tx2.String='inf'%%sets the text below Team 2 button as infinity
        case handles.Team==3;   %%in case of choosing wrong answer, it evaluates the time period for team 3 answered as infinity
        handles.uni_tx3.String='inf'%%sets the text below Team 3 button as infinity
       end

   end


% --- Executes on button press in check_universal.
function pushbutton104_Callback(hObject, eventdata, handles)
% hObject    handle to check_universal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in dice_luck.
function dice_luck_Callback(hObject, eventdata, handles)
A=randperm(12);%dicing
handles.dice_number.String=num2str(A(1));%%assignes dice to dice number string
if mod(A(1),2)==0%%% checks if the condition is satisfied or not
    handles.getmoney1.String='Get Money';%%if so, say get money
else
    handles.getmoney1.String='Pay Money';%%if not, pay money
end
handles.dice_number.BackgroundColor=[0 1 0]; %makes Dicing score screen GREEN
handles.dice_luck.Visible='off'%%closes dice luck
handles.getmoney1.Visible='on'%%opens get/pay money button
% hObject    handle to dice_luck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in check_luck.
% --- THIS PART IS WRITTEN BY AHMET DOLMA
function check_luck_Callback(hObject, eventdata, handles)
%%%%%%%%%Checks for the question%%%%%%%%%%%%%%%%This button works same as
%%%%%%%%%normal check button
Answer=handles.answer % This calls right answer from general question button.
selectedAnswer = handles.selectedAnswer % This compares right answer in excel and seleected radio button.
tf=strcmp(selectedAnswer,Answer)
switch tf 
    case 1
    set(handles.command_text,'string','Right Answer!')
    x=handles.selection   
        switch 1
        case x==1
        handles.table.Data{1,2}=handles.table.Data{1,2}+150;
            if handles.table.Data{1,2}>=3000 
                         handles.mainpanel.Visible='Off';
                        handles.win1.Visible='On';
                        end
        case x==2
        handles.table.Data{2,2}=handles.table.Data{2,2}+150;
                    if handles.table.Data{2,2}>=3000 
                         handles.mainpanel.Visible='Off';
                        handles.win2.Visible='On';
                        end
        case x==3
        handles.table.Data{3,2}=handles.table.Data{3,2}+150; %taken from muhammed's check button 
                    if handles.table.Data{3,2}>=3000 
                         handles.mainpanel.Visible='Off';
                        handles.win3.Visible='On';
                        end
        end
 otherwise
    set(handles.command_text,'string','Wrong Answer!')
    x=handles.selection 
    switch 1
        case x==1
        handles.table.Data{1,2}=handles.table.Data{1,2}-150;
        case x==2
        handles.table.Data{2,2}=handles.table.Data{2,2}-150;
        case x==3
        handles.table.Data{3,2}=handles.table.Data{3,2}-150; %take from muhammed's check button 
    end
end
handles.check_luck.Visible='off'%%closes check luck button
handles.panel_luck.Visible='off'%%closes luck panel
% hObject    handle to check_luck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in dice_luck2.
% --- THIS PART IS WRITTEN BY AHMET DOLMA
function dice_luck2_Callback(hObject, eventdata, handles)
A=randperm(12);%dicing
if handles.dice_number.BackgroundColor==[0 1 0]%%checks if dice backround is green 
    x1=str2num(handles.dice_number.String);%%% assigns dice number to x1
    total=A(1)+x1;%%%%sums dice numbers
    handles.dice_number.String=num2str(total)%%evaluates dice number
     if total<=12&&6<=total
    handles.getmoney2.Visible='On'%%opens get money button
    handles.dice_luck2.Visible='Off'%%closes dice luck
     else 
         handles.sorry.Visible='On'%%%SORRY:( string will be shown
         x=handles.team_button.Value;
         switch 1
             case x==1
                 handles.team_button.Value=2;
             case x==2
                 handles.team_button.Value=3;
             case x==3
                 handles.team_button.Value=1;
         end
         handles.dice_luck2.Visible='Off'
         
         handles.dice.Enable='on';%%enables dice
     end
else
    handles.dice_number.BackgroundColor=[0 1 0];
    handles.dice_number.String=num2str(A(1));
end%makes Dicing score screen GREEN


% hObject    handle to dice_luck2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in getmoney1.
% --- THIS PART IS WRITTEN BY AHMET DOLMA
function getmoney1_Callback(hObject, eventdata, handles)
team_number=handles.team_button.Value;%%gets the value of team
x=handles.selection;
 A=str2num(handles.dice_number.String)
switch 1
    %first team
    case x==1%%%%%if the dice is even, get money for team 1, if not pay money
        if mod(A,2)==0
         handles.table.Data{1,2}=handles.table.Data{1,2}+100;
         handles.table.Data{2,2}=handles.table.Data{2,2}-100;
         handles.table.Data{3,2}=handles.table.Data{3,2}-100;
                    if handles.table.Data{1,2}>=3000 %%%checks if the game is finished
                    handles.mainpanel.Visible='Off';
                    handles.win1.Visible='On';
                     end
        else
         handles.table.Data{1,2}=handles.table.Data{1,2}-100;
         handles.table.Data{2,2}=handles.table.Data{2,2}+100;
         handles.table.Data{3,2}=handles.table.Data{3,2}+100;
                        if handles.table.Data{2,2}>=3000 %%%checks if the game is finished
                         handles.mainpanel.Visible='Off';
                        handles.win2.Visible='On';
                        elseif handles.table.Data{3,2}>=3000
                            handles.mainpanel.Visible='Off';
                        handles.win3.Visible='On';
                        end
        end
        handles.team_button.Value=2;
         handles.dice.Enable='On';
        %second team
    case x==2%%%%%if the dice is even, get money for team 2, if not pay money
        if mod(A,2)==0
         handles.table.Data{2,2}=handles.table.Data{2,2}+100;
         handles.table.Data{1,2}=handles.table.Data{1,2}-100;
         handles.table.Data{3,2}=handles.table.Data{3,2}-100;
                    if handles.table.Data{2,2}>=3000 %%%checks if the game is finished
                    handles.mainpanel.Visible='Off';
                    handles.win2.Visible='On';
                     end
        else
         handles.table.Data{2,2}=handles.table.Data{2,2}-100;
         handles.table.Data{1,2}=handles.table.Data{1,2}+100;
         handles.table.Data{3,2}=handles.table.Data{3,2}+100;
                     if handles.table.Data{3,2}>=3000 %%%checks if the game is finished
                         handles.mainpanel.Visible='Off';
                        handles.win3.Visible='On';
                        elseif handles.table.Data{1,2}>=3000
                            handles.mainpanel.Visible='Off';
                        handles.win1.Visible='On';
                        end
        end
        handles.team_button.Value=3;
         handles.dice.Enable='On';
    case x==3   %%%%%if the dice is even, get money for team 3, if not pay money
        if mod(A,2)==0
         handles.table.Data{3,2}=handles.table.Data{3,2}+100;
         handles.table.Data{2,2}=handles.table.Data{2,2}-100;
         handles.table.Data{1,2}=handles.table.Data{1,2}-100;
                        if handles.table.Data{3,2}>=3000 %%%checks if the game is finished
                    handles.mainpanel.Visible='Off';
                    handles.win3.Visible='On';
                     end
        else
         handles.table.Data{3,2}=handles.table.Data{3,2}-100;
         handles.table.Data{2,2}=handles.table.Data{2,2}+100;
         handles.table.Data{1,2}=handles.table.Data{1,2}+100;
                        if handles.table.Data{2,2}>=3000 %%%checks if the game is finished
                         handles.mainpanel.Visible='Off';
                        handles.win2.Visible='On';
                        elseif handles.table.Data{1,2}>=3000
                            handles.mainpanel.Visible='Off';
                        handles.win1.Visible='On';
                        end
        end
        handles.team_button.Value=1;
         handles.dice.Enable='On';
end
        handles.getmoney1.Visible='off'

% hObject    handle to getmoney1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in getmoney2.
% --- THIS PART IS WRITTEN BY AHMET DOLMA
function getmoney2_Callback(hObject, eventdata, handles)
total=str2num(handles.dice_number.String);
if total<=12&&6<=total%%%checks if the condition of luck card is satisfied
        x=handles.selection;
        switch 1
            case x==1
             handles.table.Data{1,2}=handles.table.Data{1,2}+200;%%if so, get 200 money
             handles.team_button.Value=2;
                 if handles.table.Data{1,2}>=3000 % THIS FUNCTION FINISHES THE GAME IF TEAM 1 HAS 3000 MONEY OR MORE
                handles.mainpanel.Visible='Off';
                 handles.win1.Visible='On';
                end
              handles.dice.Enable='On';
            case x==2
            handles.table.Data{2,2}=handles.table.Data{2,2}+200;
                  if handles.table.Data{2,2}>=3000 % THIS FUNCTION FINISHES THE GAME IF TEAM 2 HAS 3000 MONEY OR MORE
                 handles.mainpanel.Visible='Off';
                 handles.win2.Visible='On';
                end
             handles.team_button.Value=3;
             handles.dice.Enable='On';
             case x==3
             handles.table.Data{3,2}=handles.table.Data{3,2}+200; %take from muhammed's check button 
                    if handles.table.Data{1,2}>=3000 % THIS FUNCTION FINISHES THE GAME IF TEAM 3 HAS 3000 MONEY OR MORE
                     handles.mainpanel.Visible='Off';
                     handles.win1.Visible='On';
                     end
             handles.team_button.Value=1;
             handles.dice.Enable='On';
        end
        handles.dice_luck2.Visible='off'%%closes dice luck  2
    else
        handles.dice_luck2.Visible='off'%%closes dice luck 2
end 
    handles.getmoney2.Visible='off'%%%closes get money button
% hObject    handle to getmoney2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in getmoney3.
% --- THIS PART IS WRITTEN BY AHMET DOLMA
function getmoney3_Callback(hObject, eventdata, handles)
x=handles.selection;
switch 1
    %first team
    case x==1%%%checks if the condition of luck is satisfied, if so, get 50 money if not, pay 50 to others
         handles.table.Data{1,2}=handles.table.Data{1,2}+50;
         handles.table.Data{2,2}=handles.table.Data{2,2}-50;
         handles.table.Data{3,2}=handles.table.Data{3,2}-50;
             if handles.table.Data{1,2}>=3000 % THIS FUNCTION FINISHES THE GAME IF TEAM 1 HAS 3000 MONEY OR MORE
             handles.mainpanel.Visible='Off';
             handles.win1.Visible='On';
             end             
        %second team
        handles.team_button.Value=2;%%evaluates team number 
         handles.dice.Enable='On';%enables dice
    case x==2%%%checks if the condition of luck is satisfied, if so, get 50 money if not, pay 50 to others
         handles.table.Data{2,2}=handles.table.Data{2,2}+50;
         handles.table.Data{1,2}=handles.table.Data{1,2}-50;
         handles.table.Data{3,2}=handles.table.Data{3,2}-50;
         if handles.table.Data{2,2}>=3000 % THIS FUNCTION FINISHES THE GAME IF TEAM 2 HAS 3000 MONEY OR MORE
             handles.mainpanel.Visible='Off';
             handles.win2.Visible='On';
             end
         handles.team_button.Value=3;%%evaluates team number 
         handles.dice.Enable='On';%%enables dice
    case x==3%%%checks if the condition of luck is satisfied, if so, get 50 money if not, pay 50 to others
         handles.table.Data{3,2}=handles.table.Data{3,2}+50;
         handles.table.Data{2,2}=handles.table.Data{2,2}-50;
         handles.table.Data{1,2}=handles.table.Data{1,2}-50;
         if handles.table.Data{3,2}>=3000 % THIS FUNCTION FINISHES THE GAME IF TEAM 1 HAS 3000 MONEY OR MORE
             handles.mainpanel.Visible='Off';
             handles.win3.Visible='On';
             end
         handles.team_button.Value=1;%%evaluates team number 
         handles.dice.Enable='On';%%
end
        handles.getmoney3.Visible='off'%%closes get money button
% hObject    handle to getmoney3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in getmoney4.
% --- THIS PART IS WRITTEN BY AHMET DOLMA
function getmoney4_Callback(hObject, eventdata, handles)
x=handles.selection;
switch 1
    %first team
    case x==1%%%%% The team played this turn will pay 50 money to bank
         handles.table.Data{1,2}=handles.table.Data{1,2}-50;
         handles.team_button.Value=2;%%evaluates team number
         handles.dice.Enable='On';%enables dice
    case x==2
         handles.table.Data{2,2}=handles.table.Data{2,2}-50;
         handles.team_button.Value=3;%%%evaluates team number
         handles.dice.Enable='On';%enables dice
    case x==3
         handles.table.Data{3,2}=handles.table.Data{3,2}-50;
         handles.team_button.Value=1;%%evaluates team number
         handles.dice.Enable='On';%enables dice
end
        handles.getmoney4.Visible='off'%opens get money button
% hObject    handle to getmoney4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in getmoney5.
% --- THIS PART IS WRITTEN BY AHMET DOLMA
function getmoney5_Callback(hObject, eventdata, handles)
x=handles.team_button.Value;%%chooses team number
switch 1
    %first team
    case x==1%%%%%if someone has 1500 or more, they loose 100 money, if not , updates their money to 1500
         if 1500<=handles.table.Data{1,2}
             handles.table.Data{1,2}=handles.table.Data{1,2}-100;
         else
             handles.table.Data{1,2}=1500;
         end
         handles.team_button.Value=2; %changes the team number automatically and enables dice
         handles.dice.Enable='On';
    case x==2
         if 1500<=handles.table.Data{2,2}
             handles.table.Data{2,2}=handles.table.Data{1,2}-100;
         else
             handles.table.Data{2,2}=1500;
         end
         handles.team_button.Value=3;
         handles.dice.Enable='On';
    case x==3
         if 1500<=handles.table.Data{3,2}
             handles.table.Data{3,2}=handles.table.Data{1,2}-100;
         else
             handles.table.Data{3,2}=1500;
         end
         handles.team_button.Value=1;
         handles.dice.Enable='On';
end
        handles.getmoney5.Visible='off'%%closes get money button
% hObject    handle to getmoney5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in change3.
% --- THIS PART IS WRITTEN BY AHMET DOLMA
function change3_Callback(hObject, eventdata, handles)
x=handles.selection;%selection must be 2 or 3 to be able to click this button
switch 1
    case x==2
         a=handles.table.Data{2,2};b=handles.table.Data{3,2};%%%changes money between team 2 and 3
         handles.table.Data{2,2}=b;handles.table.Data{3,2}=a;
         handles.team_button.Value=3;
         handles.dice.Enable='On';
    case x==1
         a=handles.table.Data{3,2};b=handles.table.Data{1,2};%%%changes money between team 1 and 3
         handles.table.Data{3,2}=b;handles.table.Data{1,2}=a;
         handles.team_button.Value=2;
         handles.dice.Enable='On';
end
handles.panel_change.Visible='Off';
% hObject    handle to change3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in change2.
% --- THIS PART IS WRITTEN BY AHMET DOLMA
function change2_Callback(hObject, eventdata, handles)
x=handles.selection;%selection must be 1 or 3 to be able to click this button
switch 1
    case x==1
         a=handles.table.Data{2,2};b=handles.table.Data{1,2};%%%changes money between team 2 and 1
         handles.table.Data{2,2}=b;handles.table.Data{1,2}=a;
         handles.team_button.Value=2;
         handles.dice.Enable='On';
    case x==3
         a=handles.table.Data{3,2};b=handles.table.Data{2,2};%%%changes money between team 2 and 3
         handles.table.Data{3,2}=b;handles.table.Data{2,2}=a;
         handles.team_button.Value=1;
         handles.dice.Enable='On';
end
handles.panel_change.Visible='Off';
% hObject    handle to change2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in change1.
% --- THIS PART IS WRITTEN BY AHMET DOLMA
function change1_Callback(hObject, eventdata, handles)
x=handles.selection;%selection must be 2 or 3 to be able to click this button
switch 1
    case x==2
         a=handles.table.Data{2,2};b=handles.table.Data{1,2};%%%changes money between team 2 and 1
         handles.table.Data{2,2}=b;handles.table.Data{1,2}=a;
         handles.team_button.Value=3;
         handles.dice.Enable='On';
    case x==3
         a=handles.table.Data{3,2};b=handles.table.Data{1,2};%%%changes money between team 1 and 3
         handles.table.Data{3,2}=b;handles.table.Data{1,2}=a;
         handles.team_button.Value=1;
         handles.dice.Enable='On';
end
handles.panel_change.Visible='Off';
% hObject    handle to change1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in loc1.
% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function loc1_Callback(hObject, eventdata, handles)
handles.table.Data{1,2}=handles.table.Data{1,2}-150;%%%%erases 150 money from team 1
x=handles.selection;%selection must be 2 or 3 to be able to click this button
switch 1
    case x==2
         a=handles.table.Data{2,1};b=handles.table.Data{1,1};%%%changes location and of the team 1 and gets 150 money 
         handles.table.Data{2,1}=b;handles.table.Data{1,1}=a;
         handles.table.Data{2,2}=handles.table.Data{2,2}+150;
         handles.team_button.Value=3;
         handles.dice.Enable='On';
    case x==3
         a=handles.table.Data{3,1};b=handles.table.Data{1,1};
         handles.table.Data{3,1}=b;handles.table.Data{1,1}=a;
         handles.table.Data{3,2}=handles.table.Data{3,2}+150;%%%changes location and of the team 3 and gets 150 money 
         handles.team_button.Value=1;
         handles.dice.Enable='On';
end
handles.panel_loc_change.Visible='Off';
% hObject    handle to loc1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in loc2.
% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function loc2_Callback(hObject, eventdata, handles)
handles.table.Data{2,2}=handles.table.Data{2,2}-150;%%%%erases 150 money from team 2
x=handles.selection;%selection must be 1 or 3 to be able to click this button
switch 1
    case x==1
         a=handles.table.Data{2,1};b=handles.table.Data{1,1}; %changes location with the 1-2 team
         handles.table.Data{2,1}=b;handles.table.Data{1,1}=a;
         handles.table.Data{1,2}=handles.table.Data{1,2}+150;%%%changes location and of the team 1 and gets 150 money 
         handles.team_button.Value=2;
         handles.dice.Enable='On';
    case x==3
         a=handles.table.Data{3,1};b=handles.table.Data{2,1}; %changes location with team 2-3
         handles.table.Data{3,1}=b;handles.table.Data{2,1}=a;
         handles.table.Data{3,2}=handles.table.Data{3,2}+150;%%%changes location and of the team 3 and gets 150 money 
         handles.team_button.Value=1;
         handles.dice.Enable='On';
end
handles.panel_loc_change.Visible='Off';
% hObject    handle to loc2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in loc3.
% --- THIS PART IS WRITTEN BY AHMET DOLMA
function loc3_Callback(hObject, eventdata, handles)
handles.table.Data{3,2}=handles.table.Data{3,2}-150;%%%%erases 150 money from team 3
x=handles.selection;%selection must be 2 or 3 to be able to click this button
switch 1
    case x==2
         a=handles.table.Data{2,1};b=handles.table.Data{3,1};
         handles.table.Data{2,1}=b;handles.table.Data{3,1}=a;
         handles.table.Data{2,2}=handles.table.Data{2,2}+150;%%%changes location and of the team 2 and gets 150 money 
         handles.team_button.Value=3;
         handles.dice.Enable='On';
    case x==1
         a=handles.table.Data{3,1};b=handles.table.Data{1,1};
         handles.table.Data{3,1}=b;handles.table.Data{1,1}=a;
         handles.table.Data{1,2}=handles.table.Data{1,2}+150;%%%changes location and of the team 1 and gets 150 money 
         handles.team_button.Value=2;
         handles.dice.Enable='On';
end
handles.panel_loc_change.Visible='Off';
% hObject    handle to loc3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in dice_luck3.
% --- THIS PART IS WRITTEN BY AHMET DOLMA
function dice_luck3_Callback(hObject, eventdata, handles)
handles.dice.Enable='on';
A=randperm(12);%dicing
handles.dice_number.String=num2str(A(1));
if A(1)==1||A(1)==2
    handles.getmoney6.String='Get Money';%%%%%evaluates the string of getmoney button
    handles.getmoney6.Visible='on'%%%%%%opens get money button
else
    handles.sorry.Visible='On'; %enables sorry button
    x=handles.team_button.Value;
    switch 1
        case x==1
            handles.team_button.Value=2;
        case x==2
            handles.team_button.Value=3;
        case x==3
            handles.team_button.Value=1;
    end
end
handles.dice_number.BackgroundColor=[0 1 0]; %makes Dicing score screen GREEN
handles.dice_luck3.Visible='off'% closes dice luck button
% hObject    handle to dice_luck3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in getmoney6.
% --- THIS PART IS WRITTEN BY AHMET DOLMA
function getmoney6_Callback(hObject, eventdata, handles)
handles.dice.Enable='on';%%%%enables dice
c=str2num(handles.dice_number.String);
x=handles.selection;
switch 1
    case x==1
            if c==1||c==2
                handles.table.Data{1,2}=handles.table.Data{1,2}+handles.table.Data{1,2}/2
                if handles.table.Data{1,2}>=3000 % THIS FUNCTION FINISHES THE GAME IF TEAM 1 HAS 3000 MONEY OR MORE
                    handles.mainpanel.Visible='Off';
                      handles.win1.Visible='On';
                    end
            end
            handles.team_button.Value=2;
         handles.dice.Enable='On';
    case x==2
        if c==1||c==2
                handles.table.Data{2,2}=handles.table.Data{2,2}+handles.table.Data{2,2}/2
                if handles.table.Data{2,2}>=3000 % THIS FUNCTION FINISHES THE GAME IF TEAM 1 HAS 3000 MONEY OR MORE
             handles.mainpanel.Visible='Off';
             handles.win2.Visible='On';
             end
        end
        handles.team_button.Value=3;
        handles.dice.Enable='On';
    case x==3
        if c==1||c==2
                handles.table.Data{3,2}=handles.table.Data{3,2}+handles.table.Data{3,2}/2
                if handles.table.Data{3,2}>=3000 % THIS FUNCTION FINISHES THE GAME IF TEAM 1 HAS 3000 MONEY OR MORE
             handles.mainpanel.Visible='Off';
             handles.win3.Visible='On';
             end
        end
        handles.team_button.Value=1;
        handles.dice.Enable='On';
end
handles.getmoney6.Visible='Off';
% hObject    handle to getmoney6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in choose1_1.
% --- THIS PART IS WRITTEN BY AHMET DOLMA
function choose1_1_Callback(hObject, eventdata, handles)
handles.choose1_1.Enable='Off';%%%%disables itself
handles.act11.String='Inactive';%%%%inactivates itself
handles.act11.BackgroundColor=[1 0.07 0.65];%%%% evaluates background color
handles.cho1.Enable='Off';handles.cho2.Enable='On';handles.cho3.Enable='On'; %%enables choices
handles.cho1.Visible='On';handles.cho2.Visible='On';handles.cho3.Visible='On'; %%% opens choices
% hObject    handle to choose1_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in choose2_1.
function choose2_1_Callback(hObject, eventdata, handles)
handles.dice.Enable='On'; %%enables dice
handles.choose2_1.Enable='Off'; %disables choice
handles.act21.String='Inactive';    %inactivates
handles.act21.BackgroundColor=[1 0.07 0.65]; %%  evaluates background
% hObject    handle to choose2_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in choose3_1.
function choose3_1_Callback(hObject, eventdata, handles)
handles.choose3_1.Enable='Off';   %%%disables choose 3
handles.act31.String='Inactive';  %%%inactivates act31
handles.act31.BackgroundColor=[1 0.07 0.65]; %%evaluates background color 
handles.cho4.Enable='Off';handles.cho5.Enable='On';handles.cho6.Enable='On' %%%%%enables cho4 and disables cho5 and cho 6
handles.panel_trap.Title='Choose the clay you wanna trap them'%%%panel title is updated
handles.panel_trap.Visible='On';%%trap panel is shown
handles.bonusoops1.Visible='On';handles.bonusoops2.Visible='On';    %%%%bonus oops is shown
% hObject    handle to choose3_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in choose4_1.
function choose4_1_Callback(hObject, eventdata, handles) %similar with the line 2957
handles.table.Data{1,2}=handles.table.Data{1,2}+handles.lost1;
handles.choose4_1.Enable='Off';
handles.act41.String='Inactive';
handles.act41.BackgroundColor=[1 0.07 0.65];
% hObject    handle to choose4_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in bns1.

% --- Executes on button press in bonus_button.
% --- THIS PART IS WRITTEN BY AHMET DOLMA
function bonus_button_Callback(hObject, eventdata, handles)
x=handles.selection;
switch 1
    case x==1     
        if strcmp(handles.panelbonus1.Visible,'off')%%checks if bonus panel is unvisible, if so, if so, make string hide bonusses 
            %if not make string show bonusses
            handles.panelbonus1.Visible='On';
            handles.bonus_button.String='Hide Bonuses';
        elseif strcmp(handles.panelbonus1.Visible,'on')
            handles.panelbonus1.Visible='Off';
            handles.bonus_button.String='Show Bonuses';
        end
        
    case x==2
         if strcmp(handles.panelbonus2.Visible,'off')
            handles.panelbonus2.Visible='On';
            handles.bonus_button.String='Hide Bonuses';
        elseif strcmp(handles.panelbonus2.Visible,'on')
            handles.panelbonus2.Visible='Off';
            handles.bonus_button.String='Show Bonuses';
        end
    case x==3
       if strcmp(handles.panelbonus3.Visible,'off')
            handles.panelbonus3.Visible='On';
            handles.bonus_button.String='Hide Bonuses';
        elseif strcmp(handles.panelbonus3.Visible,'on')
            handles.panelbonus3.Visible='Off';
            handles.bonus_button.String='Show Bonuses';
        end
end
guidata(hObject, handles)
            % hObject    handle to bonus_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in choose4_3.
function choose4_3_Callback(hObject, eventdata, handles)%%%%similar with line 2957
handles.table.Data{1,2}=handles.table.Data{1,2}+handles.lost3;
handles.choose4_3.Enable='Off';
handles.act43.String='Inactive';
handles.act43.BackgroundColor=[1 0.07 0.65];
% hObject    handle to choose4_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in choose3_3.
function choose3_3_Callback(hObject, eventdata, handles)%%%%similar with line 2957
handles.choose3_3.Enable='Off';
handles.act33.String='Inactive';
handles.act33.BackgroundColor=[1 0.07 0.65];
handles.cho6.Enable='Off';handles.cho4.Enable='On';handles.cho5.Enable='On'
handles.panel_trap.Title='Choose the clay you wanna trap them'%%%%%evaluates panel trap title
handles.panel_trap.Visible='On';%%%%makes trap panel visible
handles.bonusoops1.Visible='On';handles.bonusoops2.Visible='On';
% hObject    handle to choose3_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in choose2_3.
function choose2_3_Callback(hObject, eventdata, handles)%%%%similar with line 2957
handles.dice.Enable='On';
handles.choose2_3.Enable='Off';
handles.act23.String='Inactive';
handles.act23.BackgroundColor=[1 0.07 0.65];
% hObject    handle to choose2_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in choose1_3.
function choose1_3_Callback(hObject, eventdata, handles)%%%%similar with line 2957
handles.choose1_3.Enable='Off';
handles.act11.String='Inactive';
handles.act13.BackgroundColor=[1 0.07 0.65];
handles.cho3.Enable='Off';handles.cho1.Enable='On';handles.cho2.Enable='On';
handles.cho1.Visible='On';handles.cho2.Visible='On';handles.cho3.Visible='On';
% hObject    handle to choose1_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in choose4_2.
function choose4_2_Callback(hObject, eventdata, handles)%%%%similar with line 2957
handles.table.Data{1,2}=handles.table.Data{1,2}+handles.lost2;
handles.choose4_2.Enable='Off';
handles.act42.String='Inactive';
handles.act42.BackgroundColor=[1 0.07 0.65];
% hObject    handle to choose4_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in choose3_2.
function choose3_2_Callback(hObject, eventdata, handles)%%%%similar with line 3055
handles.choose3_2.Enable='Off';
handles.act32.String='Inactive';
handles.act32.BackgroundColor=[1 0.07 0.65];
handles.cho5.Enable='Off';handles.cho4.Enable='On';handles.cho6.Enable='On'
handles.panel_trap.Title='Choose the clay you wanna trap them'
handles.panel_trap.Visible='On';
handles.bonusoops1.Visible='On';handles.bonusoops2.Visible='On';
guidata(hObject, handles);
% hObject    handle to choose3_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in choose2_2.
function choose2_2_Callback(hObject, eventdata, handles)%%%%similar with line 2957
handles.dice.Enable='on';
handles.choose2_2.Enable='Off';
handles.act22.String='Inactive';
handles.act22.BackgroundColor=[1 0.07 0.65];
% hObject    handle to choose2_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in choose1_2.
function choose1_2_Callback(hObject, eventdata, handles)%%%%similar with line 2957
handles.choose1_2.Enable='Off';
handles.act12.String='Inactive';
handles.act12.BackgroundColor=[1 0.07 0.65];
handles.cho2.Enable='Off';handles.cho1.Enable='On';handles.cho3.Enable='On';
handles.cho1.Visible='On';handles.cho2.Visible='On';handles.cho3.Visible='On';
guidata(hObject, handles)
% hObject    handle to choose1_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in bns2.
% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function bns2_Callback(hObject, eventdata, handles)
handles.dice.Enable='on';% enables dice button
handles.bns2.Enable='off';%%disables bns2 button
handles.section=handles.team_button.Value;
x=handles.selection;
switch 1
    case x==1 %%%%%Team 1 bonus selection
        handles.panelbonus1.Visible='on';%%%panel for first team bonus is shown
if strcmp(handles.act21.String,'Inactive')%% checks if act21 is inactive or not
    handles.act21.Enable='On'; %%%%enables act 21 
    handles.act21.String='Activate'; %%%%eavaluates string of act21
end
    if strcmp(handles.act31.String,'Inactive')%%similar with line 3150
    handles.act31.Enable='On';
    handles.act31.String='Activate';
    end
    if strcmp(handles.act11.String,'Inactive')%%similar with line 3150
    handles.act11.Enable='On';
    handles.act11.String='Activate';
    end
    if strcmp(handles.act41.String,'Inactive')%%similar with line 3150
    handles.act41.Enable='On';
    handles.act41.String='Activate';
    end
    case x==2
        handles.panelbonus2.Visible='on';%%panel for second team is shown
         %%%%%Team 2 bonus selection
if strcmp(handles.act22.String,'Inactive')%%similar with line 3150
    handles.act22.Enable='On';
    handles.act22.String='Activate';
end
    if strcmp(handles.act32.String,'Inactive')%%similar with line 3150
    handles.act32.Enable='On';
    handles.act32.String='Activate';
    end
    if strcmp(handles.act12.String,'Inactive')%%similar with line 3150
    handles.act12.Enable='On';
    handles.act12.String='Activate';
    end
    if strcmp(handles.act42.String,'Inactive')%%similar with line 3150
    handles.act42.Enable='On';
    handles.act42.String='Activate';
    end
    
    case x==3
        handles.panelbonus3.Visible='on';%%%panel for third team is shown
        %%%%%Team 3 bonus selection
if strcmp(handles.act23.String,'Inactive')%%similar with line 3150
    handles.act23.Enable='On';
    handles.act23.String='Activate';
end
    if strcmp(handles.act33.String,'Inactive')%%similar with line 3150
    handles.act33.Enable='On';
    handles.act33.String='Activate';
    end
    if strcmp(handles.act13.String,'Inactive')%%similar with line 3150
    handles.act13.Enable='On';
    handles.act13.String='Activate';
    end
    if strcmp(handles.act43.String,'Inactive')%%similar with line 3150
    handles.act43.Enable='On';
    handles.act43.String='Activate';
    end
end
guidata(hObject, handles)
% hObject    handle to bns2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in bns.
% --- THIS PART IS WRITTEN BY AHMET DOLMA
function bns_Callback(hObject, eventdata, handles)%%%%%%%same as line 3142
handles.dice.Enable='on';
handles.bns.Enable='off';
handles.section=handles.team_button.Value;
x=handles.selection;
switch 1
    case x==1 %%%%%Team 1 bonus selection
        handles.panelbonus1.Visible='on';
if strcmp(handles.act21.String,'Inactive')
    handles.act21.Enable='On';
    handles.act21.String='Activate';
end
    if strcmp(handles.act31.String,'Inactive')
    handles.act31.Enable='On';
    handles.act31.String='Activate';
    end
    if strcmp(handles.act11.String,'Inactive')
    handles.act11.Enable='On';
    handles.act11.String='Activate';
    end
    if strcmp(handles.act41.String,'Inactive')
    handles.act41.Enable='On';
    handles.act41.String='Activate';
    end
    case x==2
        handles.panelbonus2.Visible='on';
         %%%%%Team 2 bonus selection
if strcmp(handles.act22.String,'Inactive')
    handles.act22.Enable='On';
    handles.act22.String='Activate';
end
    if strcmp(handles.act32.String,'Inactive')
    handles.act32.Enable='On';
    handles.act32.String='Activate';
    end
    if strcmp(handles.act12.String,'Inactive')
    handles.act12.Enable='On';
    handles.act12.String='Activate';
    end
    if strcmp(handles.act42.String,'Inactive')
    handles.act42.Enable='On';
    handles.act42.String='Activate';
    end
    
    case x==3
        handles.panelbonus3.Visible='on';
        %%%%%Team 3 bonus selection
if strcmp(handles.act23.String,'Inactive')
    handles.act23.Enable='On';
    handles.act23.String='Activate';
end
    if strcmp(handles.act33.String,'Inactive')
    handles.act33.Enable='On';
    handles.act33.String='Activate';
    end
    if strcmp(handles.act13.String,'Inactive')
    handles.act13.Enable='On';
    handles.act13.String='Activate';
    end
    if strcmp(handles.act43.String,'Inactive')
    handles.act43.Enable='On';
    handles.act43.String='Activate';
    end
end
guidata(hObject, handles)
% hObject    handle to bns (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function act11_Callback(hObject, eventdata, handles)
handles.choose1_1.Enable='on';%%%enables choice 1
handles.act11.String='Active';%%evaluates string
handles.act11.BackgroundColor=[0 1 0];%%evaluates background color
handles.act11.Enable='Off';%%%disables itself
if strcmp(handles.act21.String,'Activate')%%%%%%checks if act21 is active or not
    handles.act21.Enable='Off';%%%if so, make it inactive
    handles.act21.String='Inactive';%%evaluate its string
end
    if strcmp(handles.act31.String,'Activate')%%%same as before
    handles.act31.Enable='Off';
    handles.act31.String='Inactive';
    end
    if strcmp(handles.act41.String,'Activate')%%same as before
    handles.act41.Enable='Off';
    handles.act41.String='Inactive';
    end
% hObject    handle to act11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in act21.
function act21_Callback(hObject, eventdata, handles)%%%%similar with the line 3284
handles.choose2_1.Enable='on';
handles.act21.String='Active';
handles.act21.BackgroundColor=[0 1 0];
handles.act21.Enable='Off';

if strcmp(handles.act11.String,'Activate')
    handles.act11.Enable='Off';
    handles.act11.String='Inactive';
end
    if strcmp(handles.act31.String,'Activate')
    handles.act31.Enable='Off';
    handles.act31.String='Inactive';
    end
    if strcmp(handles.act41.String,'Activate')
    handles.act41.Enable='Off';
    handles.act41.String='Inactive';
    end
% hObject    handle to act21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in act31.
function act31_Callback(hObject, eventdata, handles)%%%%similar with the line 3284
handles.choose3_1.Enable='on';
handles.act31.String='Active';
handles.act31.BackgroundColor=[0 1 0];
handles.act31.Enable='Off';

if strcmp(handles.act21.String,'Activate')
    handles.act21.Enable='Off';
    handles.act21.String='Inactive';
end
    if strcmp(handles.act11.String,'Activate')
    handles.act11.Enable='Off';
    handles.act11.String='Inactive';
    end
    if strcmp(handles.act41.String,'Activate')
    handles.act41.Enable='Off';
    handles.act41.String='Inactive';
    end
% hObject    handle to act31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in act41.
function act41_Callback(hObject, eventdata, handles)%%%%similar with the line 3284
handles.choose4_1.Enable='on';
handles.act41.String='Active';
handles.act41.BackgroundColor=[0 1 0];
handles.act41.Enable='Off';
if strcmp(handles.act21.String,'Activate')
    handles.act21.Enable='Off';
    handles.act21.String='Inactive';
end
    if strcmp(handles.act31.String,'Activate')
    handles.act31.Enable='Off';
    handles.act31.String='Inactive';
    end
    if strcmp(handles.act11.String,'Activate')
    handles.act11.Enable='Off';
    handles.act11.String='Inactive';
    end
    
% hObject    handle to act41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in cho1.
function cho1_Callback(hObject, eventdata, handles)%%cho1 means choice 1 
handles.selection=1;handles.team_button.Value=1;%%sets team selection in pop-up as team 1
handles.cho1.Visible='Off';handles.cho2.Visible='Off';handles.cho3.Visible='Off';%%closes the choices
% hObject    handle to cho1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in cho2.
function cho2_Callback(hObject, eventdata, handles)
handles.selection=2;%%%
handles.team_button.Value=2;%%% %%sets team selection in pop-up as team 1
handles.cho1.Visible='Off';handles.cho2.Visible='Off';handles.cho3.Visible='Off';%%closes the choices
% hObject    handle to cho2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in cho3.
function cho3_Callback(hObject, eventdata, handles)
handles.selection=3;
handles.team_button.Value=3;%%% %%sets team selection in pop-up as team 3
handles.cho1.Visible='Off';handles.cho2.Visible='Off';handles.cho3.Visible='Off';%%closes the choices
% hObject    handle to cho3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in cho4.
function cho4_Callback(hObject, eventdata, handles)
if handles.selection2==8%%%check if selection for trapping is 8 or 27
        if handles.Pc8 < handles.table.Data{1,2}%%%%%same as oops clay buttons
            handles.Pc8= handles.table.Data{1,2}
            set(handles.command_text,'string','Subground soil is Normally Consolidated Clay. You must wait for consolidation. 10 percent of your money will be lost')
            Pr=handles.Pc8 %Pr used to get numerical value in handles.Pc8
            text=['Pc=',num2str(Pr)]
            set(handles.oops8,'string',text)
            handles.lost1=handles.table.Data{1,2}/10;
            handles.table.Data{1,2}=handles.table.Data{1,2}-handles.lost1;
        else
            set(handles.command_text,'string','Your Money is less than Pc of the soil. You dont need to pay money for consolidation. Wait for your turn')
            handles.Pc8=handles.Pc8
        end
        handles.table.Data{1,1}=8;
elseif handles.selection2==27%%%check if selection for trapping is 8 or 27
     if handles.Pc27 <  handles.table.Data{1,2}%%%%same as oops clay buttons
            handles.Pc27= handles.table.Data{1,2}
            set(handles.command_text,'string','Subground soil is Normally Consolidated Clay. You must wait for consolidation. 10 percent of your money will be lost')
            Pr=handles.Pc27 %Pr used to get numerical value in handles.Pc27
            text=['Pc=',num2str(Pr)]
            set(handles.oops27,'string',text)
            handles.lost1=handles.table.Data{1,2}/10;
            handles.table.Data{1,2}=handles.table.Data{1,2}-handles.lost1;
        else
            set(handles.command_text,'string','Your Money is less than Pc of the soil. You dont need to pay money for consolidation. Wait for your turn')
            handles.Pc27=handles.Pc27
     end
        handles.table.Data{1,1}=27;
end
handles.cho4.Visible='Off';handles.cho5.Visible='Off';handles.cho6.Visible='Off';
handles.panel_trap.Visible='Off';
guidata(hObject, handles);
  

% hObject    handle to cho4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in cho5.
function cho5_Callback(hObject, eventdata, handles)%%similar with line 3408
if handles.selection2==8%trap team 2 to oops soft clay
        if handles.Pc8 <  handles.table.Data{2,2}
            handles.Pc8= handles.table.Data{2,2}
            set(handles.command_text,'string','Subground soil is Normally Consolidated Clay. You must wait for consolidation. 10 percent of your money will be lost')
            Pr=handles.Pc8 %Pr used to get numerical value in handles.Pc8
            text=['Pc=',num2str(Pr)]
            set(handles.oops8,'string',text)
            handles.lost2=handles.table.Data{2,2}/10;
            handles.table.Data{2,2}=handles.table.Data{2,2}-handles.lost2;
        else
            set(handles.command_text,'string','Your Money is less than Pc of the soil. You dont need to pay money for consolidation. Wait for your turn')
            handles.Pc8=handles.Pc8
        end
        handles.table.Data{2,1}=8;     
elseif handles.selection2==27
    if handles.Pc27 <  handles.table.Data{2,2}
            handles.Pc27= handles.table.Data{2,2}
            set(handles.command_text,'string','Subground soil is Normally Consolidated Clay. You must wait for consolidation. 10 percent of your money will be lost')
            Pr=handles.Pc27 %Pr used to get numerical value in handles.Pc8
            text=['Pc=',num2str(Pr)]
            set(handles.oops27,'string',text)
            handles.lost2=handles.table.Data{2,2}/10;
            handles.table.Data{2,2}=handles.table.Data{2,2}-handles.lost2;
        else
            set(handles.command_text,'string','Your Money is less than Pc of the soil. You dont need to pay money for consolidation. Wait for your turn')
            handles.Pc27=handles.Pc27
        end
        handles.table.Data{2,1}=27;
end
handles.cho4.Visible='Off';handles.cho5.Visible='Off';handles.cho6.Visible='Off';
handles.panel_trap.Visible='Off';
guidata(hObject, handles);
% hObject    handle to cho5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in cho6.
function cho6_Callback(hObject, eventdata, handles)%similar with line 3408
if handles.selection2==8
        if handles.Pc8 <  handles.table.Data{3,2}
            handles.Pc8= handles.table.Data{3,2}
            set(handles.command_text,'string','Subground soil is Normally Consolidated Clay. You must wait for consolidation. 10 percent of your money will be lost')
            Pr=handles.Pc8 %Pr used to get numerical value in handles.Pc8
            text=['Pc=',num2str(Pr)]
            set(handles.oops8,'string',text)
            handles.lost3=handles.table.Data{3,2}/10;
            handles.table.Data{3,2}=handles.table.Data{3,2}-handles.lost3;
        else
            set(handles.command_text,'string','Your Money is less than Pc of the soil. You dont need to pay money for consolidation. Wait for your turn')
            handles.Pc8=handles.Pc8
        end
        handles.table.Data{3,1}=8;     
elseif handles.selection2==27
    if handles.Pc27 <  handles.table.Data{3,2}
            handles.Pc27= handles.table.Data{3,2}
            set(handles.command_text,'string','Subground soil is Normally Consolidated Clay. You must wait for consolidation. 10 percent of your money will be lost')
            Pr=handles.Pc27 %Pr used to get numerical value in handles.Pc8
            text=['Pc=',num2str(Pr)]
            set(handles.oops27,'string',text)
            handles.lost3=handles.table.Data{3,2}/10;
            handles.table.Data{3,2}=handles.table.Data{3,2}-handles.lost3;
        else
            set(handles.command_text,'string','Your Money is less than Pc of the soil. You dont need to pay money for consolidation. Wait for your turn')
            handles.Pc27=handles.Pc27
        end
        handles.table.Data{3,1}=27;
end
handles.cho4.Visible='Off';handles.cho5.Visible='Off';handles.cho6.Visible='Off';
handles.panel_trap.Visible='Off';
guidata(hObject, handles);
% hObject    handle to cho6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function universal_panel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to universal_panel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in bonusoops1.
function bonusoops1_Callback(hObject, eventdata, handles)%%%same as line 3544
handles.selection2=8;
handles.bonusoops1.Visible='Off';handles.bonusoops2.Visible='Off';
handles.cho4.Visible='On';handles.cho5.Visible='On';handles.cho6.Visible='On';
guidata(hObject, handles);
% hObject    handle to bonusoops1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in bonusoops2.
function bonusoops2_Callback(hObject, eventdata, handles)
handles.selection2=27;%%%assigns 27 for the given section
handles.bonusoops1.Visible='Off';handles.bonusoops2.Visible='Off';%%closes bonus oops buttons
handles.cho4.Visible='On';handles.cho5.Visible='On';handles.cho6.Visible='On'%%opens choices
guidata(hObject, handles);
% hObject    handle to bonusoops2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function cho5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cho5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in act13.
function act13_Callback(hObject, eventdata, handles)
handles.choose1_3.Enable='on';%%%enables first choice
handles.act13.String='Active';%%activates first choice
handles.act13.BackgroundColor=[0 1 0];%%%evaluates background color
handles.act13.Enable='Off';%%%%makes button inactive

if strcmp(handles.act23.String,'Activate')%%if the buttons are active, makes them inactive
    handles.act23.Enable='Off';
    handles.act23.String='Inactive';
end
    if strcmp(handles.act33.String,'Activate')
    handles.act33.Enable='Off';
    handles.act33.String='Inactive';
    end
    if strcmp(handles.act43.String,'Activate')
    handles.act43.Enable='Off';
    handles.act43.String='Inactive';
    end
guidata(hObject, handles);
% hObject    handle to act13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in act23.
function act23_Callback(hObject, eventdata, handles)%same as line 3562

handles.choose2_3.Enable='on';
handles.act23.String='Active';
handles.act23.BackgroundColor=[0 1 0];
handles.act23.Enable='Off';

if strcmp(handles.act13.String,'Activate')
    handles.act13.Enable='Off';
    handles.act13.String='Inactive';
end
    if strcmp(handles.act33.String,'Activate')
    handles.act33.Enable='Off';
    handles.act33.String='Inactive';
    end
    if strcmp(handles.act43.String,'Activate')
    handles.act43.Enable='Off';
    handles.act43.String='Inactive';
    end
    guidata(hObject, handles);
% hObject    handle to act23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in act33.
function act33_Callback(hObject, eventdata, handles)%same as line 3562
handles.choose3_3.Enable='on';
handles.act33.String='Active';
handles.act33.BackgroundColor=[0 1 0];
handles.act33.Enable='Off';

if strcmp(handles.act13.String,'Activate')
    handles.act13.Enable='Off';
    handles.act13.String='Inactive';
end
    if strcmp(handles.act23.String,'Activate')
    handles.act23.Enable='Off';
    handles.act23.String='Inactive';
    end
    if strcmp(handles.act43.String,'Activate')
    handles.act43.Enable='Off';
    handles.act43.String='Inactive';
    end
guidata(hObject, handles);
% hObject    handle to act33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in act43.
function act43_Callback(hObject, eventdata, handles)%same as line 3562
% hObject    handle to act43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.choose4_3.Enable='on';
handles.act43.String='Active';
handles.act43.BackgroundColor=[0 1 0];
handles.act43.Enable='Off';
if strcmp(handles.act23.String,'Activate')
    handles.act23.Enable='Off';
    handles.act23.String='Inactive';
end
    if strcmp(handles.act33.String,'Activate')
    handles.act33.Enable='Off';
    handles.act33.String='Inactive';
    end
    if strcmp(handles.act13.String,'Activate')
    handles.act13.Enable='Off';
    handles.act13.String='Inactive';
    end
guidata(hObject, handles);
% --- Executes on button press in act12.
function act12_Callback(hObject, eventdata, handles)%same as line 3562
handles.choose1_2.Enable='on';
handles.act12.String='Active';
handles.act12.BackgroundColor=[0 1 0];
handles.act12.Enable='Off';

if strcmp(handles.act22.String,'Activate')
    handles.act22.Enable='Off';
    handles.act22.String='Inactive';
end
    if strcmp(handles.act32.String,'Activate')
    handles.act32.Enable='Off';
    handles.act32.String='Inactive';
    end
    if strcmp(handles.act42.String,'Activate')
    handles.act42.Enable='Off';
    handles.act42.String='Inactive';
    end
guidata(hObject, handles);
% hObject    handle to act12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in act22.
function act22_Callback(hObject, eventdata, handles)%same as line 3562
handles.choose2_2.Enable='on';
handles.act22.String='Active';
handles.act22.BackgroundColor=[0 1 0];
handles.act22.Enable='Off';

if strcmp(handles.act12.String,'Activate')
    handles.act12.Enable='Off';
    handles.act12.String='Inactive';
end
    if strcmp(handles.act32.String,'Activate')
    handles.act32.Enable='Off';
    handles.act32.String='Inactive';
    end
    if strcmp(handles.act42.String,'Activate')
    handles.act42.Enable='Off';
    handles.act42.String='Inactive';
    end
    guidata(hObject, handles);
% hObject    handle to act22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in act32.
function act32_Callback(hObject, eventdata, handles)%same as line 3562
handles.choose3_2.Enable='on';
handles.act32.String='Active';
handles.act32.BackgroundColor=[0 1 0];
handles.act32.Enable='Off';

if strcmp(handles.act12.String,'Activate')
    handles.act12.Enable='Off';
    handles.act12.String='Inactive';
end
    if strcmp(handles.act22.String,'Activate')
    handles.act22.Enable='Off';
    handles.act22.String='Inactive';
    end
    if strcmp(handles.act42.String,'Activate')
    handles.act42.Enable='Off';
    handles.act42.String='Inactive';
    end
guidata(hObject, handles);
% hObject    handle to act32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in act42.
function act42_Callback(hObject, eventdata, handles)%same as line 3562
handles.choose4_2.Enable='on';
handles.act42.String='Active';
handles.act42.BackgroundColor=[0 1 0];
handles.act42.Enable='Off';
if strcmp(handles.act22.String,'Activate')
    handles.act22.Enable='Off';
    handles.act22.String='Inactive';
end
    if strcmp(handles.act32.String,'Activate')
    handles.act32.Enable='Off';
    handles.act32.String='Inactive';
    end
    if strcmp(handles.act12.String,'Activate')
    handles.act12.Enable='Off';
    handles.act12.String='Inactive';
    end
    
% hObject    handle to act42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function panel_luck_CreateFcn(hObject, eventdata, handles)
% hObject    handle to panel_luck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in goodluck_button1.
% --- THIS PART IS WRITTEN BY AHMET DOLMA
function goodluck_button1_Callback(hObject, eventdata, handles)
handles.goodluck_button1.Enable='off';%%%disables itself
handles.panel_luck.Visible='on';%%shows luck panel
B=randperm(60);
b=B(1);%%%randomly choose a number between 1 and 60
switch 1 %here matlab chooses a random number between 1 and 60 and distributes the card wrt to below probabilities
    case 1<=b&&b<=7%%if the cards is selected, (meands 7 card in here) execute this case
        handles.txt_luck.String='Choose a General or Lab Test Question.If you answer the question correctly,take 150 money from the bank.If not, lose 150 money';
       %evaluates luck panel string
        handles.number_question.Visible='on';%% editable text to choose question will show
        handles.check_luck.Visible='on';%%check luck button will appear
    case 7<b&&b<=14
        handles.txt_luck.String='Dice once. If it is an even number, get 100 money from other teams, if you get an odd number, pay 100 to them'
       %%evaluate luck panel string
        handles.dice_luck.Visible='on'%%dice luck will be shown
    case 14<b&&b<=21
        handles.txt_luck.String='Dice twice. If total is between 6-12, take 200 cash from the bank'%%evaluate luck panel string
        handles.dice_luck2.Visible='on'%%another dice luck will be shown
    case 21<b&&b<=28
        handles.txt_luck.String='Take 50 money from other teams'%%evaluates luck string
        handles.getmoney3.Visible='On'%%get money button will appear
    case 28<b&&b<=35
        handles.txt_luck.String='Pay your Taxes! Pay 50 money to the bank'%%evaluates luck string
        handles.getmoney4.Visible='On'%%Pay money button will appear
    case 35<b&&b<=42
        handles.txt_luck.String='If you have 1500 money or more, give 100 money to the bank; if not, raise your money to 1500'
      %evaluates luck string
        x=handles.selection;    
       handles.getmoney5.Visible='on';%Pay money button will appear
                    %first team
                       if x==1
                                       if 1500<=handles.table.Data{1,2} % checks if the team's money is more than 1500 or not
                                           handles.getmoney5.String='Pay Money'% if so, pay money is evaluated
                                       else
                                            handles.getmoney5.String='1500$' %if not, 1500 money will be get
                                                end
                       elseif x==2
                                         if 1500<=handles.table.Data{2,2}%same as line 3797
                                        handles.getmoney5.String='Pay Money'
                                         else
                                         handles.getmoney5.String='1500$'
                                         end
                       elseif x==3
                                    if 1500<=handles.table.Data{3,2} %same as line 3797
                                        handles.getmoney5.String='Pay Money'
                                    else
                                        handles.getmoney5.String='1500$'
                                    end
                       end    
    case 42<b&&b<=46
        handles.txt_luck.String='Change money with another team' %%%%evaluates luck panel string
        handles.panel_change.Visible='On'%money exchange panell willl be shown
        x=handles.selection;
            switch 1%%%%decides which team clicked the button and restricts their choices(if team one is playing, cannot choose team1)
               case x==1
                handles.change1.Enable='off';handles.change2.Enable='on';handles.change3.Enable='on';
                case x==2
                  handles.change2.Enable='off';handles.change1.Enable='on';handles.change3.Enable='on';
                  case x==3
                 handles.change3.Enable='off';handles.change2.Enable='on';handles.change1.Enable='on';
            end
%%%%%%%%%%%%%%%%%another big case%%%%%%%%%%%%%%%%%%
    case 46<b&&b<=50
        handles.txt_luck.String='Change location with another team and take 150 money from them'%evaluates luck panel
        handles.panel_loc_change.Visible='On'%%location change panel will be shown
        x=handles.selection;%%%%decides which team clicked the button and restricts their choices(if team 1 is playing, cannot choose team1)
            switch 1
               case x==1
                handles.loc1.Enable='off';handles.loc2.Enable='on';handles.loc3.Enable='on';
                case x==2
                  handles.loc2.Enable='off';handles.loc1.Enable='on';handles.loc3.Enable='on';
                  case x==3
                 handles.loc3.Enable='off';handles.loc2.Enable='on';handles.loc1.Enable='on';
            end
    case 50<b&&b<=60
        handles.txt_luck.String='Dice once.If it is between 1 or 2, take half of your money from the bank'%%evaluates luck panel
        handles.dice_luck3.Visible='On';%% opens other dice luck
end
guidata(hObject, handles);
% hObject    handle to goodluck_button1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in goodluck_button3.
% --- THIS PART IS WRITTEN BY AHMET DOLMA
function goodluck_button3_Callback(hObject, eventdata, handles)%%%%%%%%same as goodluck=button1 line 3767
handles.goodluck_button3.Enable='off';
handles.panel_luck.Visible='on'
B=randperm(60);
b=B(1);
switch 1
    case 1<=b&&b<=7
        handles.txt_luck.String='Choose a General or Lab Test Question.If you answer the question correctly,take 150 money from the bank.If not, lose 150 money';
        handles.check_luck.Visible='on'
    case 7<b&&b<=14
        handles.txt_luck.String='Dice once. If it is an even number, get 100 money from other teams, if you get an odd number, pay 100 to them'
        handles.dice_luck.Visible='on'
    case 14<b&&b<=21
        handles.txt_luck.String='Dice twice. If total is between 6-12, take 200 cash from the bank'
        handles.dice_luck2.Visible='on'
    case 21<b&&b<=28
        handles.txt_luck.String='Take 50 money from other teams'
        handles.getmoney3.Visible='On'
    case 28<b&&b<=35
        handles.txt_luck.String='Pay your Taxes! Pay 50 money to the bank'
        handles.getmoney4.Visible='On'
        
        %--------------another big case---------------
    case 35<b&&b<=42
        handles.txt_luck.String='If you have 1500 money or more, give 100 money to the bank; if not, raise your money to 1500'
       x=handles.selection;    
       handles.getmoney5.Visible='on';
                    %first team
                       if x==1
                                       if 1500<=handles.table.Data{1,2}
                                           handles.getmoney5.String='Pay Money'
                                       else
                                            handles.getmoney5.String='1500$'
                                                end
                       elseif x==2
                                         if 1500<=handles.table.Data{2,2}
                                        handles.getmoney5.String='Pay Money'
                                         else
                                         handles.getmoney5.String='1500$'
                                         end
                       elseif x==3
                                    if 1500<=handles.table.Data{3,2}
                                        handles.getmoney5.String='Pay Money'
                                    else
                                        handles.getmoney5.String='1500$'
                                    end
                       end    
    case 42<b&&b<=46
        handles.txt_luck.String='Change money with another team'
        handles.panel_change.Visible='On'
        x=handles.selection;
            switch 1
               case x==1
                handles.change1.Enable='off';handles.change2.Enable='on';handles.change3.Enable='on';
                case x==2
                  handles.change2.Enable='off';handles.change1.Enable='on';handles.change3.Enable='on';
                  case x==3
                 handles.change3.Enable='off';handles.change2.Enable='on';handles.change1.Enable='on';
            end
%%%%%%%%%%%%%%%%%another big case%%%%%%%%%%%%%%%%%%
    case 46<b&&b<=50
        handles.txt_luck.String='Change location with another team and take 150 money from them'
        handles.panel_loc_change.Visible='On'
        x=handles.selection;
            switch 1
               case x==1
                handles.loc1.Enable='off';handles.loc2.Enable='on';handles.loc3.Enable='on';
                case x==2
                  handles.loc2.Enable='off';handles.loc1.Enable='on';handles.loc3.Enable='on';
                  case x==3
                 handles.loc3.Enable='off';handles.loc2.Enable='on';handles.loc1.Enable='on';
            end
    case 50<b&&b<=60
        handles.txt_luck.String='Dice once.If it is between 1 or 2, take half of your money from the bank'
        handles.dice_luck3.Visible='On';
end
guidata(hObject, handles);
% hObject    handle to goodluck_button3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
% --- This part deactivates the buttons that are not selected.
function number_question_Callback(hObject, eventdata, handles)
b=str2num(handles.number_question.String);%takes index
switch 1 %evaluates the number and opens the question, or gives error
    case b==1
        handles.g1_new.Enable='on';
        handles.warning2.Enable='off';
    case b==2
        handles.g2.Enable='on';
        handles.warning2.Enable='off';
    case b==3
        handles.lab3.Enable='on';
        handles.warning2.Enable='off';
    case b==4
        handles.warning2.Enable='on';
        handles.warning2.Enable='off';
    case b==5 
        handles.lab5.Enable='on';
        handles.warning2.Enable='off';
    case b==6
        handles.g6.Enable='on';
        handles.warning2.Enable='off';
    case b==7
        handles.g7.Enable='on';
        handles.warning2.Enable='off';
    case b==8
        handles.warning2.Enable='on';
    case b==9
        handles.g9.Enable='on';
        handles.warning2.Enable='off';
    case b==10
        handles.warning2.Enable='on';
    case b==11
        handles.g11.Enable='on';
        handles.warning2.Enable='off';
    case b==12
        handles.lab12.Enable='on';
        handles.warning2.Enable='off';
    case b==13
        handles.g13.Enable='on';
        handles.warning2.Enable='off';
    case b==14 
        handles.warning2.Enable='on';
    case b==15 
        handles.g15.Enable='on';
        handles.warning2.Enable='off';
    case b==16
        handles.g16.Enable='on';
        handles.warning2.Enable='off';
    case b==17
        handles.lab17.Enable='on';
        handles.warning2.Enable='off';
    case b==18
        handles.g18.Enable='on';
        handles.warning2.Enable='off';
    case b==19
        handles.lab19.Enable='on';
        handles.warning2.Enable='off';
    case b==20
        handles.g20.Enable='on';
        handles.warning2.Enable='off';
    case b==21
        handles.warning2.Enable='on';
    case b==22
        handles.g22.Enable='on';
        handles.warning2.Enable='off';
    case b==23
        handles.lab23.Enable='on';
        handles.warning2.Enable='off';
    case b==24
        handles.warning2.Enable='on';
    case b==25
        handles.g25.Enable='on';
        handles.warning2.Enable='off';
    case b==26
        handles.g26.Enable='on';
        handles.warning2.Enable='off';
    case b==27
        handles.warning2.Enable='on';
    case b==28 
        handles.lab28.Enable='on';
        handles.warning2.Enable='off';
    case b==29
        handles.g29.Enable='on';
        handles.warning2.Enable='off';
    case b==30
        handles.g30.Enable='on';
        handles.warning2.Enable='off';
    case b==31
        handles.lab31.Enable='on';
        handles.warning2.Enable='off';
    case b==32
        handles.g32.Enable='on';
        handles.warning2.Enable='off';
    case b==33
        handles.warning2.Enable='on';
    case b==34
        handles.warning2.Enable='on';
    case b==35
        handles.lab35.Enable='on';
        handles.warning2.Enable='off';
    case b==36
        handles.g36.Enable='on';
        handles.warning2.Enable='off';
    case b==37
        handles.g37.Enable='on';
        handles.warning2.Enable='off';
end
if handles.warning2.Enable=='off';
    handles.number_question.Visible='Off'%%%If the warning is off, close the number box
end
guidata(hObject, handles);

        % hObject    handle to number_question (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of number_question as text
%        str2double(get(hObject,'String')) returns contents of number_question as a double


% --- Executes during object creation, after setting all properties.
function number_question_CreateFcn(hObject, eventdata, handles)
% hObject    handle to number_question (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in g29.
function pushbutton182_Callback(hObject, eventdata, handles)
% hObject    handle to g29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in g1_new.
function g1(hObject, eventdata, handles)
% hObject    handle to g1_new (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in go_button.
% --- THIS PART IS WRITTEN BY MUHAMMET DURMAZ
function go_button_Callback(hObject, eventdata, handles)
x=handles.team_button.Value;%assigns x as team number
b=str2num(handles.ed_taxi.String);
handles.taxi_warning.Visible='off';%closes warning
switch 1 %evaluates the number and opens the question, or gives error
    case b==1
        handles.g1_new.Enable='on';
    case b==2
        handles.g2.Enable='on';
    case b==3
        handles.lab3.Enable='on';
    case b==4
        handles.goodluck_button1.Enable='on';
    case b==5 
        handles.lab5.Enable='on';
    case b==6
        handles.g6.Enable='on';
    case b==7
        handles.g7.Enable='on';
    case b==8
        handles.oops8.Enable='on';
    case b==9
        handles.g9.Enable='on';
    case b==10
        handles.Universal_button.Enable='on';
    case b==11
        handles.g11.Enable='on';
    case b==12
        handles.lab12.Enable='on';
    case b==13
        handles.g13.Enable='on';
    case b==14 
        handles.goodluck_button2.Enable='on';
    case b==15 
        handles.g15.Enable='on';
    case b==16
        handles.g16.Enable='on';
    case b==17
        handles.lab17.Enable='on';
    case b==18
        handles.g18.Enable='on';
    case b==19
        handles.lab19.Enable='on';
    case b==20
        handles.g20.Enable='on';
    case b==21
        handles.bns.Enable='on';
    case b==22
        handles.g22.Enable='on';
    case b==23
        handles.lab23.Enable='on';
    case b==24
        handles.goodluck_button3.Enable='on';
    case b==25
        handles.g25.Enable='on';
    case b==26
        handles.g26.Enable='on';
    case b==27
        handles.oops27.Enable='on';
    case b==28 
        handles.lab28.Enable='on';
    case b==29
        handles.g29.Enable='on';
    case b==30
        handles.g30.Enable='on';
    case b==31
        handles.lab31.Enable='on';
    case b==32
        handles.g32.Enable='on';
    case b==33
        handles.bns2.Enable='on';
    case b==34
        handles.taxi_warning.Visible='on';
        return
    case b==35
        handles.lab35.Enable='on';
    case b==36
        handles.g36.Enable='on';
    case b==37
        handles.g37.Enable='on';
end
handles.str_newnumber.String=b;
guidata(hObject, handles);
switch 1
    case x==1 
        if b<38
            if b<handles.table.Data{1,1}
                handles.table.Data{1,2}=handles.table.Data{1,2}+100;%%%if start point is passed, adds 100 money
                if handles.table.Data{1,2}>=3000%%%checks if game is finished
                    handles.mainpanel.Visible='off';
                    handles.win1.Visible='on';
                end
            end
        handles.table.Data{1,1}=b;%%%%evaluates location
        handles.warning.Visible='off';%%%warning dissapears
        handles.heytaxi.Visible='off';%%%heytaxi dissappears
         handles.dice.Enable='On';%%enables dice button
        else 
            handles.warning.Visible='on';
        end
    case x==2
        
        if b<38
            if b<handles.table.Data{2,1}
                handles.table.Data{2,2}=handles.table.Data{2,2}+100;%%%if start point is passed, adds 100 money
                if handles.table.Data{2,2}>=3000%%%checks if game is finished
                    handles.mainpanel.Visible='off';%%%%heytaxi dissappears
                    handles.win2.Visible='on';%%enables dice button
                end
            end
        handles.table.Data{2,1}=b;%%%%evaluates location
        handles.warning.Visible='off';%%%warning dissapears
        handles.heytaxi.Visible='off';%%%%heytaxi dissappears
         handles.dice.Enable='On';%%enables dice button
        else 
            handles.warning.Visible='on'
        end
    case x==3
        if b<38
            if b<handles.table.Data{3,1}%%%if start point is passed, adds 100 money
                handles.table.Data{3,2}=handles.table.Data{3,2}+100;
                if handles.table.Data{3,2}>=3000%%%checks if game is finished
                    handles.mainpanel.Visible='off';
                    handles.win3.Visible='on';
                end
            end
                    
        handles.table.Data{3,1}=b;%%%%evaluates location
        handles.warning.Visible='off';%%%warning dissapears
        handles.heytaxi.Visible='off';%%%%heytaxi dissappears
         handles.dice.Enable='On';%%%%enables dice button
        else 
            handles.warning.Visible='on';%shows warning 
            end
end
handles.dice.Enable='on';%enables dice
guidata(hObject, handles);
% hObject    handle to go_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
