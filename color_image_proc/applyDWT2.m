function [output,cA,cH,cV,cD] = applyDWT2(I)
    [cA,cH,cV,cD] = dwt2(I,'db45');
    decom = figure;
    subplot(2,2,1);
    imagesc(cA);
    %colormap gray
    title('Approximation');
    subplot(2,2,2);
    imagesc(cH);
    %colormap gray
    title('Horizontal');
    subplot(2,2,3);
    imagesc(cV);
    %colormap gray
    title('Vertical');;
    subplot(2,2,4);
    imagesc(cD);
    %colormap gray
    title('Diagonal');
    output = decom;
end