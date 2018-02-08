function contrastRegions = extractContrastAreas(grayscaleImage, kernel)
      %Compute global std
      global gStd;
      gStd = std2(grayscaleImage);
      disp(gStd);
        
      getHContrast = @blockContrastProcess;
      block = blockproc(grayscaleImage, kernel, getHContrast);
      contrastRegions = block;
    
end