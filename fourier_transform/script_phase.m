im_names = {'books.jpeg','stair.jpeg','tvtrash.jpeg'};
IRect = imread('./results/images/hor_rect.jpg');
for i=1:size(im_names,2)
    disp(im_names{1,i});
    I = imread(strcat('./results/',im_names{1,i}));
    I = rgb2gray(I);
    name = extractBefore(im_names{1,i}, numel(im_names{1,i})-4);
    FT = figure;
    
    %both padding & shifting - Fourier Transform
    ftIM = fft2(I);
    ftImage_complex = fftshift(fft2(I,256,256));
    ftImage = abs(ftImage_complex);
    rectFtImage_complex = fftshift(fft2(IRect,256,256));
    rectFtImage = abs(rectFtImage_complex);
    rectPhase = angle(rectFtImage);


    %Phase Angle
    phaseFtImage = angle(ftImage_complex);
    imagesc(phaseFtImage),title(strcat(name,'-Phase'),'Interpreter', 'none');
    axis off;

    cd results;
    saveas(FT, strcat(name,'-Phase'), 'jpg');
    cd ..;

%   Reconstruction - Phase
    original = abs(ifft2(phaseFtImage));
    imagesc(original),title(strcat(name,'-reconstruct-phase'),'Interpreter', 'none');
    axis off;
    cd results;
    saveas(FT, strcat(name,'-reconstruct-phase'), 'jpg');
    cd ..;
    
 %   Reconstruction - Fourier
    original = abs(ifft2(ftIM));
    imagesc(original),title(strcat(name,'-reconstruct-fourier'),'Interpreter', 'none');
    axis off;
    cd results;
    saveas(FT, strcat(name,'-reconstruct-fourier'), 'jpg');
    cd ..;

 %  Reconstruction - Fourier Rect & Phase Input
    originalPhase = abs(ifft2(phaseFtImage + fft2(IRect,256,256)));
    imagesc(originalPhase),title(strcat(name,'-reconstruct-phase-input'),'Interpreter', 'none');
    axis off;
    %imshow(originalPhase,'InitialMagnification','fit'), title(strcat(name,'-reconstruct-phase-input'),'Interpreter', 'none');
    cd results;
    saveas(FT, strcat(name,'-reconstruct-phase-input'), 'jpg');
    cd ..;
    
 %  Reconstruction - Phase Rect & Fourier Input
    originalFourier = abs(ifft2(fft2(I(1:size(IRect,1), 1:size(IRect,2)))) + angle(fft2(IRect)));
    imagesc(originalFourier),title(strcat(name,'-reconstruct-fourier-input'),'Interpreter', 'none');
    axis off;
    cd results;
    saveas(FT, strcat(name,'-reconstruct-fourier-input'), 'jpg');
    cd ..;
   
end