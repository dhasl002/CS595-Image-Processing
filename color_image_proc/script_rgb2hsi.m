I = imread('../resources/ball.jpeg');
hsiImage = applyRGB2HSI(I);
imwrite(hsiImage, './results/custom_hsi_image.jpg');

hsiMat = rgb2hsi(I);
imwrite(hsiMat, './results/custom2_hsi_image.jpg');

hsvMat = rgb2hsv(I);
imwrite(hsvMat, './results/matlab_hsv_image.jpg');