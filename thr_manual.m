% Veient l'histograma hem interpretat que té 3 modes: la primera (~25)
% representa el fons de la imatge, la segona (~125) representa la carn i la
% tercera (~200) representa el greix. Per tant, escollim el threshhold 175
% (aquests resultats probablement variarien segons el chuletón usat).

function thr = thr_manual(~)
    thr = double(175/255);
end