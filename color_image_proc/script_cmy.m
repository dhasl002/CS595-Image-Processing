I = imread('../resources/books.jpeg');
image = im2double(I);
redLayer = image(:,:,1);
greenLayer = image(:,:,2);
blueLayer = image(:,:,3);

C = 1 - redLayer;
M = 1 - greenLayer;
Y = 1 - blueLayer;

colorCMY = cat(3,C,M,Y);
imwrite(colorCMY,'./results/custom_cmy.jpg');
