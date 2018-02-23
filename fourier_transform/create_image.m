I = zeros(200,200);
disp(size(I));
cd results;

temp = I;
temp(50:150, 50:150) = 1;
imshow(temp);
imwrite(temp, 'big_square.jpg');

temp = I;
temp(80:120, 30:70) = 1;
temp(80:120, 130:170) = 1;
imshow(temp);
imwrite(temp, 'hori_squares.jpg');

temp = I;
temp(30:70, 80:120) = 1;
temp(130:170, 80:120) = 1;
imshow(temp);
imwrite(temp, 'ver_squares.jpg');

temp = I;
temp(30:70, 40:80) = 1;
temp(120:160, 130:170) = 1;
imshow(temp);
imwrite(temp, 'diag_squares.jpg');

temp = I;
temp(80:120, 30:70) = 1;
temp(80:120, 130:170) = 1;
temp(30:70, 80:120) = 1;
temp(130:170, 80:120) = 1;
imshow(temp);
imwrite(temp, 'four_squares.jpg');

temp = I;
temp(30:170, 90:110) = 1;
imshow(temp);
imwrite(temp, 'ver_rect.jpg');

temp = I;
temp(90:110, 30:170) = 1;
imshow(temp);
imwrite(temp, 'hor_rect.jpg');

temp = I;
temp(50:70, 30:170) = 1;
temp(90:110, 30:170) = 1;
temp(130:150, 30:170) = 1;
imshow(temp);
imwrite(temp, '3_hor_rect.jpg');

cd ..;