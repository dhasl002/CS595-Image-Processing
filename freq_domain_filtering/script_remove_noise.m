I1 = imread('./noisy_images/repitiveNoise1.tif');
I2 = imread('./noisy_images/repitiveNoise2.tif');
I3 = imread('./noisy_images/repitiveNoise3.tif');
I4 = imread('./noisy_images/repitiveNoise4.tif');

%%%%%%
% NOISE 1
%%%%%%
ftImage = fftshift(fft2(I1));
imagesc(abs(log(ftImage)));
filteredImage = removeNoise1(I1, 100, 100);
imshow(filteredImage);
imwrite(filteredImage, './results/removed_noise_1.jpg');

%%%%%%
% NOISE 2
%%%%%%
ftImage = fftshift(fft2(I2));
imagesc(abs(log(ftImage)));
filteredImage = removeNoise1(I2, 100, 75);%applyIdealFilter(I2, 200, "low");
imshow(filteredImage);
imwrite(filteredImage, './results/removed_noise_2.jpg');

%%%%%%
% NOISE 3
%%%%%%
% ftImage = fftshift(fft2(I3));
% imagesc(abs(log(ftImage)));
% filteredImage = removeNoise3(I3, 15, 55);
% imshow(filteredImage);
% imwrite(filteredImage, './results/removed_noise_3.jpg');

%%%%%%
% NOISE 4
%%%%%%
% ftImage = fftshift(fft2(I4));
% imagesc(abs(log(ftImage)));
% filteredImage = removeNoise4(I4, 100, 60);
% imshow(filteredImage);
% imwrite(filteredImage, './results/removed_noise_4.jpg');







