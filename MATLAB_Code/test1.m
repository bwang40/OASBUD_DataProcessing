close all;

c = 1540; % speed of sound 1540 m/s
width = 38; % aperture width 38 mm
fs = 40e6; % sampling frequency 40 MHz
index = 37;

rf = data(index).rf1;
z_axis = 1000*linspace(0, size(rf, 1)*.5*c/fs, size(rf, 1)); %in mm
y_axis = linspace(0, width, size(rf, 2)); % in mm

roi = data(index).roi1;

%rf(rf<-7000)=0;
%rf(rf>7000)=0;

envelope_data = abs(hilbert(rf));
envelope_image = 20 * log10(envelope_data);

envelope_image = envelope_image;

figure;
imagesc(y_axis, z_axis, envelope_image);

colormap(gray); xlabel('mm'); ylabel('mm');
set(gca,'CLim',[40 80]);
set(gca, 'FontSize', 14)


