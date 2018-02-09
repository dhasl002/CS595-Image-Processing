cd ..;
imPoster = imread('resources/posters.jpeg');
cd spatial_domain;
imGrayPoster = im2double(rgb2gray(imPoster));

   sobelPic = figure;
    h = fspecial('sobel');
    result = im2uint8(imfilter(imGrayPoster, h));
    subplot(1,2,1);
    imshow(imGrayPoster), title('grayscale image');
    subplot(1,2,2);
    imshow(result), title('sobel horizontal');
    cd results;
    saveas(sobelPic, 'sobel_horizontal', 'jpg');
    cd ..;
    
    sobelPic = figure;
    hT = h';
    result = im2uint8(imfilter(imGrayPoster, hT));
    subplot(1,2,1);
    imshow(imGrayPoster), title('grayscale image');
    subplot(1,2,2);
    imshow(result), title('sobel vertical');
    cd results;
    saveas(sobelPic, 'sobel_vertical', 'jpg');
    cd ..;