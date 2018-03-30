 I = imread('../resources/ball.jpeg');
[decom1,cA1,cH1,cV1,cD1]  = applyDWT2(I);
[decom2,cA2,cH2,cV2,cD2]  = applyDWT2(cA1);

cd results;
saveas(decom1, '1_level_decom','jpg');
saveas(decom2, '2_level_decom','jpg');
cd ..;

%Reconstruction
image = idwt2(cA1,cH1,cV1,cD1,'db45');
imwrite(image, './results/recons_wavelet.jpg');


