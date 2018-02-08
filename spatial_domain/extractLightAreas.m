function lightRegions = extractLightAreas(grayscaleImage, kernel)
%     intensityContainer = containers.Map;
%     [row, col] = size(grayscaleImage);
%     for i=1:row
%         for j=1:col
%             val = grayscaleImage(i,j);
%             isExists = isKey(intensityContainer, val);
%             if (isExists == 0)
%                 intensityContainer(val) = 1;
%             else
%                 intensityContainer(val) = intensityContainer(val) + 1;
%             end
%         end 
%     end
%     disp(intensityContainer);
      
      %Compute global mean
      global gMean;
      gMean = mean2(grayscaleImage);
      disp(gMean);
        
      getLMean = @blockMeanProcess;
      block = blockproc(grayscaleImage, kernel, getLMean);
      lightRegions = block;
    
end