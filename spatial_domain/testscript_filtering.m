cd ..;
imPoster = imread('resources/posters.jpeg');
cd spatial_domain;
imGrayPoster = im2double(rgb2gray(imPoster));

windows = [3 3; 5 5; 7 7; 49 49; 81 81; 121 121];
[row, col] = size(windows);
disp(size(windows));

filter = ones(size(windows))/(row*col);
for i=1:row
    filteredPic = figure;
    disp(windows(i,:));
    disp('*');
    result = im2uint8(imfilter(imGrayPoster, windows(i,:)));
    subplot(1,2,1);
    imshow(imGrayPoster), title('grayscale image');
    subplot(1,2,2);
    imshow(result), title('filtered image');
    cd results;
    saveas(filteredPic, strcat('filte_kernel_', num2str(windows(i,1))), 'jpg');
    cd ..;
end

%eliminate zero-padding
for i=1:row
    filteredPic = figure;
    disp(windows(i,:));
    disp('*');
    result = im2uint8(imfilter(imGrayPoster, windows(i,:), 'replicate'));
    subplot(1,2,1);
    imshow(imGrayPoster), title('grayscale image');
    subplot(1,2,2);
    imshow(result), title('filtered image');
    cd results;
    saveas(filteredPic, strcat('filter_replicate_kernel_', num2str(windows(i,1))), 'jpg');
    cd ..;
end

% guassian lowpass filter
for i=1:row
    filteredPic = figure;
    disp(windows(i,:));
    disp('*');
    result = im2uint8(applyGaussFilter(imGrayPoster, 1.5, windows(i,1), windows(i,2)));
    subplot(1,2,1);
    imshow(imGrayPoster), title('grayscale image');
    subplot(1,2,2);
    imshow(result), title('guassian');
    cd results;
    saveas(filteredPic, strcat('gaussian_kernel_', num2str(windows(i,1))), 'jpg');
    cd ..;
end

