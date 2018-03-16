I = imread('./corrupt_images/ODUcorrupted.jpg');
I = rgb2gray(I);
wnr = applyDeblur(I, 9, 0, 0);
imwrite(wnr, './results/wiener_no_noise.jpg');

n = sum(I(:));
wnr = applyDeblur(I, 9, n, 10);
imwrite(wnr, './results/wiener_noise.jpg');

PSF = fspecial('motion', 9, 0);
NP = abs(fftn(I)).^2;% noise power
NPOW = sum(NP(:))/numel(I);
NCORR = fftshift(real(ifftn(NP)));% noise autocorrelation 

% IP = abs(fftn(I)).^2;% original image power
% IPOW = sum(IP(:))/numel(I);
% ICORR = fftshift(real(ifftn(IP)));% image autocorrelation
% ICORR1 = ICORR(:,ceil(size(I,1)/2));
% wnrAuto = deconvwnr(double(I),PSF,NCORR,ICORR1);
% imshow(wnrAuto);


