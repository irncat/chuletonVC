% Per detectar el fons, hem fet servir el mètode d'Otsu per trobar els
% llindars, ja que degut a les iluminacions variants fer servir un llindar
% estàtic en totes les imatges donava resultats subòtpims. Posteriorment a
% la binarització d'Otsu hem omplert els forats que resultaven en algunes
% imatges.

function im_bg = fons(im)
    % Trobem el llindar del fons amb el mètode d'Otsu
    im_bg = imbinarize(im, graythresh(im));
    % Omplim forats (tambe es pot implementar amb reconstrucció)
    im_bg = imfill(im_bg,"holes");
end