I = imread('../resources/ball.jpeg');
imGray = rgb2gray(I);
[rows, cols] = size(imGray);
angle = [0, 0, 0, 90, 90, 90];
cycles = [10, 100, 500, 10, 100, 500];

for i=1:size(cycles,2)
    s = getSineNoise(rows, cols, cycles(1,i), angle(1,i));
    %imshow(s,[]);
    fName = strcat('./results/noise_pattern_',num2str(i));
    fName = strcat(fName, '.jpg');
    imwrite(s, fName);
    [f,result] = addRepetitiveNoise(imGray, s);
    %imshow(abs(log(f)),[]);
    %imshow(result,[]);
    fName = strcat('./results/noise_im_',num2str(i));
    fName = strcat(fName, '.jpg');
    imwrite(result, fName);
end