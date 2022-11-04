%% HOMEWORK 3 

%% Imatges Originals

f=dir('*.bmp');
files={f.name};
im_or=cell(1,14);
for k=1:numel(files)
  im_or{k}=imread(files{k});
end

figure, subplot(1,3,1), imshow(im_or{12}), title('Chuleton 1');
subplot(1,3,2), imshow(im_or{13}), title('Chuleton 2');
subplot(1,3,3), imshow(im_or{14}), title('Chuleton 3');

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

%% Detecció de fons
% <include>fons.m</include>

figure, subplot(1,3,1), imshow(fons(im_crop{12})), title('Chuleton 1');
subplot(1,3,2), imshow(fons(im_crop{13})), title('Chuleton 2');
subplot(1,3,3), imshow(fons(im_crop{14})), title('Chuleton 3');


%% Funció de thresh-holding
% <include>greixcarn.m</include>

greixcarn1 = greixcarn(im_crop{12},0.6);
figure, subplot(1,3,1), imshow(greixcarn1), title('Chuleton 1');
greixcarn2 = greixcarn(im_crop{13},0.6);
subplot(1,3,2), imshow(greixcarn2), title('Chuleton 2');
greixcarn3 = greixcarn(im_crop{14},0.6);
subplot(1,3,3), imshow(greixcarn3), title('Chuleton 3');

%% Càlcul de Percentatge de Greix
% <include>percentgreix.m</include>

display(percentgreix(greixcarn1));
display(percentgreix(greixcarn2));
display(percentgreix(greixcarn3));

%% Càlcul de percentatge de greix amb diferents mètodes
% <include>resultats.m</include>

%% MÈTODE 1 - Selecció manual amb histograma
% <include>thr_manual.m</include>

figure, histogram(im_crop{12}), title('Histograma Chuletón 12');

thr_manual = @thr_manual;
SEL_MAN = resultats(im_crop,thr_manual);

%% MÈTODE 2 - Selecció automàtica amb Otsu
