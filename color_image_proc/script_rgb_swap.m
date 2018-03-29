I = imread('../resources/ball.jpeg');
color = applyBGR(I);
imwrite(color,'./results/ball_BGR.jpg');

I = imread('../resources/USAflag.tif');
%imshow(I);
color = applyBGR(I);
imwrite(color,'./results/USAflag_BGR.jpg');

color = applyRBG(I);
imwrite(color,'./results/USAflag_RBG.jpg');

color = applyGRB(I);
imwrite(color,'./results/USAflag_GRB.jpg');
