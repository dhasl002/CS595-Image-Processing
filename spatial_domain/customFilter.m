function output = customFilter(grayscale, kernel)
    output = zeros(size(grayscale));
    [rows, cols] = size(kernel);
    padMat = padarray(grayscale,[rows, cols]);

    %compute convolution
    for i = 1:size(padMat,1)- rows
        for j =1:size(padMat,2)- cols
            temp = padMat(i:i+rows-1,j:j+cols-1).*kernel;
            output(i,j)=sum(temp(:));
        end
    end
    %Apply averaging filter to reduce ringing
%     sz = size(output);
%     output = edgetaper(output,[sz(1)/4, sz(2)/4]);
end