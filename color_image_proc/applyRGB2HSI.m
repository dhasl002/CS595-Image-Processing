function output = RGB2HSI(image)
    redLayer = image(:,:,1);
    greenLayer = image(:,:,2);
    blueLayer = image(:,:,3);
    H = getHue(redLayer, greenLayer, blueLayer);
    disp(size(H));
    S = getSaturation(redLayer, greenLayer, blueLayer);
    disp(size(S));
    I = (redLayer+greenLayer+blueLayer)./3;
    disp(size(I));
    output = cat(3,H,S,I);
end