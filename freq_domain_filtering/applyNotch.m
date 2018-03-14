function output = applyNotch(img, thresh1, thresh2)
    h = size(img,1);
    w = size(img,2);
    [x, y] = meshgrid(-floor(w/2):floor(w/2)-1,-floor(h/2):floor(h/2)-1);
    D = sqrt(x.^2 + y.^2);
    notchFilter = D;
    for i=thresh1:thresh2
        notchFilter = notchFilter >= i & notchFilter <= i;
    end    
    notchFilter = 1-notchFilter;
    
    fftim = fftshift(fft2(double(img)));
    out_spec_centre = fftim .* D;
    out_spec = ifftshift(out_spec_centre);
    out = real(ifft2(out_spec));
    out = (out - min(out(:))) / (max(out(:)) - min(out(:)));
    output = uint8(255*out);
end