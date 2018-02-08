function output = blockProcess(block_struct)
    global gMean;
    if (mean2(block_struct.data) < gMean) 
        output = zeros(size(block_struct.data)); 
    else
        output = block_struct.data;
    end
end