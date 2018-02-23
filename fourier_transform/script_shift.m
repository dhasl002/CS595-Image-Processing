IRect = imread('./results/images/hor_rect.jpg');
FT = figure;

%top-rect
transImage = imtranslate(IRect,[1, -50],'FillValues',0);
imshow(transImage,'InitialMagnification','fit'),title('shifted-top-rectangle');
saveas(FT, 'shift-top-rect','jpg');
ftImage = fftshift(fft2(transImage,256,256));
mag = abs(ftImage);
imagesc(mag),title('magnitude-shifted-top-rectangle');
axis off;
%imshow(mag,'InitialMagnification','fit'),title('magnitude-shifted-top-rectangle');
saveas(FT, 'mag-shift-top-rect','jpg');
ang = angle(ftImage);
imagesc(ang),title('phase-shifted-top-rectangle');
axis off;
saveas(FT, 'phase-shift-top-rect','jpg');

%bottom-rect
transImage = imtranslate(IRect,[1, 50],'FillValues',0);
imshow(transImage,'InitialMagnification','fit'),title('shifted-bottom-rectangle');
saveas(FT, 'shift-bottom-rect','jpg');
ftImage = fftshift(fft2(transImage,256,256));
mag = abs(ftImage);
imshow(mag,'InitialMagnification','fit'),title('magnitude-shifted-bottom-rectangle');
saveas(FT, 'mag-shift-bottom-rect','jpg');
ang = angle(ftImage);
imagesc(ang),title('phase-shifted-bottom-rectangle');
axis off;
saveas(FT, 'phase-shift-bottom-rect','jpg');





