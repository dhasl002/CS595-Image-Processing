cd ..;
imPoster = imread('resources/posters.jpeg');
cd spatial_domain;
imGrayPoster = im2double(rgb2gray(imPoster));

    prewittPic = figure;
    h = fspecial('prewitt');
    result = im2uint8(imfilter(imGrayPoster, h));
    subplot(1,2,1);
    imshow(imGrayPoster), title('grayscale image');
    subplot(1,2,2);
    imshow(result), title('prewitt filter');
    cd results;
    saveas(prewittPic, 'prewitt_kernel', 'jpg');
    cd ..;