%% HOMEWORK 3 
% Les definicions de les funcions es poden trobar al final d'aquest
% document.

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
% Nota: al guardar les imatges desde matlab s'ha canviat el format a .tif.

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
figure, subplot(1,3,1), imshow(fons(im_crop{12})), title('Chuleton 1');
subplot(1,3,2), imshow(fons(im_crop{13})), title('Chuleton 2');
subplot(1,3,3), imshow(fons(im_crop{14})), title('Chuleton 3');


%% Thresh-hold arbitrari
figure, subplot(1,3,1), imshow(greixcarn(im_crop{12},0.6)), title('Chuleton 1');
subplot(1,3,2), imshow(greixcarn(im_crop{13},0.6)), title('Chuleton 2');
subplot(1,3,3), imshow(greixcarn(im_crop{14},0.6)), title('Chuleton 3');


