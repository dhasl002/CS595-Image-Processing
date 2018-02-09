cd ..;
imPoster = imread('resources/posters.jpeg');
cd spatial_domain;
imGrayPoster = im2double(rgb2gray(imPoster));

kernel = {[0 1 0; 1 0 1; 0 1 0]/4, [1 1 1; 1 1 1; 1 1 1]/3, [1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1]/4, ...
          [10 10 10 10; 10 10 10 10; 10 10 10 10; 10 10 10 10]/4, [10 10 10 10; 10 10 10 10; 10 10 10 10; 10 10 10 10]/20, ...
          [1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1]} ; 

for i=1:size(kernel,2)
    customFilterPic = figure;
    result = im2uint8(customFilter(imGrayPoster,kernel{1, i}));
    subplot(1,2,1);
    imshow(imGrayPoster), title('grayscale image');
    subplot(1,2,2);
    imshow(result), title('custom filter');
    cd results;
    saveas(customFilterPic, strcat('custom_filter_trial_', num2str(i)), 'jpg');
    cd ..;
end