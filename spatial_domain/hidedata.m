
im_color_ball = imread('../resources/ball.jpeg');
im_color_book = imread('../resources/books.jpeg');

bsball = cell(1,8);
bsbook = cell(1,8);

hideinfo = figure;
subplot(1,3,1);
imshow(im_color_ball), title('rgb ball');
subplot(1,3,2);
imshow(im_color_book), title('rgb book');

for i=1:8
    bsball{i} = double(bitget(im_color_ball,i));
    bsbook{i} = double(bitget(im_color_book,i));
end

cat_plane = cat(9,bsball{1},bsball{2},bsball{3},bsball{4},bsball{5},bsball{6},bsbook{7},bsbook{8});

cat_plane = uint8(cat_plane);
pack = cell(1,8);
for i=1:8
    pack{i} = cat_plane(:,:,i)*(2^(i-1));
end
packed_image = zeros(1024,1024);
packed_image = uint8(packed_image);
for i=1:8
    packed_image = packed_image+pack{i};
end
subplot(1,3,3);
packedImg = packed_image;%double(packed_image);
packedImg =  ind2rgb(packedImg, colormap); %cat(4, packedImg, packedImg, packedImg);
imshow(packedImg), title('hidden info');
cd results;
imwrite(packedImg, 'hidden_image.jpg'); %(packedImg, 'hidden_image','jpg');
saveas(hideinfo,'hideinfo','jpg');
cd ..;
