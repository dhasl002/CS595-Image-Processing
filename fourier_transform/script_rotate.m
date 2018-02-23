IRect = imread('./results/images/hor_rect.jpg');
FT = figure;

% Rotation 45
rot = [cos(45) sin(45) 0; -sin(45) cos(45) 0; 0 0 1];
tform = affine2d(rot);
rotImage = imwarp(IRect,tform);
imshow(rotImage,'InitialMagnification','fit'),title('rotated-45-rectangle');
saveas(FT, 'rot-45-rect','jpg');
ftImage = fftshift(fft2(rotImage,256,256));
mag = abs(ftImage);
imagesc(mag),title('magnitude-rot-45-rectangle');
axis off;
%imshow(mag,'InitialMagnification','fit'),title('magnitude-shifted-top-rectangle');
saveas(FT, 'mag-rot-45-rect','jpg');
ang = angle(ftImage);
imagesc(ang),title('phase-rot-45-rectangle');
axis off;
saveas(FT, 'phase-rot-45-rect','jpg');

% Rotation 135
rot = [cos(135) sin(135) 0; -sin(135) cos(135) 0; 0 0 1];
tform = affine2d(rot);
rotImage = imwarp(IRect,tform);
imshow(rotImage,'InitialMagnification','fit'),title('rotated-135-rectangle');
saveas(FT, 'rot-135-rect','jpg');
ftImage = fftshift(fft2(rotImage,256,256));
mag = abs(ftImage);
imagesc(mag),title('magnitude-rot-135-rectangle');
axis off;
%imshow(mag,'InitialMagnification','fit'),title('magnitude-shifted-top-rectangle');
saveas(FT, 'mag-rot-135-rect','jpg');
ang = angle(ftImage);
imagesc(ang),title('phase-rot-135-rectangle');
axis off;
saveas(FT, 'phase-rot-135-rect','jpg');