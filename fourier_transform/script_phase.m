im_names = {'books.jpeg','stair.jpeg','tvtrash.jpeg'};
IRect = imread('./results/images/hor_rect.jpg');
for i=1:size(im_names,2)
    disp(im_names{1,i});
    I = imread(strcat('./results/',im_names{1,i}));
    I = rgb2gray(I);
    name = extractBefore(im_names{1,i}, numel(im_names{1,i})-4);
    FT = figure;
    
    %both padding & shifting - Fourier Transform
    ftImage_complex = fftshift(fft2(I,256,256));%applyFT(I,1,1);
    ftImage = abs(ftImage_complex);
    rectFtImage_complex = fftshift(fft2(IRect,256,256));%applyFT(IRect,1,1);
    rectFtImage = abs(rectFtImage_complex);
    rectPhase = angle(rectFtImage);
%     maxVal = max(ftImage(:));
%     minVal = min(ftImage(:));
    %imshow(ftImage,[minVal,maxVal],'InitialMagnification','fit'), title(strcat(name,'-FT - shifting & padding'),'Interpreter', 'none');
    %colormap(hsv), colorbar;
%     cd results;
%     saveas(FT, strcat(name,'-fft-both'), 'jpg');
%     cd ..;

    %Phase Angle
    phaseFtImage = angle(ftImage_complex);
%     maxVal = max(ftImage(:));
%     minVal = min(ftImage(:));
    imagesc(phaseFtImage),title(strcat(name,'-Phase'),'Interpreter', 'none');
    axis off;
    %imshow(phaseFtImage,'InitialMagnification','fit'), title(strcat(name,'-Phase'),'Interpreter', 'none');
    %colormap(hsv), colorbar;
    cd results;
    saveas(FT, strcat(name,'-Phase'), 'jpg');
    cd ..;

%   Reconstruction - Phase
    original = ifft2(angle(ftImage));
    imagesc(original),title(strcat(name,'-reconstruct-phase'),'Interpreter', 'none');
    axis off;
    %imshow(original,'InitialMagnification','fit'), title(strcat(name,'-reconstruct-phase'),'Interpreter', 'none');
    cd results;
    saveas(FT, strcat(name,'-reconstruct-phase'), 'jpg');
    cd ..;
    
 %   Reconstruction - Fourier
    original = ifft2(ftImage);
    imagesc(original),title(strcat(name,'-reconstruct-fourier'),'Interpreter', 'none');
    axis off;
    %imshow(original,'InitialMagnification','fit'), title(strcat(name,'-reconstruct-fourier'),'Interpreter', 'none');
    cd results;
    saveas(FT, strcat(name,'-reconstruct-fourier'), 'jpg');
    cd ..;

 %  Reconstruction - Fourier Rect & Phase Input
    originalPhase = ifft2(angle(ftImage) + rectFtImage);
    imagesc(originalPhase),title(strcat(name,'-reconstruct-phase-input'),'Interpreter', 'none');
    axis off;
    %imshow(originalPhase,'InitialMagnification','fit'), title(strcat(name,'-reconstruct-phase-input'),'Interpreter', 'none');
    cd results;
    saveas(FT, strcat(name,'-reconstruct-phase-input'), 'jpg');
    cd ..;
    
 %  Reconstruction - Phase Rect & Fourier Input
    originalFourier = ifft2(ftImage + rectPhase);
    imagesc(originalFourier),title(strcat(name,'-reconstruct-fourier-input'),'Interpreter', 'none');
    axis off;
    %imshow(originalFourier,'InitialMagnification','fit'), title(strcat(name,'-reconstruct-fourier-input'),'Interpreter', 'none');
    cd results;
    saveas(FT, strcat(name,'-reconstruct-fourier-input'), 'jpg');
    cd ..;
   
end