function output = getHue(ruint8,guint8,buint8)
    r = double(ruint8);
    g = double(guint8);
    b = double(buint8);
    [row, col] = size(r);
    hComponent = zeros(row, col);
    num = ( (r-g) + (r-b) )/2;
    den = ( (r-g).^2 + (r-b).*(g-b) ).^2;
    hComponent = acos(num./den);
    %hComponent = acos( ( ( (r-g) + (r-b) )/2 )./...
    %    ( ( (r-g).^2 + (r-b).*(g-b) ).^2 ) );
    temp =  b>g;
    for i=1:row
        for j=1:col
            if temp(i,j) == 1
               hComponent(i,j) = 360 - hComponent(i,j); 
            end
        end
    end
    output = uint8(hComponent);
end