I = imread('../resources/ball.jpeg');
imGray = rgb2gray(I);
[row, col] = size(imGray);

comboBox = {'gaussian','poisson','salt & pepper', 'speckle'};
disp(size(comboBox,2));

for i=size(comboBox,2):-1:1
    noise = I;
    for j=1:i
        noise = imnoise(noise,comboBox{1,j});
    end
    fName = strcat('./results/combo_',num2str(i));
    fName = strcat(fName, '.jpg');
    disp(fName);
    imwrite(noise, fName);
end
    