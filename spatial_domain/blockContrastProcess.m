function output = blockContrastProcess(block_struct)
    global gStd;
    if (std2(block_struct.data) < gStd) 
        output = zeros(size(block_struct.data)); 
    else
        output = block_struct.data;
    end
end