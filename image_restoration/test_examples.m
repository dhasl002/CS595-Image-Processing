fs = 0.08;   %FOR RED CHANNEL
W = 256;
H = 128; 

img1 = zeros(128, 256);
for m = 0 : H-1 
    for n = 0 : W-1
        img1(m + 1, n + 1) = sin(2*pi*fs*m);
    end
end

fs = 0.16;    %FOR Green CHANNEL

img2 = zeros(128, 256);
for m = 0 : H-1 
    for n = 0 : W-1
        img2(m + 1, n + 1) = sin(2*pi*fs*m);
    end
end

fs = 0.01;    %FOR Blue CHANNEL

img3 = zeros(128, 256);
for m = 0 : H-1 
    for n = 0 : W-1
        img3(m + 1, n + 1) = sin(2*pi*fs*m);
    end
end

Color=zeros(128,256,3);
Color(:,:,1)=img1;
Color(:,:,2)=img2;
Color(:,:,3)=img3;
imshow(Color,[]);

%     img = zeros(rows, cols);  %demo image
%     numperiods = 8;
%     amplitude = 50; %pixels
%     offset = 100;
%     x = 1:0.25:size(img, 2);  %pixel subsampling for better resolution
%     y = sin(x*2*pi/size(img, 2)*numperiods)*amplitude + offset;
%     img(sub2ind(size(img), round(y), round(x))) = 1;
%     img = imtranslate(img,[0, floor(rows/2)]);
%     
%     %construct another wave
%     x = 1:0.25:size(img, 2);  
%     y = sin(x*2*pi/size(img, 2)*numperiods)*amplitude + offset;
%     img(sub2ind(size(img), round(y), round(x))) = 1;
%     output = img;