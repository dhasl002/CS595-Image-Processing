function output = computeLayersAvg(image)
    redLayer = image(:,:,1);
    greenLayer = image(:,:,2);
    blueLayer = image(:,:,3);
    output = (redLayer+greenLayer+blueLayer)/3;
end