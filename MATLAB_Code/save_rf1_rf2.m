

c = 1540; % speed of sound 1540 m/s
width = 38; % aperture width 38 mm
fs = 40e6; % sampling frequency 40 MHz


for index=1:100
    rf = data(index).rf1;
    z_axis = 1000*linspace(0, size(rf, 1)*.5*c/fs, size(rf, 1)); %in mm
    y_axis = linspace(0, width, size(rf, 2)); % in mm
    envelope_image = 20 * log10(abs(hilbert(rf)));
    data(index).envelope_rf1=envelope_image;
    
    rf = data(index).rf2;
    z_axis = 1000*linspace(0, size(rf, 1)*.5*c/fs, size(rf, 1)); %in mm
    y_axis = linspace(0, width, size(rf, 2)); % in mm
    envelope_image = 20 * log10(abs(hilbert(rf)));
    data(index).envelope_rf2=envelope_image;
end
