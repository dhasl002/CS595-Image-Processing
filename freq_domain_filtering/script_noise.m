I = imread('../resources/ball.jpeg');
imGray = rgb2gray(I);
[row, col] = size(imGray);

noiseImage = imnoise(imGray,'salt & pepper');
imwrite(noiseImage, './results/noise_salt_pepper.jpg');
filteredImage = medfilt2(noiseImage);
imwrite(filteredImage, './results/cleaned_salt_pepper.jpg');

noiseImage = imnoise(imGray,'speckle');
imwrite(noiseImage, './results/noise_speckle.jpg');

noiseImage = ordfilt2(noiseImage,1,ones(3,3));
noiseImage = applyBF(noiseImage, 2, 2);
filteredImage = noiseImage;
imwrite(filteredImage, './results/cleaned_speckle.jpg');

% fftim = fftshift(fft2(filteredImage));
% imagesc(log(1+abs(fftim)));
