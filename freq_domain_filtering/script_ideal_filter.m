I = imread('../resources/ball.jpeg');
imGray = rgb2gray(I);
[row, col] = size(imGray);
cutOff = [floor(row/10), floor(row/30), floor(row/60)];

for i=1:size(cutOff,2)
    filteredImage = applyIdealFilter(imGray, cutOff(1,i), "high");
    fName = strcat(num2str(cutOff(1,i)), '.jpg');
    fName = strcat('./results/high-pass-',fName);
    imwrite(filteredImage,fName);
end

for i=1:size(cutOff,2)
    filteredImage = applyIdealFilter(imGray, cutOff(1,i), "low");
    fName = strcat(num2str(cutOff(1,i)), '.jpg');
    fName = strcat('./results/low-pass-',fName);
    imwrite(filteredImage,fName);
end
     
