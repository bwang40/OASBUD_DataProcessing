function [High8bit,Low8bit] = convert2RGB(raw_data,color)

    data_unsigned_16bit = raw_data + 32768;
    Low8bit = uint8(mod(data_unsigned_16bit,256));
    High8bit = uint8(data_unsigned_16bit./256);
    subplot(1,2,1);imshow(Low8bit);
    subplot(1,2,2);imshow(High8bit);
    
end