function output = applyIdealFilter(img, cutOff, passType)
    [row, col] = size(img);
    mask_high = ones(row, col);
    mask_low = zeros(row, col);
    ftImage = fftshift(fft2(double(img)));
    result = ones(row, col);
    
    if (passType == "high")
        mask_high = insertShape(mask_high,'FilledCircle',[ceil(row/2), ...
            ceil(col/2), cutOff],'Color', 'black', 'Opacity', 1);
        result = ftImage.*mask_high;
        %output =  uint8(abs(ifft2(ifftshift(ftImage.*mask_high))));
    elseif (passType == "low")
        mask_low = insertShape(mask_low,'FilledCircle',[ceil(row/2), ...
            ceil(col/2), cutOff],'Color', 'white', 'Opacity', 1);
        result = ftImage.*mask_low;
        %output =  uint8(abs(ifft2(ifftshift(ftImage.*mask_low))));
    else
        exit;
    end
    
    realImage =  real(ifft2(ifftshift(result)));
    
    output = (realImage - min(realImage(:)))/(max(realImage(:)) - min(realImage(:)));
    output = uint8(255*output);
    

end