function result = data_display(data,index)
    close all;
    buffer = data(index);
    result = buffer;

    rf1 = buffer.envelope_rf1;
    rf2 = buffer.envelope_rf2;
    
    c = 1540; % speed of sound 1540 m/s
    width = 38; % aperture width 38 mm
    fs = 40e6; % sampling frequency 40 MHz
    
    clim = [120,255];
    
    figure;
    
    subplot(4,4,[1 5 9]);
    imshow(rf1);
    colormap(gray);
    caxis(clim);
    title('rf1 envelope data');
    
    subplot(4,4,[2 6 10]);
    imshow(buffer.roi1);
    title('roi1');
    
    subplot(4,4,[13 14]);
    histogram(buffer.envelope_rf1);
    title('histogram of rf1');
    
    subplot(4,4,[3 7 11]);
    imshow(rf2);
    colormap(gray);
    caxis(clim);
    title('rf2 envelope data');
    
    subplot(4,4,[4 8 12]);
    imshow(buffer.roi2);
    title('roi2');
    
    subplot(4,4,[15 16]);
    histogram(buffer.envelope_rf2);
    title('histogram of rf2');
    
    suptitle(['data of ' num2str(index) ' ']);
end