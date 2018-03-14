I = imread('../resources/ball.jpeg');
imGray = rgb2gray(I);
[row, col] = size(imGray);
cutOff = [100, 180, 260];

for i=1:size(cutOff,2)
    filteredImage = applyBF(imGray, cutOff(1,i), 2);
    fName = strcat(num2str(cutOff(1,i)), '.jpg');
    fName = strcat('./results/Butterworth-high-pass-',fName);
    imwrite(filteredImage,fName);
end

for i=1:size(cutOff,2)
    filteredImage = imGray-applyBF(imGray, cutOff(1,i), 2);
    fName = strcat(num2str(cutOff(1,i)), '.jpg');
    fName = strcat('./results/Butterworth-low-pass-',fName);
    imwrite(filteredImage,fName);
end