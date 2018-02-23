
im_names = {'books.jpeg','stair.jpeg','tvtrash.jpeg'};

for i=1:size(im_names,2)
    disp(im_names{1,i});
    I = imread(strcat('./results/',im_names{1,i}));
    I = rgb2gray(I);
    name = extractBefore(im_names{1,i}, numel(im_names{1,i})-4);
    FT = figure;

    ftImage = applyFT(I,0,0);
    disp(size(ftImage));
    maxVal = max(ftImage(:));
    minVal = min(ftImage(:));
    imshow(ftImage,[minVal,maxVal],'InitialMagnification','fit'), title(strcat(name,'-FT'),'Interpreter', 'none');
    %colormap(hsv), colorbar;
    cd results;
    saveas(FT, strcat(name,'-fft'), 'jpg');
    cd ..;

    %fftshift
    ftImage = applyFT(I,0,1);
    maxVal = max(ftImage(:));
    minVal = min(ftImage(:));
    imshow(ftImage,[minVal,maxVal],'InitialMagnification','fit'), title(strcat(name,'-FT - fftshift'),'Interpreter', 'none');
    %colormap(hsv), colorbar;
    cd results;
    saveas(FT, strcat(name,'-fft-shift'), 'jpg');
    cd ..;

    %Padding
    ftImage = applyFT(I,1,0);
    maxVal = max(ftImage(:));
    minVal = min(ftImage(:));
    imshow(ftImage,[minVal,maxVal],'InitialMagnification','fit'), title(strcat(name,'-FT - padding'),'Interpreter', 'none');
    %colormap(hsv), colorbar;
    cd results;
    saveas(FT, strcat(name,'-fft-padding'), 'jpg');
    cd ..;

    %both padding & shifting
    ftImage = applyFT(I,1,1);
    maxVal = max(ftImage(:));
    minVal = min(ftImage(:));
    imshow(ftImage,[minVal,maxVal],'InitialMagnification','fit'), title(strcat(name,'-FT - shifting & padding'),'Interpreter', 'none');
    %colormap(hsv), colorbar;
    cd results;
    saveas(FT, strcat(name,'-fft-both'), 'jpg');
    cd ..;
end
