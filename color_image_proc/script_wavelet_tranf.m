 I = imread('../resources/ball.jpeg');
[decom1,cA,cH,cV,cD]  = applyDWT2(I);
cd results;
saveas(decom1, '1_level_decom','jpg');
cd ..;

%Reconstruction
image = idwt2(cA,cH,cV,cD,'db45');
imwrite(image, './results/recons_wavelet.jpg');


