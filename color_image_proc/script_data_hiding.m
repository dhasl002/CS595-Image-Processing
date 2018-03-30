I1 = imread('../resources/ball.jpeg');
I2 = imread('./resources/ember.jpg');

[decomp1,cA1,cH1,cV1,cD1]  = applyDWT2(I1);
[decomp2,cA2,cH2,cV2,cD2]  = applyDWT2(I2);

%Reconstruction
image = uint8(idwt2(cA1,cH2,cV2,cD2,'db45'));
imwrite(image, './results/hiding_ember.jpg');