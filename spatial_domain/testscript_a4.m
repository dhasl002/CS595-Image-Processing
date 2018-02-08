cd ..;
imPoster = imread('resources/posters.jpeg');
cd spatial_domain;
imGrayPoster = rgb2gray(imPoster);

windows = [3 3; 5 5; 7 7; 9 9];
[row, col] = size(windows);
disp(size(windows));

%determine light regions
for i=1:row
        lightAreasPic = figure;
        disp(windows(i,:));
        disp('*');
        result = extractLightAreas(imGrayPoster, windows(i,:));
        subplot(1,2,1);
        imshow(imGrayPoster), title('grayscale image');
        subplot(1,2,2);
        imshow(result), title('light regions');
        cd results;
        saveas(lightAreasPic, strcat('light_region_', num2str(windows(i,1))), 'jpg');
        cd ..;
end

%determine contrast regions
for i=1:row
        contrastAreasPic = figure;
        disp(windows(i,:));
        disp('*');
        result = extractContrastAreas(imGrayPoster, windows(i,:));
        subplot(1,2,1);
        imshow(imGrayPoster), title('grayscale image');
        subplot(1,2,2);
        imshow(result), title('contrast regions');
        cd results;
        saveas(contrastAreasPic, strcat('contrast_region_', num2str(windows(i,1))), 'jpg');
        cd ..;
end

