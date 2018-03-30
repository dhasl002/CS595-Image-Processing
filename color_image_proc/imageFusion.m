function output = imageFusion(image1, image2)

[cA1,cH1,cV1,cD1] = dwt2(image1,'db45');
[cA2,cH2,cV2,cD2] = dwt2(image2,'db45');
[row,col]=size(cA1);
cA3 = zeros(row,col);
cH3 = zeros(row,col);
cV3 = zeros(row,col);
cD3 = zeros(row,col);

for i=1:row
   for j=1:col
        cA3(i,j) = (cA1(i,j)+cA2(i,j))./2;
   end
end

for i=1:row
    for j=1:col
        cH3(i,j)=max(cH1(i,j),cH2(i,j));
        cV3(i,j)=max(cV1(i,j),cV2(i,j));
        cD3(i,j)=max(cD1(i,j),cD2(i,j));
    end
end

output = uint8(idwt2(cA3,cH3,cV3,cD3,'db45'));

end