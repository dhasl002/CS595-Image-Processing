function output = applyRBG(image)
    redLayer = image(:,:,1);
    greenLayer = image(:,:,2);
    blueLayer = image(:,:,3);
    %zeroMat = zeros(size(I,1), size(I,2));
    output = cat(3, redLayer,blueLayer,greenLayer);
end