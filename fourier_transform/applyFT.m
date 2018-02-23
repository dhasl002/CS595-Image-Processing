function output = applyFT(image, isPad, isShift)
    if (isPad == 0 && isShift == 0)
        F = fft2(image);
        F2 = log(abs(F));
        %imshow(F2);%,[-1 5],'InitialMagnification','fit');
        %colormap(color); colorbar
        output = F2;
    elseif (isPad == 0 && isShift > 0)
        F = fftshift(fft2(image));
        F2 = log(abs(F));
        output = F2;   
    elseif (isPad > 0 && isShift == 0)
        F = fft2(image,256,256);
        F2 = log(abs(F));
        output = F2;
    else
        F = fftshift(fft2(image,256,256));
        F2 = log(abs(F));
        output = F2;
    end
    
end