function output = removeNoise4(img, cutOffX, cutOffY)
    [row, col] = size(img);
    disp(size(img));
    ftImage = fftshift(fft2(double(img)));
    
    centerX = floor(row/2);
    centerY = floor(col/2);
    
    mask = zeros(row,col);
    mask(centerX-cutOffX: centerX+cutOffX, 1:col) = 1;
    
    out = ftImage.*mask;
    realImage =  real(ifft2(ifftshift(out)));
    
    output = (realImage - min(realImage(:)))/(max(realImage(:)) - min(realImage(:)));
    output = uint8(255*output);
    
end