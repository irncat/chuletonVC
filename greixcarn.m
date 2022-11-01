%% Funció separació greix-carn
% Hem decidit pintar el greix en blanc, la carn de negre i el fons de gris.

function im_res = greixcarn(im,thr)
    im_bg = fons(im);
    im_res_l = im2bw(im,thr);
    im_res_l = im_res_l & im_bg;
    im_res = uint8(im_res_l)*255 + uint8(~im_bg)*128;
end