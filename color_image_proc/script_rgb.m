I = imread('../resources/ball.jpeg');
redLayer = I(:,:,1);
greenLayer = I(:,:,2);
blueLayer = I(:,:,3);
zeroMat = zeros(size(I,1), size(I,2));

red = cat(3, redLayer, zeroMat, zeroMat);
green = cat(3, zeroMat, greenLayer, zeroMat);
blue = cat(3, zeroMat, zeroMat, blueLayer);

imwrite(red,'./results/ball_red.jpg');
imwrite(green,'./results/ball_green.jpg');
imwrite(blue,'./results/ball_blue.jpg');