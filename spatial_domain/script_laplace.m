cd ..;
imPoster = imread('resources/posters.jpeg');
cd spatial_domain;
imGrayPoster = im2double(rgb2gray(imPoster));

alpha = [0.2, 0.3, 0.5];

for i=1:size(alpha,2)
    laplacePic = figure;
    h = fspecial('laplacian',alpha(i));
    result = im2uint8(imfilter(imGrayPoster, h));
    subplot(1,2,1);
    imshow(imGrayPoster), title('grayscale image');
    subplot(1,2,2);
    imshow(result), title('laplacian filter');
    cd results;
    saveas(laplacePic, strcat('laplace_kernel_', num2str(alpha(i))), 'jpg');
    cd ..;
end