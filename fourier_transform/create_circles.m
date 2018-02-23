I = zeros(200,200);
disp(size(I));
cd results;

FT = figure;
temp = I;
temp = insertShape(temp,'FilledCircle',[100 100 50],'Color', 'white', 'Opacity', 1);
subplot(4,4,1);
imshow(temp);
imwrite(temp, 'big_circle.jpg');


temp = I;
temp = insertShape(temp,'FilledCircle',[60 100 20],'Color', 'white', 'Opacity', 1);
temp = insertShape(temp,'FilledCircle',[140 100 20],'Color', 'white', 'Opacity', 1);
subplot(4,4,2);
imshow(temp);
imwrite(temp, 'hor_circles.jpg');


temp = I;
temp = insertShape(temp,'FilledCircle',[100 60 20],'Color', 'white', 'Opacity', 1);
temp = insertShape(temp,'FilledCircle',[100 140 20],'Color', 'white', 'Opacity', 1);
subplot(4,4,3);
imshow(temp);
imwrite(temp, 'ver_circles.jpg');

temp = I;
temp = insertShape(temp,'FilledCircle',[60 60 20],'Color', 'white', 'Opacity', 1);
temp = insertShape(temp,'FilledCircle',[140 140 20],'Color', 'white', 'Opacity', 1);
subplot(4,4,4);
imshow(temp);
imwrite(temp, 'diag_circles.jpg');

temp = I;
temp = insertShape(temp,'FilledCircle',[60 100 20],'Color', 'white', 'Opacity', 1);
temp = insertShape(temp,'FilledCircle',[140 100 20],'Color', 'white', 'Opacity', 1);
temp = insertShape(temp,'FilledCircle',[100 60 20],'Color', 'white', 'Opacity', 1);
temp = insertShape(temp,'FilledCircle',[100 140 20],'Color', 'white', 'Opacity', 1);
subplot(4,4,5);
imshow(temp);
imwrite(temp, 'four_circles.jpg');

% Create a logical image of an ellipse with specified
% semi-major and semi-minor axes, center, and image size.
% First create the image.
imageSizeX = 200;
imageSizeY = 200;
[columnsInImage, rowsInImage] = meshgrid(1:imageSizeX, 1:imageSizeY);
% Next create the ellipse in the image.
centerX = 100;
centerY = 100;
radiusX = 20;
radiusY = 80;
ver_ellipse = (rowsInImage - centerY).^2 ./ radiusY^2 ...
    + (columnsInImage - centerX).^2 ./ radiusX^2 <= 1;
% ellipsePixels is a 2D "logical" array.
% Now, display it.
subplot(4,4,6);
imshow(ver_ellipse) ;
colormap([0 0 0; 1 1 1]);
imwrite(ver_ellipse, 'ver_ellipse.jpg');

% horizontal ellipse.
radiusX = 80;
radiusY = 20;
hor_ellipse = (rowsInImage - centerY).^2 ./ radiusY^2 ...
    + (columnsInImage - centerX).^2 ./ radiusX^2 <= 1;
% ellipsePixels is a 2D "logical" array.
% Now, display it.
subplot(4,4,7);
imshow(hor_ellipse) ;
colormap([0 0 0; 1 1 1]);
imwrite(hor_ellipse, 'hor_ellipse.jpg');
saveas(FT, 'FT-images','jpg');

% three horizontal ellipse.
% centerX1 = 100;
% centerY1 = 100;
% centerX2 = 100;
% centerY2 = 50;
% centerX3 = 100;
% centerY3 = 150;
% 
% radiusX = 80;
% radiusY = 20;
% three_hor_ellipse = (rowsInImage - centerY1).^2 ./ radiusY^2 + ...
%     (columnsInImage - centerX1).^2 ./ radiusX^2 + ...
%     (rowsInImage - centerY2).^2 ./ radiusY^2 ...
%     + (columnsInImage - centerX2).^2 ./ radiusX^2 ...
%     + (rowsInImage - centerY3).^2 ./ radiusY^2 ...
%     + (columnsInImage - centerX3).^2 ./ radiusX^2 <= 3;
% image(three_hor_ellipse) ;
% %colormap([0 0 0; 1 1 1]);
% imwrite(three_hor_ellipse, 'three_hor_ellipse.jpg');


cd ..;