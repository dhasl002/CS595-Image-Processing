function output = applyGaussFilter(grayscale, sigma, filterSizeX, filterSizeY)
    [X, Y] = meshgrid(1:filterSizeX, 1:filterSizeY);
    [rows, cols] = size(X);
    
    expComp = -(X.^2+Y.^2)/(2*sigma*sigma);
    kernel= exp(expComp)/(2*pi*sigma*sigma);
    
    output = zeros(size(grayscale));
    padMat = padarray(grayscale,[filterSizeX, filterSizeY]);

    %compute convolution
    for i = 1:size(padMat,1)- rows
        for j =1:size(padMat,2)- cols
            temp = padMat(i:i+rows-1,j:j+cols-1).*kernel;
            output(i,j)=sum(temp(:));
        end
    end
    
    %output = uint8(output);
end