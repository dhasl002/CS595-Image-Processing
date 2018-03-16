function output = getSineNoise(rows, cols, cycles, angle)

output=repmat(sin(linspace(0,cycles*(2*pi),cols)),[rows 1]);
if (angle ~= 0)
    output = imrotate(output,angle);
end
output = 1-output;

end