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

cform = makecform('srgb2cmyk');
cmykI = applycform(I,cform);
disp(size(cmykI));
cLayer = cmykI(:,:,1);
mLayer = cmykI(:,:,2);
yLayer = cmykI(:,:,3);
cmyReduced = cat(3,cLayer,mLayer,yLayer);
%imshow(cmykI);
imwrite(cmyReduced,'./results/cform_cmy.jpg');