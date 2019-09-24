function data_display_label(rf,roi)
    BW = edge(roi,'canny');
    BW=uint8(BW)*255;
    imshow(rf+BW);
    caxis([100 255]);
    
end