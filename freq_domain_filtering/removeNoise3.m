function output = removeNoise3(img, cutOffX, cutOffY)
    [row, col] = size(img);
    disp(size(img));
    ftImage = fftshift(fft2(double(img)));
    
    centerX = floor(row/2);
    centerY = floor(col/2);
    
     mask = ones(row,col);
     mask(1:centerX-cutOffY, centerY-cutOffX: centerY+cutOffX) = 0;
     mask(centerX+cutOffY:row, centerY-cutOffX: centerY+cutOffX) = 0;
%      mask(centerX-cutOffX: centerX+cutOffX, 1:col) = 1;
%      mask = insertShape(mask,'FilledCircle',[centerX, ...
%              centerY, radius],'Color', 'white', 'Opacity', 1);
    
%     mask = ones(row,col);
% 
%     mask(centerX-cutOffX: centerX+cutOffX, 1:centerY-cutOffY) = 0;
%     mask(centerX-cutOffX: centerX+cutOffX, centerY+cutOffY: col) = 0;
    
    out = ftImage.*mask;
    realImage =  real(ifft2(ifftshift(out)));
    
    output = (realImage - min(realImage(:)))/(max(realImage(:)) - min(realImage(:)));
    output = uint8(255*output);
end