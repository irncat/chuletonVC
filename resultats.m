% Implementació amb funcions de grau superior (HOF)
function resultats = resultats(imatges,f)
    resultats = zeros(2,numel(imatges));
    for k=1:numel(imatges)
        im = imatges{k};
        thr = f(im);
        res = greixcarn(im,thr);
        resultats(1,k) = percentgreix(res);
        resultats(2,k) = thr;
        figure, imshow(res), 
        title(['Chuleton ' num2str(k) ' - ' num2str(resultats(1,k)) '% greix']);
    end
end