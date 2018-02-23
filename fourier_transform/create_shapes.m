I = zeros(200,200);
disp(size(I));
cd results;

FT = figure;
temp = I;
temp = insertShape(temp,'FilledCircle',[100 100 50],'Color', 'white', 'Opacity', 1);
subplot(4,4,1);
imshow(temp);

temp = I;
temp = insertShape(temp,'FilledCircle',[60 100 20],'Color', 'white', 'Opacity', 1);
temp = insertShape(temp,'FilledCircle',[140 100 20],'Color', 'white', 'Opacity', 1);
subplot(4,4,2);
imshow(temp);

temp = I;
temp = insertShape(temp,'FilledCircle',[100 60 20],'Color', 'white', 'Opacity', 1);
temp = insertShape(temp,'FilledCircle',[100 140 20],'Color', 'white', 'Opacity', 1);
subplot(4,4,3);
imshow(temp);


temp = I;
temp = insertShape(temp,'FilledCircle',[60 60 20],'Color', 'white', 'Opacity', 1);
temp = insertShape(temp,'FilledCircle',[140 140 20],'Color', 'white', 'Opacity', 1);
subplot(4,4,4);
imshow(temp);


temp = I;
temp = insertShape(temp,'FilledCircle',[60 100 20],'Color', 'white', 'Opacity', 1);
temp = insertShape(temp,'FilledCircle',[140 100 20],'Color', 'white', 'Opacity', 1);
temp = insertShape(temp,'FilledCircle',[100 60 20],'Color', 'white', 'Opacity', 1);
temp = insertShape(temp,'FilledCircle',[100 140 20],'Color', 'white', 'Opacity', 1);
subplot(4,4,5);
imshow(temp);


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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% squares and rectangles
temp = I;
temp(50:150, 50:150) = 1;
subplot(4,4,8);
imshow(temp);


temp = I;
temp(80:120, 30:70) = 1;
temp(80:120, 130:170) = 1;
subplot(4,4,9);
imshow(temp);


temp = I;
temp(30:70, 80:120) = 1;
temp(130:170, 80:120) = 1;
subplot(4,4,10);
imshow(temp);

temp = I;
temp(30:70, 40:80) = 1;
temp(120:160, 130:170) = 1;
subplot(4,4,11);
imshow(temp);

temp = I;
temp(80:120, 30:70) = 1;
temp(80:120, 130:170) = 1;
temp(30:70, 80:120) = 1;
temp(130:170, 80:120) = 1;
subplot(4,4,12);
imshow(temp);

temp = I;
temp(30:170, 90:110) = 1;
subplot(4,4,13);
imshow(temp);

temp = I;
temp(90:110, 30:170) = 1;
subplot(4,4,14);
imshow(temp);

temp = I;
temp(50:70, 30:170) = 1;
temp(90:110, 30:170) = 1;
temp(130:150, 30:170) = 1;
subplot(4,4,15);
imshow(temp);

saveas(FT,'FT-images','jpg');
cd ..;