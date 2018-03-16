I = imread('../resources/ball.jpeg');
imGray = rgb2gray(I);
[row, col] = size(imGray);

mean = [0, 0.25, 0.5, 0.75, 1];
variance = [0.01, 0.05, 0.09, 0.13, 0.2];
noise_density = [0.05, 0.10, 0.20, 0.40, 0.80];

for i=1:size(mean,2)
    noise = imnoise(I,'gaussian',mean(1,i),variance(1,i));
    fName = strcat('guass_noise_',num2str(i));
    fName = strcat(fName,'.jpg');
    fName = strcat('./results/',fName);
    disp(fName);
    imwrite(noise, fName);
end

for i=1:size(variance,2)
    noise = imnoise(I,'localvar',variance(1,i)*rand(size(I)));
    fName = strcat('localvar_noise_',num2str(i));
    fName = strcat(fName,'.jpg');
    fName = strcat('./results/',fName);
    disp(fName);
    imwrite(noise, fName);
end

noise = imnoise(I,'poisson');
fName = './results/poisson_noise.jpg';
disp(fName);
imwrite(noise, fName);

for i=1:size(noise_density,2)
    noise = imnoise(I,'salt & pepper',noise_density(1,i));
    fName = strcat('salt_pepper',num2str(i));
    fName = strcat(fName,'.jpg');
    fName = strcat('./results/',fName);
    disp(fName);
    imwrite(noise, fName);
end

for i=1:size(variance,2)
    noise = imnoise(I,'speckle',variance(1,i));
    fName = strcat('speckle',num2str(i));
    fName = strcat(fName,'.jpg');
    fName = strcat('./results/',fName);
    disp(fName);
    imwrite(noise, fName);
end

    