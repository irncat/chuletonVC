% pre: im es la sortida de la funció greixcarn(...)
function percent = percentgreix(im)
    [N, ~] = histcounts(im, 3);
    greix = N(3);
    carn  = N(1);
    percent = double(greix/(carn+greix))*100;
end