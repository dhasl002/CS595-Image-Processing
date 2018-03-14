function output = applyGF(img, thresh, passType)
    [row col] = size(img);
    gf = zeros(row, col);
    dist = zeros(row, col);
    gdenom = 2*pi*square(thresh);
    ftImage = fftshift(fft2(img));
    
    for i=1:row
        for j=1:col
            dist(i,j) = sqrt( square(i-(floor(row/2))) + ...
            square(j-(floor(col/2))) );
        end
    end
    
    if (passType == "high")
        for i=1:row
            for j=1:col
                gf(i,j) = 1 - ( (exp(- (dist(i,j)^2/(2*(square(thresh))) ))) ...
                / gdenom) ;
            end
        end
    elseif (passType == "low")
        for i=1:row
            for j=1:col
                gf(i,j) = (exp(-( dist(i,j)^2/(2*(square(thresh))) ))) ...
                / gdenom ;
            end
        end
    end
    
    output =  uint8(abs(ifft2(ifftshift(ftImage.*gf))));
end