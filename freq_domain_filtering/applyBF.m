function output = applyBF(img, thresh, order)
    h=size(img,1);
    w=size(img,2);
    fftim = fftshift(fft2(double(img)));
    [x, y] = meshgrid(-floor(w/2):floor(w/2)-1,-floor(h/2):floor(h/2)-1);

    B = sqrt(2) - 1; %// Define B
    D = sqrt(x.^2 + y.^2); %// Define distance to centre
    hhp = 1 ./ (1 + B * ((thresh ./ D).^(2 * order)));
    out_spec_centre = fftim .* hhp;

    %// Uncentre spectrum
    out_spec = ifftshift(out_spec_centre);

    %// Inverse FFT, get real components
    out = real(ifft2(out_spec));

    %// Normalize and cast
    out = (out - min(out(:))) / (max(out(:)) - min(out(:)));
    output = uint8(255*out);
end