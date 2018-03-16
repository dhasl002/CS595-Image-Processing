function output = applyDeblur(img, len, theta, noise_var)
    PSF = fspecial('motion', len, theta);
    Id = double(img);
    estimated_nsr = noise_var/var(Id(:));
    disp(max(estimated_nsr));
    output = uint8(deconvwnr(Id, PSF, estimated_nsr));

end