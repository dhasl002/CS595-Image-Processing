function output = applyIdealFilter(img, cutOff, passType)
    [row, col] = size(img);
    mask_high = ones(row, col);
    mask_low = zeros(row, col);
    ftImage = fftshift(fft2(img));
    
    if (passType == "high")
        mask_high = insertShape(mask_high,'FilledCircle',[ceil(row/2), ...
            ceil(col/2), cutOff],'Color', 'black', 'Opacity', 1);
        output =  uint8(abs(ifft2(ifftshift(ftImage.*mask_high))));
    elseif (passType == "low")
        mask_low = insertShape(mask_low,'FilledCircle',[ceil(row/2), ...
            ceil(col/2), cutOff],'Color', 'white', 'Opacity', 1);
        output =  uint8(abs(ifft2(ifftshift(ftImage.*mask_low))));
    else
        exit;
    end
%     if (passType == "high")
%         mask(abs(ftImage(:,:)) < cutOff) = 0;
%         mask(row/2, col/2) = 0;
% 
%     elseif (passType == "low")
%         mask(abs(ftImage(:,:)) > cutOff) = 0;
%         mask(row/2, col/2) = 1;
%     end
%     output =  uint8(abs(ifft2(ifftshift(ftImage.*mask))));
end