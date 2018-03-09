I = imread('../resources/ball.jpeg');
imGray = rgb2gray(I);
[row, col] = size(imGray);
r1 = [20, 50, 90];
r2 = [50, 80, 120];
%filteredImage = figure;

for i=1:size(r1,2)
    filteredImage = applyBandFilter(imGray, r1(1,i),r2(1,i), "pass");
    fName = strcat(num2str(r1(1,i)),' & ');
    fName = strcat(fName, num2str(r2(1,i)));
    fName = strcat(fName,'.jpg');
    fName = strcat('./results/band-pass-',fName);
    imwrite(filteredImage,fName);
end

for i=1:size(r1,2)
    filteredImage = applyBandFilter(imGray, r1(1,i),r2(1,i), "reject");
    fName = strcat(num2str(r1(1,i)),' & ');
    fName = strcat(fName, num2str(r2(1,i)));
    fName = strcat(fName,'.jpg');
    fName = strcat('./results/band-reject-',fName);
    imwrite(filteredImage,fName);
end
    


% N = 1001;
% R = 400;
% R2 = 300;
% M = zeros(N);
% ii = ceil(N/2);
% M(ii,ii) = 1;
% out = (bwdist(M) <= R && bwdist(M) >= R2);
% imagesc(out)
