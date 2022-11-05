% Com hem vist abans en la detecció de fons, Otsu automàtic sense cap
% refinament sembla donar un gran pes al fons. Per tant, els resultats
% no seran gaire bons.

function thr = thr_otsu_auto(im)
    thr = graythresh(im);
end