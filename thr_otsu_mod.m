% Modificació d'Otsu perque ignori els pixels de fons. Implementació
% extreta de viqupèdia

function thr = thr_otsu_mod(im)
    im = im .* uint8(fons(im));
    [histogramCounts, ~] = histcounts(im, 256);
    histogramCounts(1) = 0;
    
    total = sum(histogramCounts); % total number of pixels in the image 
    %% OTSU automatic thresholding
    top = 256;
    sumB = 0;
    wB = 0;
    maximum = 0.0;
    sum1 = dot(0:top-1, histogramCounts);
    for ii = 1:top
        wF = total - wB;
        if wB > 0 && wF > 0
            mF = (sum1 - sumB) / wF;
            val = wB * wF * ((sumB / wB) - mF) * ((sumB / wB) - mF);
            if ( val >= maximum )
                thr = ii;
                maximum = val;
            end
        end
        wB = wB + histogramCounts(ii);
        sumB = sumB + (ii-1) * histogramCounts(ii);
    end

    thr = double(thr/255);
end