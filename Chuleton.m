%% HOMEWORK 3 

%% Imatges Originals
close all; clc; clear all

f=dir('*.bmp');
files={f.name};
names = convertCharsToStrings(files);
for k=1:numel(names)
    names(k) = erase(names(k),".bmp");
end
im_or=cell(1,14);
for k=1:numel(files)
  im_or{k}=imread(files{k});
end

figure, subplot(1,3,1), imshow(im_or{12}), title('Chuleton 1');
subplot(1,3,2), imshow(im_or{13}), title('Chuleton 2');
subplot(1,3,3), imshow(im_or{14}), title('Chuleton 3');
sgtitle('Originals');

%% Selecció de regió d'Interés
% Retallem manualment les imatges mitjançant la eina "imcrop".
% Nota: al guardar les imatges desde matlab s'ha canviat el format a .tif,
% i s'ha afegit un "padding" blanc que hem eliminat.

%for k=1:numel(im)
%  figure, imshow(im{k}), title('Chuleton 1');
%  imcrop
%end

f=dir('*.tif');
files={f.name};
im_crop=cell(1,14);
for k=1:numel(files)
  imtemp=imread(files{k});
  im_crop{k}=imtemp(4:end-3,4:end-3,1);
end

figure, subplot(1,3,1), imshow(im_crop{12}), title('Chuleton 1');
subplot(1,3,2), imshow(im_crop{13}), title('Chuleton 2');
subplot(1,3,3), imshow(im_crop{14}), title('Chuleton 3');
sgtitle('Imatges retallades');


%% Detecció de fons
% <include>fons.m</include>

figure, subplot(1,3,1), imshow(fons(im_crop{12})), title('Chuleton 1');
subplot(1,3,2), imshow(fons(im_crop{13})), title('Chuleton 2');
subplot(1,3,3), imshow(fons(im_crop{14})), title('Chuleton 3');
sgtitle('Fons');


%% Funció de thresh-holding
% <include>greixcarn.m</include>

greixcarn1 = greixcarn(im_crop{12},0.6,fons(im_crop{12}));
figure, subplot(1,3,1), imshow(greixcarn1), title('Chuleton 1');
greixcarn2 = greixcarn(im_crop{13},0.6,fons(im_crop{13}));
subplot(1,3,2), imshow(greixcarn2), title('Chuleton 2');
greixcarn3 = greixcarn(im_crop{14},0.6,fons(im_crop{14}));
subplot(1,3,3), imshow(greixcarn3), title('Chuleton 3');
sgtitle('Tresholding');

%% Càlcul de Percentatge de Greix
% <include>percentgreix.m</include>

display(percentgreix(greixcarn1));
display(percentgreix(greixcarn2));
display(percentgreix(greixcarn3));

%% Càlcul de percentatge de greix amb diferents mètodes
% <include>resultats.m</include>

%% MÈTODE 1 - Selecció manual amb histograma
% Veient l'histograma hem interpretat que té 3 modes: la primera (~25)
% representa el fons de la imatge, la segona (~125) representa la carn i la
% tercera (~200) representa el greix. Per tant, escollim el threshhold 175
% (aquests resultats probablement variarien segons el chuletón usat).

close all;

figure, histogram(im_crop{12}), title('Histograma Chuletón 12');

thr_manual = @(~) double(175/255);
SEL_MAN = resultats(im_crop,thr_manual,names);

%% MÈTODE 2 - Selecció automàtica amb Otsu
close all;

otsu = @graythresh;
SEL_OTSU = resultats(im_crop,otsu,names);

%% MÈTODE 3 - Selecció automàtica amb Pun
% <include>pun.m</include>
close all;

pun = @pun;
SEL_PUN = resultats(im_crop,pun,names);

%% MÈTODE 4 - Selecció automàtica amb Riddler i Calvard
% <include>ridncalv.m</include>
close all;

ridncalv = @ridncalv;
SEL_RNC = resultats(im_crop,ridncalv,names);


%% Taules comparativa de percentatge de greix

names = transpose(names);
SEL_MAN = transpose(SEL_MAN);
SEL_OTSU = transpose(SEL_OTSU);
SEL_PUN = transpose(SEL_PUN);
SEL_RNC = transpose(SEL_RNC);
T = table(names, SEL_MAN(:,1), SEL_OTSU(:,1), ...
  SEL_PUN(:,1), SEL_RNC(:,1),'VariableNames', ...
  {'Imatge', 'Manual', 'Otsu', 'Pun', 'Riddle&Calvard'});
disp(T)

%% Taula comparativa de tresholds
T2 = table(names, SEL_MAN(:,2), SEL_OTSU(:,2), ...
  SEL_PUN(:,2), SEL_RNC(:,2),'VariableNames', ...
  {'Imatge', 'Manual', 'Otsu', 'Pun', 'Riddle&Calvard'});
disp(T2)