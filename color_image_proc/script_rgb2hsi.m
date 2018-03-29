I = imread('../resources/ball.jpeg');
hsiImage = applyRGB2HSI(I);
imwrite(hsiImage, './results/custom_hsi_image.jpg');

hsiMat = rgb2hsv(I);
imwrite(hsiMat, './results/matlab_hsi_image.jpg');