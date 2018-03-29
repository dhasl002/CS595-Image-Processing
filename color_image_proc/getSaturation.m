function output = getSaturation(r,g,b)
    [row, col] = size(r);
    sComponent = zeros(row,col);
    for i=1:row
        for j=1:col
            minVal1 = min(r(i,j),g(i,j));
            minVal2 = min(g(i,j),b(i,j));
            minVal3 = min(minVal1,minVal2);
            minVal = min(minVal3, min( r(i,j),b(i,j) ));
            sComponent(i,j) = 1 - ( (3./(r(i,j)+g(i,j)+b(i,j))).*(minVal) );
        end
    end
    output = sComponent;
end