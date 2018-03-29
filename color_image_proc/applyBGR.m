function output = applyBGR(image)
    redLayer = image(:,:,1);
    greenLayer = image(:,:,2);
    blueLayer = image(:,:,3);
    %zeroMat = zeros(size(I,1), size(I,2));
    output = cat(3, blueLayer, greenLayer, redLayer);

end