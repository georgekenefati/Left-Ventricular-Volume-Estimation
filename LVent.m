%% L-Vent Volume Measurement Tool
% George Kenefati 
% BMENE6003 Module 1

clc; clear all; close all; % clear previous figures
%% Part I: Mitral Valve View EDV and ESV
%% STEP 1: Read mitral valve video to select EDV and ESV frames

% Import video with VideoReader for procesing later
mitral = VideoReader('./data/SA_MitralVolunteer.mov');

% Dialogue box for instructions
dlg = ({'In the following window, please determine your desired EDV and ESV frames for the Mitral Valve view.';'';
    'You may use the buttons at the top of the window to pan through the video.';
    'The frame numbers are located in the bottom right corner of the window.'; '';
    'Once you have determined your desired EDV and ESV frames, please close the video window and enter the frame numbers in the subsequent prompt.'});
msg = msgbox(dlg,'Welcome to L-Vent: Mitral','help','modal');
uiwait(msg) % wait for user to continue
%% Step 2: Display video with implay panning tools

% The video will play slightly slower at 15 fps to aid viewing of EDV and ESV
m_vid = implay('./data/SA_MitralVolunteer.mov',15);
waitfor(m_vid)
%% STEP 3: Ask user for desired EDV and ESV frames

% Create dialog box
prompt = {'Enter EDV frame:'; 'Enter ESV frame:'};
dlgtitle = 'Mitral Valve EDV and ESV Frames';
dims = [1 45];
definput = {'00';'00'};
ans = str2double(inputdlg(prompt,dlgtitle,dims,definput));
%% STEP 4: Present EDV and ESV figures and  dialog to measure diameters

% Read and save frames as selected
vid = read(mitral);
frame = mitral.NumberOfFrames;
imwrite(vid(:,:,:,ans(1)),strcat('mitral_EDV-',num2str(ans(1)),'.png'));
imwrite(vid(:,:,:,ans(2)),strcat('mitral_ESV-',num2str(ans(2)),'.png'));

% Conversion factor (evaluated manually)
pix2cm = 10 / 240; % cm / pixels

% Create dialog for instructions and to callback line distance variables
% converted directly to cm.
d = dialog('Position',[565 45 400 200],'Name','Instructions');
    txt = uicontrol('Parent',d,...
               'Style','text',...
               'Position',[0 80 400 100],...
               'String',{'Click and drag the endpoints across the diameter of the mitral valve on both frames.';'';               
               'Click the close button when you are done to save the line distances.';'';
               '------------------------------------------------------------------------------------------------------';
               '<-- Mitral Valve EDV                                         Mitral Valve ESV -->'
               '------------------------------------------------------------------------------------------------------';});
    btn = uicontrol('Parent',d,...
               'Position',[165 30 70 25],...
               'String','Close',...
               'Callback','mdistEDV = getDistance(mlineEDV)*pix2cm;,mdistESV = getDistance(mlineESV)*pix2cm;,delete(f1gh);,delete(f2gh);,delete(gcf);');


% Output figures side by side
f1gh = figure('Name','Mitral Valve EDV'); % name the figure
immEDV = imshow(sprintf('mitral_EDV-%d.png',ans(1)));
mlineEDV = imdistline(gca,[320 320],[200 300]); % add dragable line
pos1 = get(gcf,'Position'); % get position of fig 1
set(gcf,'Position', pos1 - [pos1(3)/2,0,0,0]) % shift fig 1

f2gh = figure('Name','Mitral Valve ESV'); % name the figure
immESV = imshow(sprintf('mitral_ESV-%d.png',ans(2)));
mlineESV = imdistline(gca,[320 320],[200 300]); %add dragable line
pos2 = get(gcf,'Position');  % get position of fig 2
set(gcf,'Position', pos2 + [pos1(3)/2,0,0,0]) % shift fig 2

uiwait(d)
%% Part II: Papillary Muscle View EDV and ESV
%% STEP 1: Read papillary muscles view video to select EDV and ESV frames

% Import video with VideoReader for procesing later
papillary = VideoReader('./data/SA_PapilaryVolunteer.mov');

% Dialogue box for instructions
dlg = ({'In the following window, please determine your desired EDV and ESV frames for the Papillary Muscles view.';'';
    'You may use the buttons at the top of the window to pan through the video.';
    'The frame numbers are located in the bottom right corner of the window.'; '';
    'Once you have determined your desired EDV and ESV frames, please close the video window and enter the frame numbers in the subsequent prompt.'});
msg = msgbox(dlg,'Welcome to L-Vent: Papillary','help','modal');
uiwait(msg) % wait for user to continue
%% Step 2: Display video with implay panning tools

% The video will play slightly slower at 15 fps to aid viewing of EDV and ESV
p_vid = implay('./data/SA_PapilaryVolunteer.mov',15);
waitfor(p_vid)
%% STEP 3: Ask user for desired EDV and ESV frames

% Create dialog box
prompt = {'Enter EDV frame:'; 'Enter ESV frame:'};
dlgtitle = 'Papillary Muscle EDV and ESV Frames';
dims = [1 45];
definput = {'00';'00'};
ans = str2double(inputdlg(prompt,dlgtitle,dims,definput));
%% STEP 4: Present EDV and ESV figures and  dialog to measure diameters

% Read and save frames as selected
vid = read(papillary);
frame = papillary.NumberOfFrames;
imwrite(vid(:,:,:,ans(1)),strcat('papillary_EDV-',num2str(ans(1)),'.png'));
imwrite(vid(:,:,:,ans(2)),strcat('papillary_ESV-',num2str(ans(2)),'.png'));

% Conversion factor (evaluated manually)
pix2cm = 10 / 240; % cm / pixels

% Create dialog for instructions and to callback line distance variables
% converted directly to cm.
d = dialog('Position',[565 45 400 200],'Name','Instructions');
    txt = uicontrol('Parent',d,...
               'Style','text',...
               'Position',[0 80 400 100],...
               'String',{'Click and drag the endpoints across the diameter of the left ventricle on both frames.';'';               
               'Click the close button when you are done to save the line distances.';'';
               '------------------------------------------------------------------------------------------------------';
               '<-- Papillary Muscles View EDV                    Papillary Muscles View ESV -->'
               '------------------------------------------------------------------------------------------------------';});
    btn = uicontrol('Parent',d,...
               'Position',[165 30 70 25],...
               'String','Close',...
               'Callback','pdistEDV = getDistance(plineEDV)*pix2cm;, pdistESV = getDistance(plineESV)*pix2cm;,delete(f1gh);,delete(f2gh);,delete(gcf);');


% Output figures side by side
f1gh = figure('Name','Papillary Muscles View EDV'); % name the figure
impEDV = imshow(sprintf('papillary_EDV-%d.png',ans(1)));
plineEDV = imdistline(gca,[320 320],[200 300]); % add dragable line
pos1 = get(gcf,'Position'); % get position of fig 1
set(gcf,'Position', pos1 - [pos1(3)/2,0,0,0]) % shift fig 1

f2gh = figure('Name','Papillary Muscles View ESV'); % name the figure
impESV = imshow(sprintf('papillary_ESV-%d.png',ans(2)));
plineESV = imdistline(gca,[320 320],[200 300]); %add dragable line
pos2 = get(gcf,'Position');  % get position of fig 2
set(gcf,'Position', pos2 + [pos1(3)/2,0,0,0]) % shift fig 2

uiwait(d)
%% Part III: Apex View EDV and ESV
%% STEP 1: Read apex view video to select EDV and ESV frames

% Import video with VideoReader for procesing later
apex = VideoReader('./data/SA_ApexVolunteer.mov');

% Dialogue box for instructions
dlg = ({'In the following window, please determine your desired EDV and ESV frames for the Apex view.';'';
    'You may use the buttons at the top of the window to pan through the video.';
    'The frame numbers are located in the bottom right corner of the window.'; '';
    'Once you have determined your desired EDV and ESV frames, please close the video window and enter the frame numbers in the subsequent prompt.'});
msg = msgbox(dlg,'Welcome to L-Vent: Apex','help','modal');
uiwait(msg) % wait for user to continue
%% Step 2: Display video with implay panning tools

% The video will play slightly slower at 15 fps to aid viewing of EDV and ESV
a_vid = implay('./data/SA_ApexVolunteer.mov',15);
waitfor(a_vid)
%% STEP 3: Ask user for desired EDV and ESV frames

% Create dialog box
prompt = {'Enter EDV frame:'; 'Enter ESV frame:'};
dlgtitle = 'Apex View EDV and ESV Frames';
dims = [1 45];
definput = {'00';'00'};
ans = str2double(inputdlg(prompt,dlgtitle,dims,definput));
%% STEP 4: Present EDV and ESV figures and  dialog to measure diameters

% Read and save frames as selected
vid = read(apex);
frame = apex.NumberOfFrames;
imwrite(vid(:,:,:,ans(1)),strcat('apex_EDV-',num2str(ans(1)),'.png'));
imwrite(vid(:,:,:,ans(2)),strcat('apex_ESV-',num2str(ans(2)),'.png'));

% Conversion factor (evaluated manually)
pix2cm = 10 / 240; % cm / pixels

% Create dialog for instructions and to callback line distance variables
% converted directly to cm.
d = dialog('Position',[565 45 400 200],'Name','Instructions');
    txt = uicontrol('Parent',d,...
               'Style','text',...
               'Position',[0 80 400 100],...
               'String',{'Click and drag the endpoints across the diameter of the left ventricle on both frames.';'';               
               'Click the close button when you are done to save the line distances.';'';
               '------------------------------------------------------------------------------------------------------';
               '<-- Apex View EDV                                             Apex View ESV -->'
               '------------------------------------------------------------------------------------------------------';});
    btn = uicontrol('Parent',d,...
               'Position',[165 30 70 25],...
               'String','Close',...
               'Callback','adistEDV = getDistance(alineEDV)*pix2cm;,adistESV = getDistance(alineESV)*pix2cm;,delete(f1gh);,delete(f2gh);,delete(gcf);');


% Output figures side by side
f1gh = figure('Name','Apex View EDV'); % name the figure
imaEDV = imshow(sprintf('apex_EDV-%d.png',ans(1)));
alineEDV = imdistline(gca,[320 320],[200 300]); % add dragable line
pos1 = get(gcf,'Position'); % get position of fig 1
set(gcf,'Position', pos1 - [pos1(3)/2,0,0,0]) % shift fig 1

f2gh = figure('Name','Apex View ESV'); % name the figure
imaESV = imshow(sprintf('apex_ESV-%d.png',ans(2)));
alineESV = imdistline(gca,[320 320],[200 300]); %add dragable line
pos2 = get(gcf,'Position');  % get position of fig 2
set(gcf,'Position', pos2 + [pos1(3)/2,0,0,0]) % shift fig 2

uiwait(d)
%% Part IV: Four Chamber View EDV and ESV
%% STEP 1: Read Apical 4-Chamber View video to select EDV and ESV frames

% Import video with VideoReader for procesing later
ap4ch = VideoReader('./data/Apical4chVolunteer.mov');

% Dialogue box for instructions
dlg = ({'In the following window, please determine your desired EDV and ESV frames for the Apical 4-Chamber View.';'';
    'You may use the buttons at the top of the window to pan through the video.';
    'The frame numbers are located in the bottom right corner of the window.'; '';
    'Once you have determined your desired EDV and ESV frames, please close the video window and enter the frame numbers in the subsequent prompt.'});
msg = msgbox(dlg,'Welcome to L-Vent: Apical 4-Chamber View','help','modal');
uiwait(msg) % wait for user to continue
%% Step 2: Display video with implay panning tools

% The video will play slightly slower at 15 fps to aid viewing of EDV and ESV
a_vid = implay('./data/Apical4chVolunteer.mov',15);
waitfor(a_vid)
%% STEP 3: Ask user for desired EDV and ESV frames

% Create dialog box
prompt = {'Enter EDV frame:'; 'Enter ESV frame:'};
dlgtitle = 'Four Chamber View EDV and ESV Frames';
dims = [1 45];
definput = {'00';'00'};
ans = str2double(inputdlg(prompt,dlgtitle,dims,definput));
%% STEP 4: Present EDV and ESV figures and  dialog to measure diameters

% Read and save frames as selected
vid = read(ap4ch);
frame = ap4ch.NumberOfFrames;
imwrite(vid(:,:,:,ans(1)),strcat('ap4ch_EDV-',num2str(ans(1)),'.png'));
imwrite(vid(:,:,:,ans(2)),strcat('ap4ch_ESV-',num2str(ans(2)),'.png'));

% Conversion factor (evaluated manually)
pix2cm = 10 / 240; % cm / pixels

% Create dialog for instructions and to callback line distance variables
% converted directly to cm.
d = dialog('Position',[565 45 400 200],'Name','Instructions');
    txt = uicontrol('Parent',d,...
               'Style','text',...
               'Position',[0 80 400 100],...
               'String',{'Click and drag the endpoints across the diameter of the long axis on both frames.';'';               
               'Click the close button when you are done to save the line distances.';'';
               '------------------------------------------------------------------------------------------------------';
               '<-- Four Chamber View EDV                             Four Chamber View ESV -->'
               '------------------------------------------------------------------------------------------------------';});
    btn = uicontrol('Parent',d,...
               'Position',[165 30 70 25],...
               'String','Close',...
               'Callback','ap4chdistEDV = getDistance(ap4chlineEDV)*pix2cm;,ap4chdistESV = getDistance(ap4chlineESV)*pix2cm;,delete(f1gh);,delete(f2gh);,delete(gcf);');


% Output figures side by side
f1gh = figure('Name','Four Chamber View EDV'); % name the figure
imap4chEDV = imshow(sprintf('ap4ch_EDV-%d.png',ans(1)));
ap4chlineEDV = imdistline(gca,[320 320],[200 300]); % add dragable line
pos1 = get(gcf,'Position'); % get position of fig 1
set(gcf,'Position', pos1 - [pos1(3)/2,0,0,0]) % shift fig 1

f2gh = figure('Name','Four Chamber View ESV'); % name the figure
imap4chESV = imshow(sprintf('ap4ch_ESV-%d.png',ans(2)));
ap4chlineESV = imdistline(gca,[320 320],[200 300]); %add dragable line
pos2 = get(gcf,'Position');  % get position of fig 2
set(gcf,'Position', pos2 + [pos1(3)/2,0,0,0]) % shift fig 2

uiwait(d)
%% Part V: Determine areas and assemble modified Simpson's Rule for EDV

edvL = ap4chdistEDV; % Grab long axis measurement from four chamber view
hD = edvL/3; % Calculate h

% Short axes from mitral, papilary, and apex views in EDV
A1D = (mdistEDV^2*pi)/4;
A2D = (pdistEDV^2*pi)/4;
A3D = (adistEDV^2*pi)/4;

corrf = 3; % applying correcting factor of 3

vEDV = corrf * round((A1D+A2D)/hD + ((A3D*hD)/2) + ((pi*hD^3)/6),2);
%% Part VI: Determine areas and assemble modified Simpson's Rule for ESV

esvL = ap4chdistESV; % Grab long axis measurement from four chamber view
hS = esvL/3; % Calculate h

% Short axes from mitral, papilary, and apex views in ESV
A1S = (mdistESV^2*pi)/4;
A2S = (pdistESV^2*pi)/4;
A3S = (adistESV^2*pi)/4;

vESV = corrf * round((A1S+A2S)/hS + ((A3S*hS)/2) + ((pi*hS^3)/6),2);
%% Part VII: Calculating Stroke Volume, Ejection Fraction, and Cardiac Output

HR = 60; % bpm. Recorded during Week 2

SV = vEDV - vESV; % stroke volume
EF = round(SV/vEDV * 100,2); % ejection fraction
CO = round((SV*HR) / 1000,3); % cardiac output

% Print Results
lvent = 'L-VENT LEFT VENTRICULAR CAVITY MEASUREMENT RESULTS:';
edv = ['The measured left ventricular cavity volume at end-diastole is ', num2str(vEDV),' mL.'];
esv = ['The measured left ventricular cavity volume at end-systole is ', num2str(vESV),' mL.'];
sv = ['The calculated stroke volume is ', num2str(SV),' mL.'];
ef = ['The calculated ejection fraction is ', num2str(EF),'%.'];
co = ['The calculated cardiac output is ', num2str(CO),' L/min.'];
disp(lvent)
disp(edv)
disp(esv)
disp(sv)
disp(ef)
disp(co)

%% Part VIII: Clinical Results

%Import data
Dao = 2; % cm

LendoEDV = 8.40; % cm
DendoEDV = 5.40; % cm

LendoESV = 7.14; % cm
DendoESV = 3.61; % cm

VTIp = 19.0; % cm, pulse wave 
VTIc = 23.8; % cm, continuous wave
SV_vti = 60; % mL

% Calculations
VclinEDV = round((pi/6) * DendoEDV^2 * LendoEDV,2);
VclinESV = round((pi/6) * DendoESV^2 * LendoESV,2);

SVclin = VclinEDV - VclinESV; 
EFclin = 100 * round(SVclin / VclinEDV,2);
COclin = round(SVclin * HR,2) / 1000;
CO_VTIc = round(VTIc*HR*((pi*Dao^2)/4),2) / 1000;
CO_VTIp = round(VTIp*HR*((pi*Dao^2)/4),2) / 1000;
CO_VTIavg = round((CO_VTIc + CO_VTIp) /2,2); 

clin = 'CLINICAL MEASUREMENT RESULTS:';
edvCLIN = ['The left ventricular cavity volume at end-diastole is ', num2str(VclinEDV),' mL.'];
esvCLIN = ['The left ventricular cavity volume at end-systole is ', num2str(VclinESV),' mL.'];
svCLIN = ['The stroke volume is ', num2str(SVclin),' mL.'];
efCLIN = ['The ejection fraction is ', num2str(EFclin),'%.'];
coCLIN = ['The cardiac output is ', num2str(COclin),' L/min.'];
coVTIavg = ['The VTI cardiac output averaged between pulse and continuous wave is ', num2str(CO_VTIavg),' L/min.'];
disp(clin)
disp(edvCLIN)
disp(esvCLIN)
disp(svCLIN)
disp(efCLIN)
disp(coCLIN)
disp(coVTIavg)

%% Part IX: Phantom Results

L = 11.0; % long axis
D1 = 10.7; % short axis 1
D2 = 9.67; % short axis 2

V3d = 538.99; % mL % program native calculation
Vm = (4*pi)/3 * L/2 * D1/2 * D2/2; % measured volume
Va =  640; % mL, actual volume

% Percent errors
pererr_vm = round(100*abs(Vm-Va)/Va,2); % measured
pererr_v3d = round(100*abs(V3d-Va)/Va,2); % V3d calculation
per_diff = pererr_v3d - pererr_vm;

phan = 'PHANTOM MEASUREMENT RESULTS:';
vb = ['The measured volume of the balloon is ', num2str(Vm),' mL.'];
va = ['The actual volume of the balloon is ', num2str(Va),' mL.'];
err = ['The percent error of the measured volume is ', num2str(pererr_vm),'%.'];
v3derr = ['The percent error of the V3d volume is  ', num2str(pererr_v3d),'%.'];
diff = ['The manual measurement is ', num2str(per_diff),'% closer to the true volume of the balloon than the V3d estimation.'];
disp(phan)
disp(vb)
disp(va)
disp(err)
disp(v3derr)
disp(diff)

%% Part X: Final Comparison

% Percent Errors Between Measured and Clinical Values
sv_err = round(100*abs(SV-SVclin)/SVclin,2);
ef_err = round(100*abs(EF-EFclin)/EFclin,2);
co_err = round(100*abs(CO-COclin)/COclin,2);

comp = 'MEASURED VALUES COMPARED TO CLINICAL VALUES:';
sverr =  ['The measured stroke volume is within ', num2str(sv_err),'% of the clinical value.'];
eferr = ['The measured ejection fraction is within ', num2str(ef_err),'% of the clinical value.'];
coerr = ['The measured cardiac output is within ', num2str(co_err),'% of the clinical value.'];
disp(comp)
disp(sverr)
disp(eferr)
disp(coerr)