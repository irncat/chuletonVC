% Implementació amb funcions de grau superior (HOF)
function resultats = resultats(imatges,f,names)
    resultats = zeros(2,numel(imatges));
    for k=1:numel(imatges)
        im = imatges{k};
        % Separem la chuleta del fons
        im_bg = fons(im);
        chuleta = im(im_bg);
        % Binaritzem només la chuleta
        thr = f(chuleta);
        res = greixcarn(im,thr,im_bg);
        resultats(1,k) = percentgreix(res);
        resultats(2,k) = thr;
        figure, imshow(res), 
        title(strcat(names(k), " - " , num2str(resultats(1,k)), "% greix"));
    end
end