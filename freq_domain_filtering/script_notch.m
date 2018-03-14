I = imread('../resources/books.jpeg');
imGray = rgb2gray(I);
[row, col] = size(imGray);

notchedImage = applyNotch(imGray, 30, 50);
imwrite(notchedImage, './results/notch_filter.jpg');
