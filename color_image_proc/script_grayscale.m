image = imread('../resources/ball.jpeg');
avg = computeLayersAvg(image);
imwrite(avg,'./results/ball_avg_layers.jpg');
grayConvt = rgb2gray(image);
imwrite(grayConvt, './results/ball_grayscale_func.jpg');

image = imread('../resources/books.jpeg');
avg = computeLayersAvg(image);
imwrite(avg,'./results/books_avg_layers.jpg');
grayConvt = rgb2gray(image);
imwrite(grayConvt, './results/books_grayscale_func.jpg');

image = imread('../resources/stair.jpeg');
avg = computeLayersAvg(image);
imwrite(avg,'./results/stair_avg_layers.jpg');
grayConvt = rgb2gray(image);
imwrite(grayConvt, './results/stair_grayscale_func.jpg');