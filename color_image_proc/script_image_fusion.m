I1 = imread('./resources/face1.tif');
I2 = imread('./resources/face2.tif');

disp(size(I1));
disp(size(I2));

I3 = imageFusion(I1,I2);
imwrite(I3, './results/fused_face3.jpg');

%perform fusion with 2 more images
I1 = imread('../resources/ball.jpeg');
I2 = imread('../resources/books.jpeg');
I3 = imageFusion(I1,I2);
imwrite(I3, './results/fused_objects.jpg');
