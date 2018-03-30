I = imread('../resources/books.jpeg');
gScale = rgb2gray(I);
BW2 = edge(gScale,'canny');
imwrite(BW2,'./results/edge_books.jpg');