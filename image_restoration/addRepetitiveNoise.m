function [output1, output2] = addRepetitiveNoise(img, noise)
    ftImage = fftshift(fft2(double(img)));
    ftNoise = fftshift(fft2(double(noise)));
    output1 = ftNoise;
    ftNImage = ftImage+ftNoise;
    
    realImage =  real(ifft2(ifftshift(ftNImage)));
    output2 = (realImage - min(realImage(:)))/(max(realImage(:)) - min(realImage(:)));
    output2 = uint8(255*output2);

end