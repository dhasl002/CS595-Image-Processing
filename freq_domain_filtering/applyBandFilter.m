function output = applyBandFilter(img, r1, r2, passType)
    [row, col] = size(img);
    mask = zeros(row, col);
    mask(floor(row/2),floor(col/2)) = 1;
    mask = bwdist(mask);
    ftImage = fftshift(fft2(img));

    if (passType == "pass")
        mask = mask > r1 & mask < r2;
    elseif (passType == "reject")
        mask = mask < r1 | mask > r2;
    end
        output =  uint8(abs(ifft2(ifftshift(ftImage.*mask))));
end