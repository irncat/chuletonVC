% Hem decidit pintar el greix en blanc, la carn en negre i el fons en gris
% per facilitar la visualització dels resultats.

function im_res = greixcarn(im,thr,im_bg)
    im_res_l = imbinarize(im,thr);
    im_res_l = im_res_l & im_bg;
    im_res = uint8(im_res_l)*255 + uint8(~im_bg)*128;
end